interface uart_intf(input logic clk, rst);
    logic o_TX_DV;
    logic [7:0] o_TX_Byte;
    logic i_TX_Active;
    logic i_TX_Serial;
    logic i_TX_Done;

    clocking bfm_cb @(posedge clk);
        default input #1 output #1;
        output o_TX_DV, o_TX_Byte;
        input i_TX_Active, i_TX_Serial, i_TX_Done;
    endclocking

    clocking monitor_cb @(posedge clk);
        default input #1 output #1;
        input o_TX_DV, o_TX_Byte;
        output i_TX_Active, i_TX_Serial, i_TX_Done;
    endclocking

    modport BFM(clocking bfm_cb, input clk, rst);
    modport MONITOR(clocking monitor_cb, input clk, rst);
endinterface
