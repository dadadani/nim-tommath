
# nim-tommath
An High-Level wrapper of [libtommath](https://github.com/libtom/libtommath) written in Nim.
```nim
import pkg/tommath
    
let a = initBigInt(10) # Load from regular int
let b = initBigInt("A", 16) # Load from string (Hex)
    
echo a + b # add
echo a * b # multiply
    
echo initBigInt("-99946744073709551615").toString(2) # Load from string (Decimal) and print as binary
```    

## Features
- Portable: This library compiles libtommath directly, so the end-user doesn't need to install it on the system.
- Open License: Unlike GMP, libtommath is under the [public domain](https://github.com/libtom/libtommath/blob/03de03dee753442d4b23166982514639c4ccbc39/LICENSE), which makes the distribution process less complicated.
-  Performant: While there are native implementations of Big Integers in Nim, they are not fully optimized. This becomes important when we want to deal with very large numbers (2048+bits). This library instead uses fast algorithms that reduce the complexity of operations.
-  Easy to use: An high-level interface is provided by default, which makes libtommath much easier to use.


## Installing
Use nimble to install the library:

    nimble install https://github.com/dadadani/nim-tommath


## Accesing the low-level API
If you want to access the low-level API, you can use the `raw` module:

```nim

import pkg/tommath/raw

var mp = create(MpInt, sizeof(MpInt))
discard mp_init_i64(mp, 2342543)

var mp2 = create(MpInt, sizeof(MpInt))
discard mp_init_i64(mp2, 1000000)

var mp3 = create(MpInt, sizeof(MpInt))
discard mp_init(mp3)

discard mp_add(mp, mp2, mp3)

var outp: string

var size: csize_t
discard mp_radix_size(mp3, 10, addr size)

outp.setLen(size-1)
discard mp_to_radix(mp3, cstring(outp), cint(size), nil, 10)

echo outp

mp_clear(mp)
mp_clear(mp2)
mp_clear(mp3)
```

## Dynamic Linking

If you want to use the system's libtommath, compile your program with `-d:useExternalTommath`:

    nim c -d:useExternalTommath myprogram.nim

## Contributing
This wrapper is rather incomplete, so feel free to open pull requests if you are interested!


