import os

const path = currentSourcePath() / ".." / ".."

{.compile: path / "libtommath/mp_2expt.c".}
{.compile: path / "libtommath/mp_abs.c".}
{.compile: path / "libtommath/mp_add.c".}
{.compile: path / "libtommath/mp_add_d.c".}
{.compile: path / "libtommath/mp_addmod.c".}
{.compile: path / "libtommath/mp_and.c".}
{.compile: path / "libtommath/mp_clamp.c".}
{.compile: path / "libtommath/mp_clear.c".}
{.compile: path / "libtommath/mp_clear_multi.c".}
{.compile: path / "libtommath/mp_cmp.c".}
{.compile: path / "libtommath/mp_cmp_d.c".}
{.compile: path / "libtommath/mp_cmp_mag.c".}
{.compile: path / "libtommath/mp_cnt_lsb.c".}
{.compile: path / "libtommath/mp_complement.c".}
{.compile: path / "libtommath/mp_copy.c".}
{.compile: path / "libtommath/mp_count_bits.c".}
{.compile: path / "libtommath/mp_cutoffs.c".}
{.compile: path / "libtommath/mp_div.c".}
{.compile: path / "libtommath/mp_div_2.c".}
{.compile: path / "libtommath/mp_div_2d.c".}
{.compile: path / "libtommath/mp_div_d.c".}
{.compile: path / "libtommath/mp_dr_is_modulus.c".}
{.compile: path / "libtommath/mp_dr_reduce.c".}
{.compile: path / "libtommath/mp_dr_setup.c".}
{.compile: path / "libtommath/mp_error_to_string.c".}
{.compile: path / "libtommath/mp_exch.c".}
{.compile: path / "libtommath/mp_expt_n.c".}
{.compile: path / "libtommath/mp_exptmod.c".}
{.compile: path / "libtommath/mp_exteuclid.c".}
{.compile: path / "libtommath/mp_fread.c".}
{.compile: path / "libtommath/mp_from_sbin.c".}
{.compile: path / "libtommath/mp_from_ubin.c".}
{.compile: path / "libtommath/mp_fwrite.c".}
{.compile: path / "libtommath/mp_gcd.c".}
{.compile: path / "libtommath/mp_get_double.c".}
{.compile: path / "libtommath/mp_get_i32.c".}
{.compile: path / "libtommath/mp_get_i64.c".}
{.compile: path / "libtommath/mp_get_l.c".}
{.compile: path / "libtommath/mp_get_mag_u32.c".}
{.compile: path / "libtommath/mp_get_mag_u64.c".}
{.compile: path / "libtommath/mp_get_mag_ul.c".}
{.compile: path / "libtommath/mp_grow.c".}
{.compile: path / "libtommath/mp_hash.c".}
{.compile: path / "libtommath/mp_init.c".}
{.compile: path / "libtommath/mp_init_copy.c".}
{.compile: path / "libtommath/mp_init_i32.c".}
{.compile: path / "libtommath/mp_init_i64.c".}
{.compile: path / "libtommath/mp_init_l.c".}
{.compile: path / "libtommath/mp_init_multi.c".}
{.compile: path / "libtommath/mp_init_set.c".}
{.compile: path / "libtommath/mp_init_size.c".}
{.compile: path / "libtommath/mp_init_u32.c".}
{.compile: path / "libtommath/mp_init_u64.c".}
{.compile: path / "libtommath/mp_init_ul.c".}
{.compile: path / "libtommath/mp_invmod.c".}
{.compile: path / "libtommath/mp_is_square.c".}
{.compile: path / "libtommath/mp_kronecker.c".}
{.compile: path / "libtommath/mp_lcm.c".}
{.compile: path / "libtommath/mp_log_n.c".}
{.compile: path / "libtommath/mp_lshd.c".}
{.compile: path / "libtommath/mp_mod.c".}
{.compile: path / "libtommath/mp_mod_2d.c".}
{.compile: path / "libtommath/mp_montgomery_calc_normalization.c".}
{.compile: path / "libtommath/mp_montgomery_reduce.c".}
{.compile: path / "libtommath/mp_montgomery_setup.c".}
{.compile: path / "libtommath/mp_mul.c".}
{.compile: path / "libtommath/mp_mul_2.c".}
{.compile: path / "libtommath/mp_mul_2d.c".}
{.compile: path / "libtommath/mp_mul_d.c".}
{.compile: path / "libtommath/mp_mulmod.c".}
{.compile: path / "libtommath/mp_neg.c".}
{.compile: path / "libtommath/mp_or.c".}
{.compile: path / "libtommath/mp_pack.c".}
{.compile: path / "libtommath/mp_pack_count.c".}
{.compile: path / "libtommath/mp_prime_fermat.c".}
{.compile: path / "libtommath/mp_prime_frobenius_underwood.c".}
{.compile: path / "libtommath/mp_prime_is_prime.c".}
{.compile: path / "libtommath/mp_prime_miller_rabin.c".}
{.compile: path / "libtommath/mp_prime_next_prime.c".}
{.compile: path / "libtommath/mp_prime_rabin_miller_trials.c".}
{.compile: path / "libtommath/mp_prime_rand.c".}
{.compile: path / "libtommath/mp_prime_strong_lucas_selfridge.c".}
{.compile: path / "libtommath/mp_radix_size.c".}
{.compile: path / "libtommath/mp_radix_size_overestimate.c".}
{.compile: path / "libtommath/mp_rand.c".}
{.compile: path / "libtommath/mp_rand_source.c".}
{.compile: path / "libtommath/mp_read_radix.c".}
{.compile: path / "libtommath/mp_reduce.c".}
{.compile: path / "libtommath/mp_reduce_2k.c".}
{.compile: path / "libtommath/mp_reduce_2k_l.c".}
{.compile: path / "libtommath/mp_reduce_2k_setup.c".}
{.compile: path / "libtommath/mp_reduce_2k_setup_l.c".}
{.compile: path / "libtommath/mp_reduce_is_2k.c".}
{.compile: path / "libtommath/mp_reduce_is_2k_l.c".}
{.compile: path / "libtommath/mp_reduce_setup.c".}
{.compile: path / "libtommath/mp_root_n.c".}
{.compile: path / "libtommath/mp_rshd.c".}
{.compile: path / "libtommath/mp_sbin_size.c".}
{.compile: path / "libtommath/mp_set.c".}
{.compile: path / "libtommath/mp_set_double.c".}
{.compile: path / "libtommath/mp_set_i32.c".}
{.compile: path / "libtommath/mp_set_i64.c".}
{.compile: path / "libtommath/mp_set_l.c".}
{.compile: path / "libtommath/mp_set_u32.c".}
{.compile: path / "libtommath/mp_set_u64.c".}
{.compile: path / "libtommath/mp_set_ul.c".}
{.compile: path / "libtommath/mp_shrink.c".}
{.compile: path / "libtommath/mp_signed_rsh.c".}
{.compile: path / "libtommath/mp_sqrmod.c".}
{.compile: path / "libtommath/mp_sqrt.c".}
{.compile: path / "libtommath/mp_sqrtmod_prime.c".}
{.compile: path / "libtommath/mp_sub.c".}
{.compile: path / "libtommath/mp_sub_d.c".}
{.compile: path / "libtommath/mp_submod.c".}
{.compile: path / "libtommath/mp_to_radix.c".}
{.compile: path / "libtommath/mp_to_sbin.c".}
{.compile: path / "libtommath/mp_to_ubin.c".}
{.compile: path / "libtommath/mp_ubin_size.c".}
{.compile: path / "libtommath/mp_unpack.c".}
{.compile: path / "libtommath/mp_xor.c".}
{.compile: path / "libtommath/mp_zero.c".}
{.compile: path / "libtommath/s_mp_add.c".}
{.compile: path / "libtommath/s_mp_copy_digs.c".}
{.compile: path / "libtommath/s_mp_div_3.c".}
{.compile: path / "libtommath/s_mp_div_recursive.c".}
{.compile: path / "libtommath/s_mp_div_school.c".}
{.compile: path / "libtommath/s_mp_div_small.c".}
{.compile: path / "libtommath/s_mp_exptmod.c".}
{.compile: path / "libtommath/s_mp_exptmod_fast.c".}
{.compile: path / "libtommath/s_mp_get_bit.c".}
{.compile: path / "libtommath/s_mp_invmod.c".}
{.compile: path / "libtommath/s_mp_invmod_odd.c".}
{.compile: path / "libtommath/s_mp_log.c".}
{.compile: path / "libtommath/s_mp_log_2expt.c".}
{.compile: path / "libtommath/s_mp_log_d.c".}
{.compile: path / "libtommath/s_mp_montgomery_reduce_comba.c".}
{.compile: path / "libtommath/s_mp_mul.c".}
{.compile: path / "libtommath/s_mp_mul_balance.c".}
{.compile: path / "libtommath/s_mp_mul_comba.c".}
{.compile: path / "libtommath/s_mp_mul_high.c".}
{.compile: path / "libtommath/s_mp_mul_high_comba.c".}
{.compile: path / "libtommath/s_mp_mul_karatsuba.c".}
{.compile: path / "libtommath/s_mp_mul_toom.c".}
{.compile: path / "libtommath/s_mp_prime_is_divisible.c".}
{.compile: path / "libtommath/s_mp_prime_tab.c".}
{.compile: path / "libtommath/s_mp_radix_map.c".}
{.compile: path / "libtommath/s_mp_radix_size_overestimate.c".}
{.compile: path / "libtommath/s_mp_rand_platform.c".}
{.compile: path / "libtommath/s_mp_sqr.c".}
{.compile: path / "libtommath/s_mp_sqr_comba.c".}
{.compile: path / "libtommath/s_mp_sqr_karatsuba.c".}
{.compile: path / "libtommath/s_mp_sqr_toom.c".}
{.compile: path / "libtommath/s_mp_sub.c".}
{.compile: path / "libtommath/s_mp_zero_buf.c".}
{.compile: path / "libtommath/s_mp_zero_digs.c".}



type
  TommathStruct* = object
  TommathPtr* = ptr TommathStruct
  MPInt* = TommathPtr
  MPErr* = cint

type MPDigit* = uint

proc mp_init*(a: ptr MPInt): MPErr {.importc, discardable.}

proc mp_clear*(a: ptr MPInt) {.importc.}

proc mp_read_radix*(a: ptr MPInt, str: cstring, radix: cint): MPErr {.importc.}

proc mp_to_radix*(a: ptr MPInt, str: cstring, maxlen: csize_t, written: ptr csize_t, radix: cint): MPErr {.importc.}

proc mp_radix_size*(a: ptr MPInt, radix: cint, size: ptr csize_t): MPErr {.importc.}

proc mp_exptmod*(G: ptr MPInt, X: ptr MPInt, P: ptr MPInt, Y: ptr MPInt): MPErr {.importc.}

proc mp_invmod*(a: ptr MPInt, b: ptr MPInt, c: ptr MPInt): MPErr {.importc.}

proc mp_sqrt*(arg: ptr MPInt, ret: ptr MPInt): MPErr {.importc.}

proc mp_expt_n*(a: ptr MPInt, b: cint, ret: ptr MPInt): MPErr {.importc.}

proc mp_2expt*(a: ptr MPInt, b: cint): MPErr {.importc.}

proc mp_is_square*(arg: ptr MPInt, ret: ptr cint): MPErr {.importc.}

proc mp_error_to_string*(code: MPErr): cstring {.importc.}

proc mp_init_i32*(a: ptr MPInt, b: int32): MPErr {.importc.}
proc mp_init_u32*(a: ptr MPInt, b: uint32): MPErr {.importc.}
proc mp_init_i64*(a: ptr MPInt, b: int64): MPErr {.importc.}
proc mp_init_u64*(a: ptr MPInt, b: uint64): MPErr {.importc.}

proc mp_get_i32*(a: ptr MPInt): int32 {.importc.}
proc mp_get_i64*(a: ptr MPInt): int64 {.importc.}

proc mp_add*(a: ptr MPInt, b: ptr MPInt, c: ptr MPInt): MPErr {.importc.}
proc mp_sub*(a: ptr MPInt, b: ptr MPInt, c: ptr MPInt): MPErr {.importc.}
proc mp_mul*(a: ptr MPInt, b: ptr MPInt, c: ptr MPInt): MPErr {.importc.}
proc mp_div*(a: ptr MPInt, b: ptr MPInt, c: ptr MPInt, d: ptr MPInt): MPErr {.importc.}
proc mp_mod*(a: ptr MPInt, b: ptr MPInt, c: ptr MPInt): MPErr {.importc.}

proc mp_add_d*(a: ptr MPInt, b: MPDigit, c: ptr MPInt): MPErr {.importc.}
proc mp_sub_d*(a: ptr MPInt, b: MPDigit, c: ptr MPInt): MPErr {.importc.}
proc mp_mul_d*(a: ptr MPInt, b: MPDigit, c: ptr MPInt): MPErr {.importc.}
proc mp_div_d*(a: ptr MPInt, b: MPDigit, c: ptr MPInt, d: ptr MPInt): MPErr {.importc.}

proc mp_prime_is_prime*(a: ptr MPInt, t: cint, result: ptr cint): MPErr {.importc.}
proc mp_prime_rand*(a: ptr MPInt, t: cint, size: cint, flags: cint): MPErr {.importc.}

proc mp_rand*(a: ptr MPInt, digits: cint): MPErr {.importc.}

proc mp_cmp_d*(a: ptr MPInt, b: MPDigit): cint {.importc.}
proc mp_cmp*(a: ptr MPInt, b: ptr MPInt): cint {.importc.}
proc mp_neg*(a: ptr MPInt, b: ptr MPInt): MPErr {.importc.}

proc mp_abs*(a: ptr MPInt, c: ptr MPInt): MPErr {.importc.}

proc mp_gcd*(a: ptr MPInt, b: ptr MPInt, c: ptr MPInt): MPErr {.importc.}

proc mp_copy*(a: ptr MPInt, b: ptr MPInt): MPErr {.importc.}

proc mp_count_bits*(a: ptr MPInt): MPErr {.importc.}

proc mp_xor*(a: ptr MPInt, b: ptr MPInt, c: ptr MPInt): MPErr {.importc.}
proc mp_or*(a: ptr MPInt, b: ptr MPInt, c: ptr MPInt): MPErr {.importc.}
proc mp_and*(a: ptr MPInt, b: ptr MPInt, c: ptr MPInt): MPErr {.importc.}
proc mp_complement*(a: ptr MPInt, c: ptr MPInt): MPErr {.importc.}

proc mp_rshd*(a: ptr MPInt, b: cint) {.importc.}
proc mp_lshd*(a: ptr MPInt, b: cint): MPErr {.importc.}

proc mp_signed_rsh*(a: ptr MPInt, b: cint, c: ptr MPInt): MPErr {.importc.}
proc mp_div_2d*(a: ptr MPInt, b: cint, c: ptr MPInt, d: ptr MPInt): MPErr {.importc.}
proc mp_mul_2d*(a: ptr MPInt, b: cint, c: ptr MPInt): MPErr {.importc.}

proc mp_sbin_size*(a: ptr MPInt): csize_t {.importc.}
proc mp_from_sbin*(a: ptr MPInt, buf: ptr UncheckedArray[uint8], size: csize_t): MPErr {.importc.}
proc mp_to_sbin*(a: ptr MPInt, buf: ptr UncheckedArray[uint8], maxlen: csize_t, written: ptr csize_t): MPErr {.importc.}

proc mp_ubin_size*(a: ptr MPInt): csize_t {.importc.}
proc mp_from_ubin*(a: ptr MPInt, buf: ptr UncheckedArray[uint8], size: csize_t): MPErr {.importc.}
proc mp_to_ubin*(a: ptr MPInt, buf: ptr UncheckedArray[uint8], maxlen: csize_t, written: ptr csize_t): MPErr {.importc.}
