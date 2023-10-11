when defined(useExternalTommath):
      {.passL: "-ltommath".}
else: 
    import compile
    
type
  MpDigit* = uint
  MpSign* {.size: sizeof(cint).} = enum
    MP_ZPOS = 0, MP_NEG = 1
  MpOrd* {.size: sizeof(cint).} = enum
    MP_LT = -1, MP_EQ = 0, MP_GT = 1
  MpErr* {.size: sizeof(cint).} = enum
    MP_OVF = -6, MP_BUF = -5, MP_ITER = -4, MP_VAL = -3, MP_MEM = -2, MP_ERR_ERR = -1, MP_OKAY = 0
  MpOrder* {.size: sizeof(cint).} = enum
    MP_LSB_FIRST = -1, MP_MSB_FIRST = 1
  MpEndian* {.size: sizeof(cint).} = enum
    MP_LITTLE_ENDIAN = -1, MP_NATIVE_ENDIAN = 0, MP_BIG_ENDIAN = 1


type
  MpInt* {.importc: "mp_int", header: "tommath.h", bycopy.} = object
    used* {.importc: "used".}: cint
    alloc* {.importc: "alloc".}: cint
    sign* {.importc: "sign".}: MpSign
    dp* {.importc: "dp".}: ptr MpDigit



proc mpErrorToString*(code: MpErr): cstring {.cdecl, importc: "mp_error_to_string",
    header: "tommath.h".}

proc mpInit*(a: ptr MpInt): MpErr {.cdecl, importc: "mp_init", header: "tommath.h".}

proc mpClear*(a: ptr MpInt) {.cdecl, importc: "mp_clear", header: "tommath.h".}

proc mpInitMulti*(mp: ptr MpInt): MpErr {.varargs, cdecl, importc: "mp_init_multi",
                                     header: "tommath.h".}

proc mpClearMulti*(mp: ptr MpInt) {.varargs, cdecl, importc: "mp_clear_multi",
                                header: "tommath.h".}

proc mpExch*(a: ptr MpInt; b: ptr MpInt) {.cdecl, importc: "mp_exch", header: "tommath.h".}

proc mpShrink*(a: ptr MpInt): MpErr {.cdecl, importc: "mp_shrink", header: "tommath.h".}

proc mpGrow*(a: ptr MpInt; size: cint): MpErr {.cdecl, importc: "mp_grow",
    header: "tommath.h".}

proc mpInitSize*(a: ptr MpInt; size: cint): MpErr {.cdecl, importc: "mp_init_size",
    header: "tommath.h".}

template mpIszero*(a: untyped): untyped =
  ((a).used == 0)

template mpIsone*(a: untyped): untyped =
  (((a).sign == mp_Zpos) and ((a).used == 1'u) and ((a).dp[0] == 1'u))

template mpIsneg*(a: untyped): untyped =
  ((a).sign == mp_Neg)

template mpIseven*(a: untyped): untyped =
  (((a).used == 0) or (((a).dp[0] and 1'u) == 0'u))

template mpIsodd*(a: untyped): untyped =
  (not mpIseven(a))


proc mpZero*(a: ptr MpInt) {.cdecl, importc: "mp_zero", header: "tommath.h".}

proc mpGetDouble*(a: ptr MpInt): cdouble {.cdecl, importc: "mp_get_double",
                                      header: "tommath.h".}
proc mpSetDouble*(a: ptr MpInt; b: cdouble): MpErr {.cdecl, importc: "mp_set_double",
    header: "tommath.h".}

proc mpGetI32*(a: ptr MpInt): int32 {.cdecl, importc: "mp_get_i32", header: "tommath.h".}
proc mpSetI32*(a: ptr MpInt; b: int32) {.cdecl, importc: "mp_set_i32",
                                    header: "tommath.h".}
proc mpInitI32*(a: ptr MpInt; b: int32): MpErr {.cdecl, importc: "mp_init_i32",
    header: "tommath.h".}

template mpGetU32*(a: untyped): untyped =
  (cast[uint32](mpGetI32(a)))

proc mpSetU32*(a: ptr MpInt; b: uint32) {.cdecl, importc: "mp_set_u32",
                                     header: "tommath.h".}
proc mpInitU32*(a: ptr MpInt; b: uint32): MpErr {.cdecl, importc: "mp_init_u32",
    header: "tommath.h".}

proc mpGetI64*(a: ptr MpInt): int64 {.cdecl, importc: "mp_get_i64", header: "tommath.h".}
proc mpSetI64*(a: ptr MpInt; b: int64) {.cdecl, importc: "mp_set_i64",
                                    header: "tommath.h".}
proc mpInitI64*(a: ptr MpInt; b: int64): MpErr {.cdecl, importc: "mp_init_i64",
    header: "tommath.h".}

template mpGetU64*(a: untyped): untyped =
  (cast[uint64](mpGetI64(a)))

proc mpSetU64*(a: ptr MpInt; b: uint64) {.cdecl, importc: "mp_set_u64",
                                     header: "tommath.h".}
proc mpInitU64*(a: ptr MpInt; b: uint64): MpErr {.cdecl, importc: "mp_init_u64",
    header: "tommath.h".}

proc mpGetMagU32*(a: ptr MpInt): uint32 {.cdecl, importc: "mp_get_mag_u32",
                                      header: "tommath.h".}
proc mpGetMagU64*(a: ptr MpInt): uint64 {.cdecl, importc: "mp_get_mag_u64",
                                      header: "tommath.h".}
proc mpGetMagUl*(a: ptr MpInt): culong {.cdecl, importc: "mp_get_mag_ul",
                                    header: "tommath.h".}

proc mpGetL*(a: ptr MpInt): clong {.cdecl, importc: "mp_get_l", header: "tommath.h".}
proc mpSetL*(a: ptr MpInt; b: clong) {.cdecl, importc: "mp_set_l", header: "tommath.h".}
proc mpInitL*(a: ptr MpInt; b: clong): MpErr {.cdecl, importc: "mp_init_l",
                                        header: "tommath.h".}

template mpGetUl*(a: untyped): untyped =
  (cast[culong](mpGetL(a)))

proc mpSetUl*(a: ptr MpInt; b: culong) {.cdecl, importc: "mp_set_ul", header: "tommath.h".}
proc mpInitUl*(a: ptr MpInt; b: culong): MpErr {.cdecl, importc: "mp_init_ul",
    header: "tommath.h".}

proc mpSet*(a: ptr MpInt; b: MpDigit) {.cdecl, importc: "mp_set", header: "tommath.h".}
proc mpInitSet*(a: ptr MpInt; b: MpDigit): MpErr {.cdecl, importc: "mp_init_set",
    header: "tommath.h".}

proc mpCopy*(a: ptr MpInt; b: ptr MpInt): MpErr {.cdecl, importc: "mp_copy",
    header: "tommath.h".}

proc mpInitCopy*(a: ptr MpInt; b: ptr MpInt): MpErr {.cdecl, importc: "mp_init_copy",
    header: "tommath.h".}

proc mpClamp*(a: ptr MpInt) {.cdecl, importc: "mp_clamp", header: "tommath.h".}

proc mpUnpack*(rop: ptr MpInt; count: csize_t; order: MpOrder; size: csize_t;
              endian: MpEndian; nails: csize_t; op: pointer): MpErr {.cdecl,
    importc: "mp_unpack", header: "tommath.h".}

proc mpPackCount*(a: ptr MpInt; nails: csize_t; size: csize_t): csize_t {.cdecl,
    importc: "mp_pack_count", header: "tommath.h".}
proc mpPack*(rop: pointer; maxcount: csize_t; written: ptr csize_t; order: MpOrder;
            size: csize_t; endian: MpEndian; nails: csize_t; op: ptr MpInt): MpErr {.
    cdecl, importc: "mp_pack", header: "tommath.h".}

proc mpRshd*(a: ptr MpInt; b: cint) {.cdecl, importc: "mp_rshd", header: "tommath.h".}

proc mpLshd*(a: ptr MpInt; b: cint): MpErr {.cdecl, importc: "mp_lshd",
                                      header: "tommath.h".}

proc mpDiv2d*(a: ptr MpInt; b: cint; c: ptr MpInt; d: ptr MpInt): MpErr {.cdecl,
    importc: "mp_div_2d", header: "tommath.h".}

proc mpDiv2*(a: ptr MpInt; b: ptr MpInt): MpErr {.cdecl, importc: "mp_div_2",
    header: "tommath.h".}

proc mpMul2d*(a: ptr MpInt; b: cint; c: ptr MpInt): MpErr {.cdecl, importc: "mp_mul_2d",
    header: "tommath.h".}

proc mpMul2*(a: ptr MpInt; b: ptr MpInt): MpErr {.cdecl, importc: "mp_mul_2",
    header: "tommath.h".}

proc mpMod2d*(a: ptr MpInt; b: cint; c: ptr MpInt): MpErr {.cdecl, importc: "mp_mod_2d",
    header: "tommath.h".}

proc mp2expt*(a: ptr MpInt; b: cint): MpErr {.cdecl, importc: "mp_2expt",
                                       header: "tommath.h".}

proc mpCntLsb*(a: ptr MpInt): cint {.cdecl, importc: "mp_cnt_lsb", header: "tommath.h".}

proc mpRand*(a: ptr MpInt; digits: cint): MpErr {.cdecl, importc: "mp_rand",
    header: "tommath.h".}

proc mpRandSource*(source: proc (`out`: pointer; size: csize_t): MpErr {.cdecl.}) {.
    cdecl, importc: "mp_rand_source", header: "tommath.h".}

proc mpXor*(a: ptr MpInt; b: ptr MpInt; c: ptr MpInt): MpErr {.cdecl, importc: "mp_xor",
    header: "tommath.h".}

proc mpOr*(a: ptr MpInt; b: ptr MpInt; c: ptr MpInt): MpErr {.cdecl, importc: "mp_or",
    header: "tommath.h".}

proc mpAnd*(a: ptr MpInt; b: ptr MpInt; c: ptr MpInt): MpErr {.cdecl, importc: "mp_and",
    header: "tommath.h".}

proc mpComplement*(a: ptr MpInt; b: ptr MpInt): MpErr {.cdecl, importc: "mp_complement",
    header: "tommath.h".}

proc mpSignedRsh*(a: ptr MpInt; b: cint; c: ptr MpInt): MpErr {.cdecl,
    importc: "mp_signed_rsh", header: "tommath.h".}

proc mpNeg*(a: ptr MpInt; b: ptr MpInt): MpErr {.cdecl, importc: "mp_neg",
    header: "tommath.h".}

proc mpAbs*(a: ptr MpInt; b: ptr MpInt): MpErr {.cdecl, importc: "mp_abs",
    header: "tommath.h".}

proc mpCmp*(a: ptr MpInt; b: ptr MpInt): MpOrd {.cdecl, importc: "mp_cmp",
    header: "tommath.h".}

proc mpCmpMag*(a: ptr MpInt; b: ptr MpInt): MpOrd {.cdecl, importc: "mp_cmp_mag",
    header: "tommath.h".}

proc mpAdd*(a: ptr MpInt; b: ptr MpInt; c: ptr MpInt): MpErr {.cdecl, importc: "mp_add",
    header: "tommath.h".}

proc mpSub*(a: ptr MpInt; b: ptr MpInt; c: ptr MpInt): MpErr {.cdecl, importc: "mp_sub",
    header: "tommath.h".}

proc mpMul*(a: ptr MpInt; b: ptr MpInt; c: ptr MpInt): MpErr {.cdecl, importc: "mp_mul",
    header: "tommath.h".}

template mpSqr*(a, b: untyped): untyped =
  mpMul((a), (a), (b))


proc mpDiv*(a: ptr MpInt; b: ptr MpInt; c: ptr MpInt; d: ptr MpInt): MpErr {.cdecl,
    importc: "mp_div", header: "tommath.h".}

proc mpMod*(a: ptr MpInt; b: ptr MpInt; c: ptr MpInt): MpErr {.cdecl, importc: "mp_mod",
    header: "tommath.h".}

template mpIncr*(a: untyped): untyped =
  mpAddD((a), 1'u, (a))


template mpDecr*(a: untyped): untyped =
  mpSubD((a), 1'u, (a))


proc mpCmpD*(a: ptr MpInt; b: MpDigit): MpOrd {.cdecl, importc: "mp_cmp_d",
    header: "tommath.h".}

proc mpAddD*(a: ptr MpInt; b: MpDigit; c: ptr MpInt): MpErr {.cdecl, importc: "mp_add_d",
    header: "tommath.h".}

proc mpSubD*(a: ptr MpInt; b: MpDigit; c: ptr MpInt): MpErr {.cdecl, importc: "mp_sub_d",
    header: "tommath.h".}

proc mpMulD*(a: ptr MpInt; b: MpDigit; c: ptr MpInt): MpErr {.cdecl, importc: "mp_mul_d",
    header: "tommath.h".}

proc mpDivD*(a: ptr MpInt; b: MpDigit; c: ptr MpInt; d: ptr MpDigit): MpErr {.cdecl,
    importc: "mp_div_d", header: "tommath.h".}

template mpModD*(a, b, c: untyped): untyped =
  mpDivD((a), (b), nil, (c))


proc mpAddmod*(a: ptr MpInt; b: ptr MpInt; c: ptr MpInt; d: ptr MpInt): MpErr {.cdecl,
    importc: "mp_addmod", header: "tommath.h".}

proc mpSubmod*(a: ptr MpInt; b: ptr MpInt; c: ptr MpInt; d: ptr MpInt): MpErr {.cdecl,
    importc: "mp_submod", header: "tommath.h".}

proc mpMulmod*(a: ptr MpInt; b: ptr MpInt; c: ptr MpInt; d: ptr MpInt): MpErr {.cdecl,
    importc: "mp_mulmod", header: "tommath.h".}

proc mpSqrmod*(a: ptr MpInt; b: ptr MpInt; c: ptr MpInt): MpErr {.cdecl,
    importc: "mp_sqrmod", header: "tommath.h".}

proc mpInvmod*(a: ptr MpInt; b: ptr MpInt; c: ptr MpInt): MpErr {.cdecl,
    importc: "mp_invmod", header: "tommath.h".}

proc mpGcd*(a: ptr MpInt; b: ptr MpInt; c: ptr MpInt): MpErr {.cdecl, importc: "mp_gcd",
    header: "tommath.h".}

proc mpExteuclid*(a: ptr MpInt; b: ptr MpInt; u1: ptr MpInt; u2: ptr MpInt; u3: ptr MpInt): MpErr {.
    cdecl, importc: "mp_exteuclid", header: "tommath.h".}

proc mpLcm*(a: ptr MpInt; b: ptr MpInt; c: ptr MpInt): MpErr {.cdecl, importc: "mp_lcm",
    header: "tommath.h".}

proc mpLogN*(a: ptr MpInt; base: cint; c: ptr cint): MpErr {.cdecl, importc: "mp_log_n",
    header: "tommath.h".}

proc mpLog*(a: ptr MpInt; base: ptr MpInt; c: ptr cint): MpErr {.cdecl, importc: "mp_log",
    header: "tommath.h".}

proc mpExptN*(a: ptr MpInt; b: cint; c: ptr MpInt): MpErr {.cdecl, importc: "mp_expt_n",
    header: "tommath.h".}

proc mpRootN*(a: ptr MpInt; b: cint; c: ptr MpInt): MpErr {.cdecl, importc: "mp_root_n",
    header: "tommath.h".}

proc mpSqrt*(arg: ptr MpInt; ret: ptr MpInt): MpErr {.cdecl, importc: "mp_sqrt",
    header: "tommath.h".}

proc mpSqrtmodPrime*(n: ptr MpInt; prime: ptr MpInt; ret: ptr MpInt): MpErr {.cdecl,
    importc: "mp_sqrtmod_prime", header: "tommath.h".}

proc mpIsSquare*(arg: ptr MpInt; ret: ptr cint): MpErr {.cdecl, importc: "mp_is_square",
    header: "tommath.h".}

proc mpKronecker*(a: ptr MpInt; p: ptr MpInt; c: ptr cint): MpErr {.cdecl,
    importc: "mp_kronecker", header: "tommath.h".}

proc mpReduceSetup*(a: ptr MpInt; b: ptr MpInt): MpErr {.cdecl,
    importc: "mp_reduce_setup", header: "tommath.h".}

proc mpReduce*(x: ptr MpInt; m: ptr MpInt; mu: ptr MpInt): MpErr {.cdecl,
    importc: "mp_reduce", header: "tommath.h".}

proc mpMontgomerySetup*(n: ptr MpInt; rho: ptr MpDigit): MpErr {.cdecl,
    importc: "mp_montgomery_setup", header: "tommath.h".}

proc mpMontgomeryCalcNormalization*(a: ptr MpInt; b: ptr MpInt): MpErr {.cdecl,
    importc: "mp_montgomery_calc_normalization", header: "tommath.h".}

proc mpMontgomeryReduce*(x: ptr MpInt; n: ptr MpInt; rho: MpDigit): MpErr {.cdecl,
    importc: "mp_montgomery_reduce", header: "tommath.h".}

proc mpDrIsModulus*(a: ptr MpInt): bool {.cdecl, importc: "mp_dr_is_modulus",
                                     header: "tommath.h".}

proc mpDrSetup*(a: ptr MpInt; d: ptr MpDigit) {.cdecl, importc: "mp_dr_setup",
    header: "tommath.h".}

proc mpDrReduce*(x: ptr MpInt; n: ptr MpInt; k: MpDigit): MpErr {.cdecl,
    importc: "mp_dr_reduce", header: "tommath.h".}

proc mpReduceIs2k*(a: ptr MpInt): bool {.cdecl, importc: "mp_reduce_is_2k",
                                    header: "tommath.h".}

proc mpReduce2kSetup*(a: ptr MpInt; d: ptr MpDigit): MpErr {.cdecl,
    importc: "mp_reduce_2k_setup", header: "tommath.h".}

proc mpReduce2k*(a: ptr MpInt; n: ptr MpInt; d: MpDigit): MpErr {.cdecl,
    importc: "mp_reduce_2k", header: "tommath.h".}

proc mpReduceIs2kL*(a: ptr MpInt): bool {.cdecl, importc: "mp_reduce_is_2k_l",
                                     header: "tommath.h".}

proc mpReduce2kSetupL*(a: ptr MpInt; d: ptr MpInt): MpErr {.cdecl,
    importc: "mp_reduce_2k_setup_l", header: "tommath.h".}

proc mpReduce2kL*(a: ptr MpInt; n: ptr MpInt; d: ptr MpInt): MpErr {.cdecl,
    importc: "mp_reduce_2k_l", header: "tommath.h".}

proc mpExptmod*(g: ptr MpInt; x: ptr MpInt; p: ptr MpInt; y: ptr MpInt): MpErr {.cdecl,
    importc: "mp_exptmod", header: "tommath.h".}

type
    MpHval* = uint

proc mpHash*(a: ptr MpInt; hash: ptr MpHval): MpErr {.cdecl, importc: "mp_hash",
    header: "tommath.h".}

proc mpPrimeFermat*(a: ptr MpInt; b: ptr MpInt; result: ptr cint): MpErr {.cdecl,
    importc: "mp_prime_fermat", header: "tommath.h".}

proc mpPrimeMillerRabin*(a: ptr MpInt; b: ptr MpInt; result: ptr cint): MpErr {.cdecl,
    importc: "mp_prime_miller_rabin", header: "tommath.h".}

proc mpPrimeRabinMillerTrials*(size: cint): cint {.cdecl,
    importc: "mp_prime_rabin_miller_trials", header: "tommath.h".}

proc mpPrimeStrongLucasSelfridge*(a: ptr MpInt; result: ptr cint): MpErr {.cdecl,
    importc: "mp_prime_strong_lucas_selfridge", header: "tommath.h".}

proc mpPrimeFrobeniusUnderwood*(n: ptr MpInt; result: ptr cint): MpErr {.cdecl,
    importc: "mp_prime_frobenius_underwood", header: "tommath.h".}

proc mpPrimeIsPrime*(a: ptr MpInt; t: cint; result: ptr bool): MpErr {.cdecl,
    importc: "mp_prime_is_prime", header: "tommath.h".}

proc mpPrimeNextPrime*(a: ptr MpInt; t: cint; bbsStyle: cint): MpErr {.cdecl,
    importc: "mp_prime_next_prime", header: "tommath.h".}

proc mpPrimeRand*(a: ptr MpInt; t: cint; size: cint; flags: cint): MpErr {.cdecl,
    importc: "mp_prime_rand", header: "tommath.h".}

proc mpCountBits*(a: ptr MpInt): cint {.cdecl, importc: "mp_count_bits",
                                   header: "tommath.h".}
proc mpUbinSize*(a: ptr MpInt): csize_t {.cdecl, importc: "mp_ubin_size",
                                     header: "tommath.h".}
proc mpFromUbin*(a: ptr MpInt; buf: ptr uint8; size: csize_t): MpErr {.cdecl,
    importc: "mp_from_ubin", header: "tommath.h".}
proc mpToUbin*(a: ptr MpInt; buf: ptr uint8; maxlen: csize_t; written: ptr csize_t): MpErr {.
    cdecl, importc: "mp_to_ubin", header: "tommath.h".}
proc mpSbinSize*(a: ptr MpInt): csize_t {.cdecl, importc: "mp_sbin_size",
                                     header: "tommath.h".}
proc mpFromSbin*(a: ptr MpInt; buf: ptr uint8; size: csize_t): MpErr {.cdecl,
    importc: "mp_from_sbin", header: "tommath.h".}
proc mpToSbin*(a: ptr MpInt; buf: ptr uint8; maxlen: csize_t; written: ptr csize_t): MpErr {.
    cdecl, importc: "mp_to_sbin", header: "tommath.h".}
proc mpReadRadix*(a: ptr MpInt; str: cstring; radix: cint): MpErr {.cdecl,
    importc: "mp_read_radix", header: "tommath.h".}
proc mpToRadix*(a: ptr MpInt; str: cstring; maxlen: cint; written: ptr csize_t;
               radix: cint): MpErr {.cdecl, importc: "mp_to_radix",
                                  header: "tommath.h".}
proc mpRadixSize*(a: ptr MpInt; radix: cint; size: ptr csize_t): MpErr {.cdecl,
    importc: "mp_radix_size", header: "tommath.h".}
proc mpRadixSizeOverestimate*(a: ptr MpInt; radix: cint; size: ptr csize_t): MpErr {.
    cdecl, importc: "mp_radix_size_overestimate", header: "tommath.h".}

proc mpFread*(a: ptr MpInt; radix: cint; stream: ptr File): MpErr {.cdecl,
      importc: "mp_fread", header: "tommath.h".}
proc mpFwrite*(a: ptr MpInt; radix: cint; stream: ptr File): MpErr {.cdecl,
      importc: "mp_fwrite", header: "tommath.h".}

template mpToBinary*(m, s, n: untyped): untyped =
  mpToRadix((m), (s), (n), nil, 2)

template mpToOctal*(m, s, n: untyped): untyped =
  mpToRadix((m), (s), (n), nil, 8)

template mpToDecimal*(m, s, n: untyped): untyped =
  mpToRadix((m), (s), (n), nil, 10)

template mpToHex*(m, s, n: untyped): untyped =
  mpToRadix((m), (s), (n), nil, 16)
