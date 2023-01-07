import tommath/bindings

type BigInt* = object
  value: ptr MPInt

proc `=destroy`*(self: var BigInt) =
  ## Destroy hool: This function is used to call automatically `mp_clear` 
  ##  in order to automatically free the object when it's not being used anymore
  if not isNil(self.value):
    mp_clear(self.value)
    self.value = nil


proc checkErrors(err: MPErr) =
  let errs = mp_error_to_string(err)
  if errs != "Successful":
    raise newException(ValueError, $errs)

proc copy*(a: BigInt): BigInt =
  result.value = create(MPInt, sizeof(MPInt))
  checkErrors mp_init(result.value)

  checkErrors mp_copy(a.value, result.value)

proc `=copy`*(x: var BigInt, y: BigInt) =
  ## Copy hook: this function is used to call automatically `mp_copy`,
  ##  in order to have a different reference to the actual MPInt when an object is copied
  x = copy(y)


proc initBigInt*(value: string, radix: int = 10): BigInt =
  ## Initialize big integer from string
  result = BigInt(value: create(MPInt, sizeof(MPInt)))
  checkErrors mp_init(result.value)
  checkErrors mp_read_radix(result.value, cstring(value), cint(radix))

proc initBigInt*(value: int): BigInt =
  result = BigInt(value: create(MPInt, sizeof(MPInt)))
  checkErrors mp_init_i64(result.value, int64(value))

proc initBigInt*(value: int32): BigInt =
  result = BigInt(value: create(MPInt, sizeof(MPInt)))
  checkErrors mp_init_i32(result.value, value)

proc initBigInt*(value: uint32): BigInt =
  result = BigInt(value: create(MPInt, sizeof(MPInt)))
  checkErrors mp_init_u32(result.value, value)

proc initBigInt*(value: int64): BigInt =
  result = BigInt(value: create(MPInt, sizeof(MPInt)))
  checkErrors mp_init_i64(result.value, value)

proc initBigInt*(value: uint64): BigInt =
  result = BigInt(value: create(MPInt, sizeof(MPInt)))
  checkErrors mp_init_u64(result.value, value)

proc initBigIntRandom*(size: int): BigInt =
  ## Initialize a random Big Int with the specified size
  result = BigInt(value: create(MPInt, sizeof(MPInt)))
  discard mp_rand(result.value, cint(size))

proc toString*(self: BigInt, radix: int = 10): string =
  ## Convert Big Int into a string

  var sizePtr = create(csize_t, 1)
  checkErrors mp_radix_size(self.value, cint(radix), sizePtr)
  var size = int(0)
  copyMem(addr size, sizePtr, sizeof(csize_t))
  result.setLen(size-1)
  checkErrors mp_to_radix(self.value, cstring(result), csize_t(size), nil, cint(radix))

proc powmod*(base: BigInt, exp: BigInt, modulus: BigInt): BigInt =
  ## Modular exponentation 
  result = BigInt(value: create(MPInt, sizeof(MPInt)))
  checkErrors mp_init(result.value)

  checkErrors mp_exptmod(base.value, exp.value, modulus.value, result.value)

proc invmod*(a: BigInt, modulo: BigInt): BigInt =
  ## Compute the modular inverse of `a` modulo `modulus`.
  result = BigInt(value: create(MPInt, sizeof(MPInt)))
  checkErrors mp_init(result.value)
  checkErrors mp_invmod(a.value, modulo.value, result.value)

proc pow*(a: BigInt, b: int): BigInt =
  ## Computes `a` to the power of `b`
  result = BigInt(value: create(MPInt, sizeof(MPInt)))
  checkErrors mp_init(result.value)
  checkErrors mp_expt_n(a.value, cint(b), result.value)

proc `shl`*(a: BigInt, b: int): BigInt =
  result = BigInt(value: create(MPInt, sizeof(MPInt)))
  checkErrors mp_init(result.value)
  checkErrors mp_mul_2d(a.value, cint(b), result.value)

proc `shr`*(a: BigInt, b: int): BigInt =
  result = BigInt(value: create(MPInt, sizeof(MPInt)))
  checkErrors mp_init(result.value)
  checkErrors mp_div_2d(a.value, cint(b), result.value, nil)

proc `xor`*(a: BigInt, b: BigInt): BigInt =
  result = BigInt(value: create(MPInt, sizeof(MPInt)))
  checkErrors mp_init(result.value)
  checkErrors mp_xor(a.value, b.value, result.value)

proc `and`*(a: BigInt, b: BigInt): BigInt =
  result = BigInt(value: create(MPInt, sizeof(MPInt)))
  checkErrors mp_init(result.value)
  checkErrors mp_and(a.value, b.value, result.value)

proc `or`*(a: BigInt, b: BigInt): BigInt =
  result = BigInt(value: create(MPInt, sizeof(MPInt)))
  checkErrors mp_init(result.value)
  checkErrors mp_or(a.value, b.value, result.value)

proc `not`*(a: BigInt): BigInt =
  result = BigInt(value: create(MPInt, sizeof(MPInt)))
  checkErrors mp_init(result.value)
  checkErrors mp_complement(a.value, result.value)


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
  var res = create(cint, 1)
  checkErrors mp_prime_is_prime(a.value, cint(rounds), res)
  if res[] > 0:
    result = true
  dealloc(res)
    

proc `$`*(self: BigInt): string = toString(self, 10)

proc `+`*(a: BigInt, b: BigInt): BigInt =
  result = BigInt(value: create(MPInt, sizeof(MPInt)))
  checkErrors mp_init(result.value)
  checkErrors mp_add(a.value, b.value, result.value)

proc `-`*(a: BigInt, b: BigInt): BigInt =
  result = BigInt(value: create(MPInt, sizeof(MPInt)))
  checkErrors mp_init(result.value)
  checkErrors mp_sub(a.value, b.value, result.value)

proc `*`*(a: BigInt, b: BigInt): BigInt =
  result = BigInt(value: create(MPInt, sizeof(MPInt)))
  checkErrors mp_init(result.value)
  checkErrors mp_mul(a.value, b.value, result.value)

proc `div`*(a: BigInt, b: BigInt): BigInt =
  result = BigInt(value: create(MPInt, sizeof(MPInt)))
  checkErrors mp_init(result.value)
  checkErrors mp_div(a.value, b.value, result.value, nil)

proc `+`*(a: BigInt, b: MPDigit): BigInt =
  result = BigInt(value: create(MPInt, sizeof(MPInt)))
  checkErrors mp_init(result.value)
  checkErrors mp_add_d(a.value, b, result.value)

proc `-`*(a: BigInt, b: MPDigit): BigInt =
  result = BigInt(value: create(MPInt, sizeof(MPInt)))
  checkErrors mp_init(result.value)
  checkErrors mp_sub_d(a.value, b, result.value)

proc `*`*(a: BigInt, b: MPDigit): BigInt =
  result = BigInt(value: create(MPInt, sizeof(MPInt)))
  checkErrors mp_init(result.value)
  checkErrors mp_mul_d(a.value, b, result.value)

proc `div`*(a: BigInt, b: MPDigit): BigInt =
  result = BigInt(value: create(MPInt, sizeof(MPInt)))
  checkErrors mp_init(result.value)
  checkErrors mp_div_d(a.value, b, result.value, nil)



template `/`*(a: BigInt, b: BigInt): BigInt =
  a div b

template `//`*(a: BigInt, b: BigInt): BigInt =
  a div b

proc `+=`*(a: var BigInt, b: BigInt) =
  checkErrors mp_add(a.value, b.value, a.value)

proc `-=`*(a: var BigInt, b: BigInt) =
  checkErrors mp_sub(a.value, b.value, a.value)

proc `*=`*(a: var BigInt, b: BigInt) =
  checkErrors mp_mul(a.value, b.value, a.value)

proc `/=`*(a: var BigInt, b: BigInt) =
  checkErrors mp_div(a.value, b.value, a.value, nil)

proc `+=`*(a: var BigInt, b: MPDigit) =
  checkErrors mp_add_d(a.value, b, a.value)

proc `-=`*(a: var BigInt, b: MPDigit) =
  checkErrors mp_sub_d(a.value, b, a.value)

proc `*=`*(a: var BigInt, b: MPDigit) =
  checkErrors mp_mul_d(a.value, b, a.value)

proc `/=`*(a: var BigInt, b: MPDigit) =
  checkErrors mp_div_d(a.value, b, a.value, nil)


proc `inc`*(a: var BigInt, times: MPDigit = 1) =
  checkErrors mp_add_d(a.value, times, a.value)

proc `dec`*(a: var BigInt, times: MPDigit = 1) =
  checkErrors mp_sub_d(a.value, times, a.value)

proc `-`*(a: BigInt): BigInt =
  result = BigInt(value: create(MPInt, sizeof(MPInt)))
  checkErrors mp_init(result.value)
  checkErrors mp_neg(a.value, result.value)


proc `mod`*(a: BigInt, b: BigInt): BigInt =
  result = BigInt(value: create(MPInt, sizeof(MPInt)))
  checkErrors mp_init(result.value)

  checkErrors mp_mod(a.value, b.value, result.value)

proc abs*(self: BigInt): BigInt =
  result = BigInt(value: create(MPInt, sizeof(MPInt)))
  checkErrors mp_init(result.value)
  checkErrors mp_abs(self.value, result.value)

proc gcd*(a: BigInt, b: BigInt): BigInt =
  result = BigInt(value: create(MPInt, sizeof(MPInt)))
  checkErrors mp_init(result.value)
  checkErrors mp_gcd(a.value, b.value, result.value)

proc `==`*(a: BigInt, b: BigInt): bool =
  let check = mp_cmp(a.value, b.value)
  if check == 0:
    return true

proc `>`*(a: BigInt, b: BigInt): bool =
  let check = mp_cmp(a.value, b.value)
  if check == 1:
    return true

proc `<`*(a: BigInt, b: BigInt): bool =
  let check = mp_cmp(a.value, b.value)
  if check == -1:
    return true

proc `>=`*(a: BigInt, b: BigInt): bool =
  let check = mp_cmp(a.value, b.value)
  if check == 1 or check == 0:
    return true

proc `<=`*(a: BigInt, b: BigInt): bool =
  let check = mp_cmp(a.value, b.value)
  if check == -1 or check == 0:
    return true


proc `==`*(a: BigInt, b: MPDigit): bool =
  let check = mp_cmp_d(a.value, b)
  if check == 0:
    return true

proc `>`*(a: BigInt, b: MPDigit): bool =
  let check = mp_cmp_d(a.value, b)
  if check == 1:
    return true

proc `<`*(a: BigInt, b: MPDigit): bool =
  let check = mp_cmp_d(a.value, b)
  if check == -1:
    return true

proc `>=`*(a: BigInt, b: MPDigit): bool =
  let check = mp_cmp_d(a.value, b)
  if check == 1 or check == 0:
    return true

proc `<=`*(a: BigInt, b: MPDigit): bool =
  let check = mp_cmp_d(a.value, b)
  if check == -1 or check == 0:
    return true


proc min*(a: BigInt, b: BigInt): BigInt =
  if a > b:
    return b.copy()
  else:
    return a.copy()

proc max*(a: BigInt, b: BigInt): BigInt =
  if a > b:
    return a.copy()
  else:
    return b.copy()

proc fromBytes*(data: seq[uint8], signed = false): BigInt =
  ## Convert bytes (big endian) into big int

  result = BigInt(value: create(MPInt, sizeof(MPInt)))
  var dataPtr = create(UncheckedArray[uint8], data.len)
  copyMem(addr dataPtr[0], unsafeAddr data[0], data.len)
  if signed:
    checkErrors mp_from_sbin(result.value, dataPtr, csize_t(data.len))
  else:
    checkErrors mp_from_ubin(result.value, dataPtr, csize_t(data.len))
  dealloc(dataPtr)

proc toBytes*(self: BigInt, signed = false): seq[uint8] =
  ## Convert Big Int into bytes (big endian)

  let size = int(mp_sbin_size(self.value))-1
  result.setLen(size)
  var dataPtr = create(UncheckedArray[uint8], size)
  if signed:
    checkErrors mp_to_sbin(self.value, dataPtr, csize_t(size), nil)
  else:
    checkErrors mp_to_ubin(self.value, dataPtr, csize_t(size), nil)

  copyMem(addr result[0], addr dataPtr[0], size)
  dealloc(dataPtr)
  if result[result.low] == 0'u8:
    var cn = 0
    while result[cn+1] == 0'u8:
      inc cn

    result = result[cn..result.high]

type ConvertibleIntegers* = int32|uint32|int64|uint64

proc toInt*[T: ConvertibleIntegers](self: BigInt): T =
  when T is int32:
    return mp_get_i32(self.value)
  elif T is int64:
    return mp_get_i64(self.value)
  elif T is uint32:
    return cast[uint32](mp_get_i32(self.value))
  elif T is uint64:
    return cast[uint64](mp_get_i64(self.value))


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
