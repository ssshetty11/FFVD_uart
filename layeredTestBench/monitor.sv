class UART_RX_Monitor;
  virtual intf vif;
  mailbox mon2scb;
  
  function new(virtual intf vif, mailbox mon2scb);
    this.vif = vif;
    this.mon2scb = mon2scb;
  endfunction
  
  task main();
    UART_RX_Transaction trans;
    repeat (1)
      begin
        @(posedge vif.MONITOR.clk);
        
        // Monitoring the signals
        trans = new();
        trans.data = vif.MONITOR.monitor_cb.j; // Assuming j maps to data
        trans.start_bit = vif.MONITOR.monitor_cb.k; // Assuming k maps to start_bit
        trans.stop_bit = vif.MONITOR.monitor_cb.q; // Assuming q maps to stop_bit
        
        mon2scb.put(trans);
        trans.display("UART_RX_MONITOR");
      end
  endtask
endclass
