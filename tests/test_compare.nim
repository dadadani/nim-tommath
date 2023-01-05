import ../src/tommath

proc main =
  doAssert initBigInt("5a", 16) == 90
  let a = initBigInt("60")
  doAssert a == 60 and a >= 60 and a <= 60 and a > 1 and a < 70 and a <= 71
  doAssert initBigInt("9843989539659864987345") < initBigInt("5398598436539859843653985984365398598436")
  doAssert initBigInt("5398598436539859843653985984365398598436") == initBigInt("5398598436539859843653985984365398598436")
  doAssert initBigInt("100000011") != initBigInt("10000001")
  doAssert initBigInt("fffafafafafafafafafafafafafafafa", 16) == initBigInt("340256303626903465112925513175684283130")

  doAssert min(initBigInt("5398598436539859843653985984365398598436"), initBigInt("1")) == 1
  doAssert $max(initBigInt("539859843653985984365398598436539859843"), initBigInt("5398598436539859843653985984365398598436")) == "5398598436539859843653985984365398598436"

when isMainModule:
  main()