import ../src/tommath

proc main =
  block:
    let a = initBigInt("8742984328742873432")
    doAssert $pow(a, 2) == "76439774972643473131879008327971458624"
    doAssert $pow(a, 4) == "5843039197868371483587133009912754720558059911415487642857607655954143973376"

  block:
    doAssert isPrime(initBigInt("5879"))
  block:
    var a = initBigInt("faaaaaaffaaaaaaffaaaaaaf", 16)
    var b = initBigInt("10101001010101001", 16)
    doAssert gcd(a, b) == 4097
  block:
    var a = initBigInt("1000000007")
    var b = initBigInt("1234567")
    doAssert invmod(a, b) == 13401
    var c = initBigInt("2", 10)
    var d = initBigInt("10", 10)
    doAssertRaises ValueError, (discard invmod(c, d))
  block:
    doAssert powmod(initBigInt("3"), initBigInt("5353298235368615715086015989500386287229041352472878638071518666228109600330630011721412968955794129220900515437949650083539753416976065858168797034438041953432098671933385654459949759916692249948136470581833023646089705937609998186267612873792624931572076651507178185195496822727062814431558558200731675762237505627859229808348408417805267472578881525847798784260164598636480829749664441945255164579524883980750891720882036701554976549860300202114749723141961486427137188380250834468000036033392412994077172956841103525797390019597180655219915585699771458390767411239503401306475092402193456770859145072367454040329"), initBigInt("25135566567101483196994790440833279750474660393232382279277736257066266618532493517139001963526957179514521981877335815379755618191324858392834843718048308951653115284529736874534289456833723962912807104017411854314007953484461899139734367756070456068592886771130491355511301923675421649355211882120329692353507392677087555292357140606251171702417804959957862991259464749806480821163999054978911727901705780417863120490095024926067731615229486812312187386108568833026386220686253160504779704721744600638258183939573405528962511242337923530869616215532193967628076922234051908977996352800560160181197923404454023908443")) == initBigInt("14522070018018763240565479200141732636552091238611904560170774429735212636774930696514977110787466051505893927569897949332332044172344856270470496473145672006585550702264002447700612797312247176513802724353276508545707064751324758542671778935692976498955489418843811562313176880433862573545097275723425440335237120879341086861088279065591520474250896490253147530458433718887361765982314449793698032938852850996358368948913411489756092880828078764257012425731190516123597537324201237292671136241179472290349377233318969983366767402100109485092184487475351274881288682126517629511753785832962587793837807991716040453840")






when isMainModule:
  main()