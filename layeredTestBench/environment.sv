`include "transaction.sv"
`include "uart_generator.sv"
`include "uart_driver.sv"
`include "uart_cov.sv"
class uart_env;
    uart_gen gen;
    uart_driver drv;
    uart_cov cov;
    virtual uart_intf intf;
    mailbox gen2bfm;
    event ended;

    function new(virtual uart_intf intf);
        this.intf = intf;
        gen2bfm = new();
        gen = new(gen2bfm, ended);
        drv = new(intf, gen2bfm);
        cov = new();
    endfunction

    task pre_test;
        drv.reset();
    endtask

    task test;
        fork
            gen.main();
            drv.main();
            cov.main();
        join_any
    endtask

    task post_test;
        wait(ended.triggered);
        wait(gen.repeat_count == drv.no_transactions);
    endtask

    task run;
        pre_test();
        test();
        post_test();
        $finish;
    endtask
endclass
