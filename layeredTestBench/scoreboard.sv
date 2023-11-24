class UART_RX_Scoreboard;
  mailbox mon2scb;
  
  function new(mailbox mon2scb);
    this.mon2scb = mon2scb;
  endfunction
  
  task main();
    UART_RX_Transaction trans;
    repeat (1)
      begin
        mon2scb.get(trans);
        
        // Perform checks on received data
        // Example: Verify received start bit, stop bit, and data
        
        if (trans.start_bit == 1'b0 && trans.stop_bit == 1'b1) begin
          $display("UART_RX Scoreboard: Received Data = %h is valid", trans.data);
        end else begin
          $display("UART_RX Scoreboard: Received Data = %h is invalid", trans.data);
        end
      end
  endtask
endclass
