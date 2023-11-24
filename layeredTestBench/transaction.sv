class uart_trans;
    rand logic start_bit;
    rand logic [7:0] data_bits;
    rand logic stop_bit;
    logic data_valid;

    function void display();
        $display("------------------------------------------------------");
        $display("\t Start Bit = %0b, \t Data Bits = %0h, \t Stop Bit = %0b, \t Data Valid = %0b",
                  start_bit, data_bits, stop_bit, data_valid);
        $display("------------------------------------------------------");
    endfunction
endclass
