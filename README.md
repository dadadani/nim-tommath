
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

## Contributing
This wrapper is rather incomplete, so feel free to open pull requests if you are interested!


