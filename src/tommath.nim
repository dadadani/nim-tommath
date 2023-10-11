import tommath/private/tommath

type BigInt* = object
  value: MpInt

proc `=destroy`*(self: var BigInt) =
  ## Destroy hook: This function is used to call automatically `mp_clear` 
  ##  in order to automatically free the object when it's not being used anymore
  mp_clear(addr self.value)


proc checkErrors(err: MPErr) =
  let errs = mp_error_to_string(err)
  if errs != "Successful":
    raise newException(ValueError, $errs)

proc copy*(a: BigInt): BigInt =
  checkErrors mp_init(addr result.value)

  checkErrors mp_copy(unsafeAddr a.value, addr result.value)

proc `=copy`*(x: var BigInt, y: BigInt) =
  ## Copy hook: this function is used to call automatically `mp_copy`,
  ##  in order to have a different reference to the actual MPInt when an object is copied
  x = copy(y)


proc initBigInt*(value: string, radix: int = 10): BigInt =
  ## Initialize big integer from string
  checkErrors mp_init(addr result.value)
  checkErrors mp_read_radix(addr result.value, cstring(value), cint(radix))

proc initBigInt*(value: int): BigInt =
  checkErrors mp_init_i64(addr result.value, int64(value))

proc initBigInt*(value: int32): BigInt =
  checkErrors mp_init_i32(addr result.value, value)

proc initBigInt*(value: uint32): BigInt =
  checkErrors mp_init_u32(addr result.value, value)

proc initBigInt*(value: int64): BigInt =
  checkErrors mp_init_i64(addr result.value, value)

proc initBigInt*(value: uint64): BigInt =
  checkErrors mp_init_u64(addr result.value, value)

proc initBigIntRandom*(size: int): BigInt =
  ## Initialize a random Big Int with the specified size
  checkErrors mp_init(addr result.value)
  checkErrors mp_rand(addr result.value, cint(size))

proc toString*(self: BigInt, radix: int = 10): string =
  ## Convert Big Int into a string

  var sizePtr: csize_t
  checkErrors mp_radix_size(unsafeAddr self.value, cint(radix), addr sizePtr)

  result.setLen(uint(sizePtr)-1)
  checkErrors mp_to_radix(unsafeAddr self.value, cstring(result), cint(sizePtr), nil, cint(radix))

proc powmod*(base: BigInt, exp: BigInt, modulus: BigInt): BigInt =
  ## Modular exponentation 
  checkErrors mp_init(addr result.value)

  checkErrors mp_exptmod(unsafeAddr base.value, unsafeAddr exp.value, unsafeAddr modulus.value, addr result.value)

proc invmod*(a: BigInt, modulo: BigInt): BigInt =
  ## Compute the modular inverse of `a` modulo `modulus`.
  checkErrors mp_init(addr result.value)
  checkErrors mp_invmod(unsafeAddr a.value, unsafeAddr modulo.value, addr result.value)

proc pow*(a: BigInt, b: int): BigInt =
  ## Computes `a` to the power of `b`
  checkErrors mp_init(addr result.value)
  checkErrors mpExptN(unsafeAddr a.value, cint(b), addr result.value)

proc `shl`*(a: BigInt, b: int): BigInt =
  checkErrors mp_init(addr result.value)
  checkErrors mp_mul_2d(unsafeAddr a.value, cint(b), addr result.value)

proc `shr`*(a: BigInt, b: int): BigInt =
  checkErrors mp_init(addr result.value)
  checkErrors mp_div_2d(unsafeAddr a.value, cint(b), addr result.value, nil)

proc `xor`*(a: BigInt, b: BigInt): BigInt =
  checkErrors mp_init(addr result.value)
  checkErrors mp_xor(unsafeAddr a.value, unsafeAddr b.value, addr result.value)

proc `and`*(a: BigInt, b: BigInt): BigInt =
  checkErrors mp_init(addr result.value)
  checkErrors mp_and(unsafeAddr a.value, unsafeAddr b.value, addr result.value)

proc `or`*(a: BigInt, b: BigInt): BigInt =
  checkErrors mp_init(addr result.value)
  checkErrors mp_or(unsafeAddr a.value, unsafeAddr b.value, addr result.value)

proc `not`*(a: BigInt): BigInt =
  checkErrors mp_init(addr result.value)
  checkErrors mp_complement(unsafeAddr a.value, addr result.value)


proc isPrime*(a: BigInt, rounds: int = 0): bool =
  ## performs `rounds` random rounds of Miller-Rabin on `a` additional to
  ##  bases 2 and 3. Also performs an initial sieve of trial
  ##  division. Determines if `a` is prime with probability
  ##  of error no more than (1/4)^`rounds`.
  ##  Both a strong Lucas-Selfridge to complete the BPSW test
  ##  and a separate Frobenius test are available at compile time.
  ## With `rounds`<0 a deterministic test is run for primes up to
  ##  318665857834031151167461. With `rounds`<13 (abs(t)-13) additional
  ##  tests with sequential small primes are run starting at 43.
  ##  Is Fips 186.4 compliant if called with `rounds` as computed by
  ##  mp_prime_rabin_miller_trials()
  ## 
  ## result is true if `a` is probably prime, false otherwise
  checkErrors mp_prime_is_prime(unsafeAddr a.value, cint(rounds), addr result)
    

proc `$`*(self: BigInt): string = 
  var temp = self
  return toString(temp, 10)

proc `+`*(a: BigInt, b: BigInt): BigInt =
  checkErrors mp_init(addr result.value)
  checkErrors mp_add(unsafeAddr a.value, unsafeAddr b.value, addr result.value)

proc `-`*(a: BigInt, b: BigInt): BigInt =
  checkErrors mp_init(addr result.value)
  checkErrors mp_sub(unsafeAddr a.value, unsafeAddr b.value, addr result.value)

proc `*`*(a: BigInt, b: BigInt): BigInt =
  checkErrors mp_init(addr result.value)
  checkErrors mp_mul(unsafeAddr a.value, unsafeAddr b.value, addr result.value)

proc `div`*(a: BigInt, b: BigInt): BigInt =
  checkErrors mp_init(addr result.value)
  checkErrors mp_div(unsafeAddr a.value, unsafeAddr b.value, addr result.value, nil)

proc `+`*(a: BigInt, b: MPDigit): BigInt =
  checkErrors mp_init(addr result.value)
  checkErrors mp_add_d(unsafeAddr a.value, b, addr result.value)

proc `-`*(a: BigInt, b: MPDigit): BigInt =
  checkErrors mp_init(addr result.value)
  checkErrors mp_sub_d(unsafeAddr a.value, b, addr result.value)

proc `*`*(a: BigInt, b: MPDigit): BigInt =
  checkErrors mp_init(addr result.value)
  checkErrors mp_mul_d(unsafeAddr a.value, b, addr result.value)

proc `div`*(a: BigInt, b: MPDigit): BigInt =
  checkErrors mp_init(addr result.value)
  checkErrors mp_div_d(unsafeAddr a.value, b, addr result.value, nil)



template `/`*(a: BigInt, b: BigInt): BigInt =
  a div b

template `//`*(a: BigInt, b: BigInt): BigInt =
  a div b

proc `+=`*(a: var BigInt, b: BigInt) =
  checkErrors mp_add(addr a.value, unsafeAddr b.value, addr a.value)

proc `-=`*(a: var BigInt, b: BigInt) =
  checkErrors mp_sub(addr a.value, unsafeAddr b.value, addr a.value)

proc `*=`*(a: var BigInt, b: BigInt) =
  checkErrors mp_mul(addr a.value, unsafeAddr b.value, addr a.value)

proc `/=`*(a: var BigInt, b: BigInt) =
  checkErrors mp_div(addr a.value, unsafeAddr b.value, addr a.value, nil)

proc `+=`*(a: var BigInt, b: MPDigit) =
  checkErrors mp_add_d(addr a.value, b, addr a.value)

proc `-=`*(a: var BigInt, b: MPDigit) =
  checkErrors mp_sub_d(addr a.value, b, addr a.value)

proc `*=`*(a: var BigInt, b: MPDigit) =
  checkErrors mp_mul_d(addr a.value, b, addr a.value)

proc `/=`*(a: var BigInt, b: MPDigit) =
  checkErrors mp_div_d(addr a.value, b, addr a.value, nil)


proc `inc`*(a: var BigInt, times: MPDigit = 1) =
  checkErrors mp_add_d(addr a.value, times, addr a.value)

proc `dec`*(a: var BigInt, times: MPDigit = 1) =
  checkErrors mp_sub_d(addr a.value, times, addr a.value)

proc `-`*(a: BigInt): BigInt =
  checkErrors mp_init(addr result.value)
  checkErrors mp_neg(unsafeAddr a.value, addr result.value)


proc `mod`*(a: BigInt, b: BigInt): BigInt =
  checkErrors mp_init(addr result.value)

  checkErrors mp_mod(unsafeAddr a.value, unsafeAddr b.value, addr result.value)

proc abs*(self: BigInt): BigInt =
  checkErrors mp_init(addr result.value)
  checkErrors mp_abs(unsafeAddr self.value, addr result.value)

proc gcd*(a: BigInt, b: BigInt): BigInt =
  checkErrors mp_init(addr result.value)
  checkErrors mp_gcd(unsafeAddr a.value, unsafeAddr b.value, addr result.value)

proc `==`*(a: BigInt, b: BigInt): bool =
  let check = mp_cmp(unsafeAddr a.value, unsafeAddr b.value)
  if check == MP_EQ:
    return true

proc `>`*(a: BigInt, b: BigInt): bool =
  let check = mp_cmp(unsafeAddr a.value, unsafeAddr b.value)
  if check == MP_GT:
    return true

proc `<`*(a: BigInt, b: BigInt): bool =
  let check = mp_cmp(unsafeAddr a.value, unsafeAddr b.value)
  if check == MP_LT:
    return true

proc `>=`*(a: BigInt, b: BigInt): bool =
  let check = mp_cmp(unsafeAddr a.value, unsafeAddr b.value)
  if check == MP_GT or check == MP_EQ:
    return true

proc `<=`*(a: BigInt, b: BigInt): bool =
  let check = mp_cmp(unsafeAddr a.value, unsafeAddr b.value)
  if check == MP_LT or check == MP_EQ:
    return true


proc `==`*(a: BigInt, b: MPDigit): bool =
  let check = mp_cmp_d(unsafeAddr a.value, b)
  if check == MP_EQ:
    return true

proc `>`*(a: BigInt, b: MPDigit): bool =
  let check = mp_cmp_d(unsafeAddr a.value, b)
  if check == MP_GT:
    return true

proc `<`*(a: BigInt, b: MPDigit): bool =
  let check = mp_cmp_d(unsafeAddr a.value, b)
  if check == MP_LT:
    return true

proc `>=`*(a: BigInt, b: MPDigit): bool =
  let check = mp_cmp_d(unsafeAddr a.value, b)
  if check == MP_GT or check == MP_EQ:
    return true

proc `<=`*(a: BigInt, b: MPDigit): bool =
  let check = mp_cmp_d(unsafeAddr a.value, b)
  if check == MP_LT or check == MP_EQ:
    return true


proc min*(a: BigInt, b: BigInt): BigInt =
  if a > b:
    return b
  else:
    return a

proc max*(a: BigInt, b: BigInt): BigInt =
  if a > b:
    return a
  else:
    return b

proc fromBytes*(data: seq[uint8], signed = false): BigInt =
  ## Convert bytes (big endian) into big int

  if signed:
    checkErrors mp_from_sbin(addr result.value, unsafeAddr data[0], csize_t(data.len))
  else:
    checkErrors mp_from_ubin(addr result.value, unsafeAddr data[0], csize_t(data.len))

proc toBytes*(self: BigInt, signed = false): seq[uint8] =
  ## Convert Big Int into bytes (big endian)

  let size = int(mp_sbin_size(unsafeAddr self.value))-1
  result.setLen(size)

  if signed:
    checkErrors mp_to_sbin(unsafeAddr self.value, addr result[0], csize_t(size), nil)
  else:
    checkErrors mp_to_ubin(unsafeAddr self.value, addr result[0], csize_t(size), nil)

  if result[result.low] == 0'u8:
    var cn = 0
    while result[cn+1] == 0'u8:
      inc cn

    result = result[cn..result.high]

type ConvertibleIntegers* = int32|uint32|int64|uint64

proc toInt*[T: ConvertibleIntegers](self: BigInt): T =
  when T is int32:
    return mp_get_i32(unsafeAddr self.value)
  elif T is int64:
    return mp_get_i64(unsafeAddr self.value)
  elif T is uint32:
    return cast[uint32](mp_get_i32(unsafeAddr self.value))
  elif T is uint64:
    return cast[uint64](mp_get_i64(unsafeAddr self.value))


iterator countup*(a, b: BigInt, step: MPDigit = 1): BigInt =
  ## Counts from `a` up to `b` (inclusive) with the given step count.
  var res = a
  while res <= b:
    yield res
    inc(res, step)

iterator countdown*(a, b: BigInt, step: MPDigit = 1): BigInt =
  ## Counts from `a` down to `b` (inclusive) with the given step count.
  var res = a
  while res >= b:
    yield res
    dec(res, step)


iterator `..`*(a, b: BigInt): BigInt =
  ## Counts from `a` up to `b` (inclusive).
  var res = a
  while res <= b:
    yield res
    inc res

iterator `..<`*(a, b: BigInt): BigInt =
  ## Counts from `a` up to `b` (exclusive).
  var res = a
  while res < b:
    yield res
    inc res
