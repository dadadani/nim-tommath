import ../src/tommath

proc main =
  block:
    let a = initBigInt("80003258398985832498598435984398")
    doAssert a.toBytes() == @[3'u8, 241, 200, 120, 73, 232, 251, 31, 37, 86, 170, 77, 148, 14]
    doAssert a.toBytes().fromBytes().toString(2) == "1111110001110010000111100001001001111010001111101100011111001001010101011010101010010011011001010000001110"
  block:
    let a = initBigInt("10000000001000000000", 10)
    let b = initBigInt("10000000001000000000", 10)
    doAssert $(a + b) == "20000000002000000000"
  block:
    doAssert $initBigInt(uint32.high) == "4294967295"
    doAssert $initBigInt(int32.high) == "2147483647"
    doAssert $initBigInt(int64.high) == "9223372036854775807"
    doAssert $initBigInt(uint64.high) == "18446744073709551615"


when isMainModule:
  main()