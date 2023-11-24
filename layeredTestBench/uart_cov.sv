class uart_cov;
    uart_trans trans = new();
    covergroup cov_inst;
        option.per_instance = 1;

        start_bit_cg: coverpoint trans.start_bit {
            bins start_bit_bin = {0, 1};
        }
        
        data_bits_cg: coverpoint trans.data_bits {
            bins data_bits_bin = {[0:255]};
        }
        
        stop_bit_cg: coverpoint trans.stop_bit {
            bins stop_bit_bin = {0, 1};
        }
        
        data_valid_cg: coverpoint trans.data_valid {
            bins data_valid_bin = {0, 1};
        }
    endgroup

    function new();
        cov_inst = new();
    endfunction

    task main;
        cov_inst.sample();
    endtask
endclass
