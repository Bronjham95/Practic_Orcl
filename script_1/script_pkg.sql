CREATE OR REPLACE PACKAGE parallel_ptf_bid AS


  TYPE t_parallel_row IS RECORD(
    log_records  NUMBER,
    log_bids     NUMBER,
    begin_time   date,
    end_time     date);

  TYPE t_parallel_tab IS TABLE OF t_parallel_row;


  TYPE t_parallel_bid_ref_cursor IS REF CURSOR RETURN tmp_armiv27366_bid%ROWTYPE;


  FUNCTION bid_ptf(p_cursor IN t_parallel_bid_ref_cursor)
    RETURN t_parallel_tab
    PIPELINED
    PARALLEL_ENABLE(PARTITION p_cursor BY HASH(bid));

END parallel_ptf_bid;


CREATE OR REPLACE PACKAGE BODY parallel_ptf_bid AS
  FUNCTION bid_ptf(p_cursor IN t_parallel_bid_ref_cursor)
    RETURN t_parallel_tab
    PIPELINED
    PARALLEL_ENABLE(PARTITION p_cursor BY HASH(bid)) IS
    PRAGMA AUTONOMOUS_TRANSACTION;
  
    l_bid        tmp_armiv27366_bid%ROWTYPE;
    l_row        t_parallel_row;
    v_rows       number;
    
  BEGIN
    l_row.log_records := 0;
    l_row.log_bids    := 0;
    -- начало работы
    l_row.begin_time := SYSDATE;
    LOOP
      FETCH p_cursor
        INTO l_bid;
      EXIT WHEN p_cursor%NOTFOUND;
      l_row.log_bids := l_row.log_bids + 1;

      INSERT INTO /*+ append */
      tmp_armiv27366_log
        (bid, contract_id, version, add_agreement_id, record_date)
        SELECT l_bid.bid,
               contract_id,
               version,
               add_agreement_id,
               record_date
          FROM rsa.contr_log4rsa
         WHERE contract_id LIKE l_bid.bid || '%';
   
      v_rows := SQL%ROWCOUNT;
    
      UPDATE tmp_armiv27366_bid SET is_processed = 1, log_records = v_rows;
    
      COMMIT;
      l_row.log_records := l_row.log_records + v_rows;
    END LOOP;
        -- конец работы
        l_row.end_time := SYSDATE;
  
    PIPE ROW(l_row);
  
    RETURN;
  END bid_ptf;
END parallel_ptf_bid;
/