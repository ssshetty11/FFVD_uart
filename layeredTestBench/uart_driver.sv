class uart_driver;
    virtual uart_intf intf;
    mailbox gen2bfm;
    int no_transactions;

    function new(virtual uart_intf intf, mailbox gen2bfm);
        this.intf = intf;
        this.gen2bfm = gen2bfm;
    endfunction

    task reset;
        wait(intf.rst)
            $display("Reset Initiated");
        // Reset UART-related signals if needed
        // Example: intf.rx_serial <= 1'b0; // Reset RX signal
        wait(!intf.rst)
            $display("Reset Finished");
    endtask

    task main;
        forever begin
            uart_trans trans;
            gen2bfm.get(trans);
            $display("Transaction No. = %0d", no_transactions);

            // Drive UART signals based on transaction data
            intf.start_bit <= trans.start_bit;
            intf.data_bits <= trans.data_bits;
            intf.stop_bit <= trans.stop_bit;

            // Simulate clock cycles or behavior in response to signals
            repeat (2) @(posedge intf.clock);

            // Optionally, capture outputs or update transaction data
            trans.data_valid <= intf.data_valid;

            trans.display();
            no_transactions++;
        end
    endtask
endclass
