//
// 16ビット加算器
//
`include "Types.v"

module adder( 			// モジュールの宣言 
	output [ `DATA_WIDTH-1:0 ] dst,	// 出力線の宣言 [15:0] に展開される．
	input [ `DATA_WIDTH-1:0 ] srcA,
	input [ `DATA_WIDTH-1:0 ] srcB	// 入力線の宣言
);      

	// 加算
   assign dst = srcA + srcB;  

endmodule				// モジュールの終了