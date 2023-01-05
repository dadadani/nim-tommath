import ../src/tommath

proc main =
    block:
        let a = initBigInt("ffff3fffffffaeb", 16)
        let b = initBigInt("5a45affffffffffff", 16)
        
        doAssert (a + b).toString(16) == "5B45AF3FFFFFFFAEA"
    block:
        let a = initBigInt("984539545354398543984539545354398543")
        let b = initBigInt("853942096472485394209647248539420964724")
        doAssert (a - b).toString(8) == "-12015432314743767060671601032152623133646045"
    block:
        let a = initBigInt("429349283598434325436429349283598434325436")
        let b = initBigInt("319019065483489250936459845429349283598434325436429349283598434325436")
        doAssert (b div a).toString(10) == "743029225086268649579661317"
        doAssert (b mod a).toString(10) == "309600798163259825398375084287414195966224"
    block: 
        let a = initBigInt("aeeefcfcfcfcfc", 16)
        let b = initBigInt("aeeefcaaaaaaa", 16)
        doAssert (b * a).toString(2) == "11101111000100110111110110010110000011110000011011110111000110010101110001011010111010101110101011101011000"
    block:
        var a = initBigInt("11111111111111111111111111111")
        inc a
        doAssert a == initBigInt("11111111111111111111111111112")
        dec(a, 2)
        doAssert a == initBigInt("11111111111111111111111111110")
        a = a + 9
        doAssert a == initBigInt("11111111111111111111111111119")
        a = a - 8
        doAssert a == initBigInt("11111111111111111111111111111")
        a *= 2
        doAssert $a == "22222222222222222222222222222"
        a /= initBigInt("2")
        doAssert a.toString(2) == "1000111110011011100101010011000100010100001100101011010100111101100111000111000111000111000111"
        a = a * 10
        doAssert $a == "111111111111111111111111111110"
        var b = a
        inc(a)
        doAssert $b == "111111111111111111111111111110"
        doAssert $a == "111111111111111111111111111111"
        a = -a
        doAssert $a == "-111111111111111111111111111111"
        doAssert $abs(a) == "111111111111111111111111111111"


when isMainModule:
    main()
