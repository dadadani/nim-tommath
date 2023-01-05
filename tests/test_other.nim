import ../src/tommath

proc main =
  block:
    var increm = initBigInt(0)
    for i in initBigInt(0)..initBigInt("8000"):
        inc increm
    doAssert increm == 8001
    increm = initBigInt(0)
    for i in initBigInt(0)..<initBigInt("8000"):
        inc increm
    doAssert increm == 8000
    increm = initBigInt(0)
    for i in countdown(initBigInt("9"), initBigInt("8000")):
        inc increm
    doAssert increm == 0
    increm = initBigInt(0)
    for i in countup(initBigInt("0"), initBigInt("8000")):
        inc increm
    doAssert increm == 8001

when isMainModule:
  main()