import ../src/tommath

proc main =
    doAssert (initBigInt(1) shl 2) == 4
    doAssert (initBigInt(1024) shr 2) == 256
    doAssert (initBigInt(1024) shr 2) == 256
    doAssert (initBigInt(1) shl 128) == initBigInt("340282366920938463463374607431768211456")
    doAssert (initBigInt("5398598436539859843653985984365398598436") xor initBigInt("59485943985366487643")) == initBigInt("5398598436539859843601494131170691903871")
    doAssert (initBigInt("9843989539659864987345") and initBigInt("11001", 2)) == 17
    doAssert (initBigInt("770700770", 8) or initBigInt("1a6af", 16)) == 132360191

when isMainModule:
    main()
