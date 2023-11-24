`include "enviroment.sv" // Assuming the UART-specific environment

module uart_test(uart_intf intf);
    uart_env env;
    initial begin
        env = new(intf);
        env.gen.repeat_count = 10; // Set the repeat count for UART transactions
        env.run();
    end
endmodule
