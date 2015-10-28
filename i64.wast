(; i64 operations ;)

(module
  (func $add (param $x i64) (param $y i64) (result i64) (i64.add (get_local $x) (get_local $y)))
  (func $sub (param $x i64) (param $y i64) (result i64) (i64.sub (get_local $x) (get_local $y)))
  (func $mul (param $x i64) (param $y i64) (result i64) (i64.mul (get_local $x) (get_local $y)))
  (func $div_s (param $x i64) (param $y i64) (result i64) (i64.div_s (get_local $x) (get_local $y)))
  (func $div_u (param $x i64) (param $y i64) (result i64) (i64.div_u (get_local $x) (get_local $y)))
  (func $rem_s (param $x i64) (param $y i64) (result i64) (i64.rem_s (get_local $x) (get_local $y)))
  (func $rem_u (param $x i64) (param $y i64) (result i64) (i64.rem_u (get_local $x) (get_local $y)))
  (func $and (param $x i64) (param $y i64) (result i64) (i64.and (get_local $x) (get_local $y)))
  (func $or (param $x i64) (param $y i64) (result i64) (i64.or (get_local $x) (get_local $y)))
  (func $xor (param $x i64) (param $y i64) (result i64) (i64.xor (get_local $x) (get_local $y)))
  (func $shl (param $x i64) (param $y i64) (result i64) (i64.shl (get_local $x) (get_local $y)))
  (func $shr_s (param $x i64) (param $y i64) (result i64) (i64.shr_s (get_local $x) (get_local $y)))
  (func $shr_u (param $x i64) (param $y i64) (result i64) (i64.shr_u (get_local $x) (get_local $y)))
  (func $clz (param $x i64) (result i64) (i64.clz (get_local $x)))
  (func $ctz (param $x i64) (result i64) (i64.ctz (get_local $x)))
  (func $popcnt (param $x i64) (result i64) (i64.popcnt (get_local $x)))
  (func $eq (param $x i64) (param $y i64) (result i32) (i64.eq (get_local $x) (get_local $y)))
  (func $ne (param $x i64) (param $y i64) (result i32) (i64.ne (get_local $x) (get_local $y)))
  (func $lt_s (param $x i64) (param $y i64) (result i32) (i64.lt_s (get_local $x) (get_local $y)))
  (func $lt_u (param $x i64) (param $y i64) (result i32) (i64.lt_u (get_local $x) (get_local $y)))
  (func $le_s (param $x i64) (param $y i64) (result i32) (i64.le_s (get_local $x) (get_local $y)))
  (func $le_u (param $x i64) (param $y i64) (result i32) (i64.le_u (get_local $x) (get_local $y)))
  (func $gt_s (param $x i64) (param $y i64) (result i32) (i64.gt_s (get_local $x) (get_local $y)))
  (func $gt_u (param $x i64) (param $y i64) (result i32) (i64.gt_u (get_local $x) (get_local $y)))
  (func $ge_s (param $x i64) (param $y i64) (result i32) (i64.ge_s (get_local $x) (get_local $y)))
  (func $ge_u (param $x i64) (param $y i64) (result i32) (i64.ge_u (get_local $x) (get_local $y)))

  (export "add" $add)
  (export "sub" $sub)
  (export "mul" $mul)
  (export "div_s" $div_s)
  (export "div_u" $div_u)
  (export "rem_s" $rem_s)
  (export "rem_u" $rem_u)
  (export "and" $and)
  (export "or" $or)
  (export "xor" $xor)
  (export "shl" $shl)
  (export "shr_s" $shr_s)
  (export "shr_u" $shr_u)
  (export "clz" $clz)
  (export "ctz" $ctz)
  (export "popcnt" $popcnt)
  (export "eq" $eq)
  (export "ne" $ne)
  (export "lt_s" $lt_s)
  (export "lt_u" $lt_u)
  (export "le_s" $le_s)
  (export "le_u" $le_u)
  (export "gt_s" $gt_s)
  (export "gt_u" $gt_u)
  (export "ge_s" $ge_s)
  (export "ge_u" $ge_u)
)

(assert_return (invoke "add" (i64.const 1) (i64.const 1)) (i64.const 2))
(assert_return (invoke "add" (i64.const 1) (i64.const 0)) (i64.const 1))
(assert_return (invoke "add" (i64.const -1) (i64.const -1)) (i64.const -2))
(assert_return (invoke "add" (i64.const -1) (i64.const 1)) (i64.const 0))
(assert_return (invoke "add" (i64.const 0x7fffffffffffffff) (i64.const 1)) (i64.const 0x8000000000000000))
(assert_return (invoke "add" (i64.const 0x8000000000000000) (i64.const -1)) (i64.const 0x7fffffffffffffff))
(assert_return (invoke "add" (i64.const 0x8000000000000000) (i64.const 0x8000000000000000)) (i64.const 0))
(assert_return (invoke "add" (i64.const 0x3fffffff) (i64.const 1)) (i64.const 0x40000000))

(assert_return (invoke "sub" (i64.const 1) (i64.const 1)) (i64.const 0))
(assert_return (invoke "sub" (i64.const 1) (i64.const 0)) (i64.const 1))
(assert_return (invoke "sub" (i64.const -1) (i64.const -1)) (i64.const 0))
(assert_return (invoke "sub" (i64.const 0x7fffffffffffffff) (i64.const -1)) (i64.const 0x8000000000000000))
(assert_return (invoke "sub" (i64.const 0x8000000000000000) (i64.const 1)) (i64.const 0x7fffffffffffffff))
(assert_return (invoke "sub" (i64.const 0x8000000000000000) (i64.const 0x8000000000000000)) (i64.const 0))
(assert_return (invoke "sub" (i64.const 0x3fffffff) (i64.const -1)) (i64.const 0x40000000))

(assert_return (invoke "mul" (i64.const 1) (i64.const 1)) (i64.const 1))
(assert_return (invoke "mul" (i64.const 1) (i64.const 0)) (i64.const 0))
(assert_return (invoke "mul" (i64.const -1) (i64.const -1)) (i64.const 1))
(assert_return (invoke "mul" (i64.const 0x1000000000000000) (i64.const 4096)) (i64.const 0))
(assert_return (invoke "mul" (i64.const 0x8000000000000000) (i64.const 0)) (i64.const 0))
(assert_return (invoke "mul" (i64.const 0x8000000000000000) (i64.const -1)) (i64.const 0x8000000000000000))
(assert_return (invoke "mul" (i64.const 0x7fffffffffffffff) (i64.const -1)) (i64.const 0x8000000000000001))
(assert_return (invoke "mul" (i64.const 0x0123456789abcdef) (i64.const 0xfedcba9876543210)) (i64.const 0x2236d88fe5618cf0))

(assert_trap (invoke "div_s" (i64.const 1) (i64.const 0)) "integer divide by zero")
(assert_trap (invoke "div_s" (i64.const 0) (i64.const 0)) "integer divide by zero")
(assert_trap (invoke "div_s" (i64.const 0x8000000000000000) (i64.const -1)) "integer overflow")
(assert_return (invoke "div_s" (i64.const 1) (i64.const 1)) (i64.const 1))
(assert_return (invoke "div_s" (i64.const 0) (i64.const 1)) (i64.const 0))
(assert_return (invoke "div_s" (i64.const -1) (i64.const -1)) (i64.const 1))
(assert_return (invoke "div_s" (i64.const 0x8000000000000000) (i64.const 2)) (i64.const 0xc000000000000000))
(assert_return (invoke "div_s" (i64.const 0x8000000000000001) (i64.const 1000)) (i64.const 0xffdf3b645a1cac09))
(assert_return (invoke "div_s" (i64.const 5) (i64.const 2)) (i64.const 2))
(assert_return (invoke "div_s" (i64.const -5) (i64.const 2)) (i64.const -2))
(assert_return (invoke "div_s" (i64.const 5) (i64.const -2)) (i64.const -2))
(assert_return (invoke "div_s" (i64.const -5) (i64.const -2)) (i64.const 2))
(assert_return (invoke "div_s" (i64.const 7) (i64.const 3)) (i64.const 2))
(assert_return (invoke "div_s" (i64.const -7) (i64.const 3)) (i64.const -2))
(assert_return (invoke "div_s" (i64.const 7) (i64.const -3)) (i64.const -2))
(assert_return (invoke "div_s" (i64.const -7) (i64.const -3)) (i64.const 2))
(assert_return (invoke "div_s" (i64.const 11) (i64.const 5)) (i64.const 2))
(assert_return (invoke "div_s" (i64.const 17) (i64.const 7)) (i64.const 2))

(assert_trap (invoke "div_u" (i64.const 1) (i64.const 0)) "integer divide by zero")
(assert_trap (invoke "div_u" (i64.const 0) (i64.const 0)) "integer divide by zero")
(assert_return (invoke "div_u" (i64.const 1) (i64.const 1)) (i64.const 1))
(assert_return (invoke "div_u" (i64.const 0) (i64.const 1)) (i64.const 0))
(assert_return (invoke "div_u" (i64.const -1) (i64.const -1)) (i64.const 1))
(assert_return (invoke "div_u" (i64.const 0x8000000000000000) (i64.const -1)) (i64.const 0))
(assert_return (invoke "div_u" (i64.const 0x8000000000000000) (i64.const 2)) (i64.const 0x4000000000000000))
(assert_return (invoke "div_u" (i64.const 0x8ff00ff00ff00ff0) (i64.const 0x100000001)) (i64.const 0x8ff00fef))
(assert_return (invoke "div_u" (i64.const 0x8000000000000001) (i64.const 1000)) (i64.const 0x20c49ba5e353f7))
(assert_return (invoke "div_u" (i64.const 5) (i64.const 2)) (i64.const 2))
(assert_return (invoke "div_u" (i64.const -5) (i64.const 2)) (i64.const 0x7ffffffffffffffd))
(assert_return (invoke "div_u" (i64.const 5) (i64.const -2)) (i64.const 0))
(assert_return (invoke "div_u" (i64.const -5) (i64.const -2)) (i64.const 0))
(assert_return (invoke "div_u" (i64.const 7) (i64.const 3)) (i64.const 2))
(assert_return (invoke "div_u" (i64.const 11) (i64.const 5)) (i64.const 2))
(assert_return (invoke "div_u" (i64.const 17) (i64.const 7)) (i64.const 2))

(assert_trap (invoke "rem_s" (i64.const 1) (i64.const 0)) "integer divide by zero")
(assert_trap (invoke "rem_s" (i64.const 0) (i64.const 0)) "integer divide by zero")
(assert_return (invoke "rem_s" (i64.const 0x7fffffffffffffff) (i64.const -1)) (i64.const 0))
(assert_return (invoke "rem_s" (i64.const 1) (i64.const 1)) (i64.const 0))
(assert_return (invoke "rem_s" (i64.const 0) (i64.const 1)) (i64.const 0))
(assert_return (invoke "rem_s" (i64.const -1) (i64.const -1)) (i64.const 0))
(assert_return (invoke "rem_s" (i64.const 0x8000000000000000) (i64.const -1)) (i64.const 0))
(assert_return (invoke "rem_s" (i64.const 0x8000000000000000) (i64.const 2)) (i64.const 0))
(assert_return (invoke "rem_s" (i64.const 0x8000000000000001) (i64.const 1000)) (i64.const -807))
(assert_return (invoke "rem_s" (i64.const 5) (i64.const 2)) (i64.const 1))
(assert_return (invoke "rem_s" (i64.const -5) (i64.const 2)) (i64.const -1))
(assert_return (invoke "rem_s" (i64.const 5) (i64.const -2)) (i64.const 1))
(assert_return (invoke "rem_s" (i64.const -5) (i64.const -2)) (i64.const -1))
(assert_return (invoke "rem_s" (i64.const 7) (i64.const 3)) (i64.const 1))
(assert_return (invoke "rem_s" (i64.const -7) (i64.const 3)) (i64.const -1))
(assert_return (invoke "rem_s" (i64.const 7) (i64.const -3)) (i64.const 1))
(assert_return (invoke "rem_s" (i64.const -7) (i64.const -3)) (i64.const -1))
(assert_return (invoke "rem_s" (i64.const 11) (i64.const 5)) (i64.const 1))
(assert_return (invoke "rem_s" (i64.const 17) (i64.const 7)) (i64.const 3))

(assert_trap (invoke "rem_u" (i64.const 1) (i64.const 0)) "integer divide by zero")
(assert_trap (invoke "rem_u" (i64.const 0) (i64.const 0)) "integer divide by zero")
(assert_return (invoke "rem_u" (i64.const 1) (i64.const 1)) (i64.const 0))
(assert_return (invoke "rem_u" (i64.const 0) (i64.const 1)) (i64.const 0))
(assert_return (invoke "rem_u" (i64.const -1) (i64.const -1)) (i64.const 0))
(assert_return (invoke "rem_u" (i64.const 0x8000000000000000) (i64.const -1)) (i64.const 0x8000000000000000))
(assert_return (invoke "rem_u" (i64.const 0x8000000000000000) (i64.const 2)) (i64.const 0))
(assert_return (invoke "rem_u" (i64.const 0x8ff00ff00ff00ff0) (i64.const 0x100000001)) (i64.const 0x80000001))
(assert_return (invoke "rem_u" (i64.const 0x8000000000000001) (i64.const 1000)) (i64.const 809))
(assert_return (invoke "rem_u" (i64.const 5) (i64.const 2)) (i64.const 1))
(assert_return (invoke "rem_u" (i64.const -5) (i64.const 2)) (i64.const 1))
(assert_return (invoke "rem_u" (i64.const 5) (i64.const -2)) (i64.const 5))
(assert_return (invoke "rem_u" (i64.const -5) (i64.const -2)) (i64.const -5))
(assert_return (invoke "rem_u" (i64.const 7) (i64.const 3)) (i64.const 1))
(assert_return (invoke "rem_u" (i64.const 11) (i64.const 5)) (i64.const 1))
(assert_return (invoke "rem_u" (i64.const 17) (i64.const 7)) (i64.const 3))

(assert_return (invoke "and" (i64.const 1) (i64.const 0)) (i64.const 0))
(assert_return (invoke "and" (i64.const 0) (i64.const 1)) (i64.const 0))
(assert_return (invoke "and" (i64.const 1) (i64.const 1)) (i64.const 1))
(assert_return (invoke "and" (i64.const 0) (i64.const 0)) (i64.const 0))
(assert_return (invoke "and" (i64.const 0x7fffffffffffffff) (i64.const 0x8000000000000000)) (i64.const 0))
(assert_return (invoke "and" (i64.const 0x7fffffffffffffff) (i64.const -1)) (i64.const 0x7fffffffffffffff))
(assert_return (invoke "and" (i64.const 0xf0f0ffff) (i64.const 0xfffff0f0)) (i64.const 0xf0f0f0f0))
(assert_return (invoke "and" (i64.const 0xffffffffffffffff) (i64.const 0xffffffffffffffff)) (i64.const 0xffffffffffffffff))

(assert_return (invoke "or" (i64.const 1) (i64.const 0)) (i64.const 1))
(assert_return (invoke "or" (i64.const 0) (i64.const 1)) (i64.const 1))
(assert_return (invoke "or" (i64.const 1) (i64.const 1)) (i64.const 1))
(assert_return (invoke "or" (i64.const 0) (i64.const 0)) (i64.const 0))
(assert_return (invoke "or" (i64.const 0x7fffffffffffffff) (i64.const 0x8000000000000000)) (i64.const -1))
(assert_return (invoke "or" (i64.const 0x8000000000000000) (i64.const 0)) (i64.const 0x8000000000000000))
(assert_return (invoke "or" (i64.const 0xf0f0ffff) (i64.const 0xfffff0f0)) (i64.const 0xffffffff))
(assert_return (invoke "or" (i64.const 0xffffffffffffffff) (i64.const 0xffffffffffffffff)) (i64.const 0xffffffffffffffff))

(assert_return (invoke "xor" (i64.const 1) (i64.const 0)) (i64.const 1))
(assert_return (invoke "xor" (i64.const 0) (i64.const 1)) (i64.const 1))
(assert_return (invoke "xor" (i64.const 1) (i64.const 1)) (i64.const 0))
(assert_return (invoke "xor" (i64.const 0) (i64.const 0)) (i64.const 0))
(assert_return (invoke "xor" (i64.const 0x7fffffffffffffff) (i64.const 0x8000000000000000)) (i64.const -1))
(assert_return (invoke "xor" (i64.const 0x8000000000000000) (i64.const 0)) (i64.const 0x8000000000000000))
(assert_return (invoke "xor" (i64.const -1) (i64.const 0x8000000000000000)) (i64.const 0x7fffffffffffffff))
(assert_return (invoke "xor" (i64.const -1) (i64.const 0x7fffffffffffffff)) (i64.const 0x8000000000000000))
(assert_return (invoke "xor" (i64.const 0xf0f0ffff) (i64.const 0xfffff0f0)) (i64.const 0x0f0f0f0f))
(assert_return (invoke "xor" (i64.const 0xffffffffffffffff) (i64.const 0xffffffffffffffff)) (i64.const 0))

(assert_return (invoke "shl" (i64.const 1) (i64.const 1)) (i64.const 2))
(assert_return (invoke "shl" (i64.const 1) (i64.const 0)) (i64.const 1))
(assert_return (invoke "shl" (i64.const 0x7fffffffffffffff) (i64.const 1)) (i64.const 0xfffffffffffffffe))
(assert_return (invoke "shl" (i64.const 0xffffffffffffffff) (i64.const 1)) (i64.const 0xfffffffffffffffe))
(assert_return (invoke "shl" (i64.const 0x8000000000000000) (i64.const 1)) (i64.const 0))
(assert_return (invoke "shl" (i64.const 0x4000000000000000) (i64.const 1)) (i64.const 0x8000000000000000))
(assert_return (invoke "shl" (i64.const 1) (i64.const 63)) (i64.const 0x8000000000000000))
(assert_return (invoke "shl" (i64.const 1) (i64.const 64)) (i64.const 0))
(assert_return (invoke "shl" (i64.const 1) (i64.const 65)) (i64.const 0))
(assert_return (invoke "shl" (i64.const 1) (i64.const -1)) (i64.const 0))
(assert_return (invoke "shl" (i64.const 1) (i64.const 0x7fffffffffffffff)) (i64.const 0))

(assert_return (invoke "shr_s" (i64.const 1) (i64.const 1)) (i64.const 0))
(assert_return (invoke "shr_s" (i64.const 1) (i64.const 0)) (i64.const 1))
(assert_return (invoke "shr_s" (i64.const -1) (i64.const 1)) (i64.const -1))
(assert_return (invoke "shr_s" (i64.const 0x7fffffffffffffff) (i64.const 1)) (i64.const 0x3fffffffffffffff))
(assert_return (invoke "shr_s" (i64.const 0x8000000000000000) (i64.const 1)) (i64.const 0xc000000000000000))
(assert_return (invoke "shr_s" (i64.const 0x4000000000000000) (i64.const 1)) (i64.const 0x2000000000000000))
(assert_return (invoke "shr_s" (i64.const 1) (i64.const 64)) (i64.const 0))
(assert_return (invoke "shr_s" (i64.const 1) (i64.const 65)) (i64.const 0))
(assert_return (invoke "shr_s" (i64.const 1) (i64.const -1)) (i64.const 0))
(assert_return (invoke "shr_s" (i64.const 1) (i64.const 0x7fffffffffffffff)) (i64.const 0))
(assert_return (invoke "shr_s" (i64.const 1) (i64.const 0x8000000000000000)) (i64.const 0))
(assert_return (invoke "shr_s" (i64.const 0x8000000000000000) (i64.const 63)) (i64.const -1))
(assert_return (invoke "shr_s" (i64.const -1) (i64.const 64)) (i64.const -1))
(assert_return (invoke "shr_s" (i64.const -1) (i64.const 65)) (i64.const -1))
(assert_return (invoke "shr_s" (i64.const -1) (i64.const -1)) (i64.const -1))
(assert_return (invoke "shr_s" (i64.const -1) (i64.const 0x7fffffffffffffff)) (i64.const -1))
(assert_return (invoke "shr_s" (i64.const -1) (i64.const 0x8000000000000000)) (i64.const -1))

(assert_return (invoke "shr_u" (i64.const 1) (i64.const 1)) (i64.const 0))
(assert_return (invoke "shr_u" (i64.const 1) (i64.const 0)) (i64.const 1))
(assert_return (invoke "shr_u" (i64.const -1) (i64.const 1)) (i64.const 0x7fffffffffffffff))
(assert_return (invoke "shr_u" (i64.const 0x7fffffffffffffff) (i64.const 1)) (i64.const 0x3fffffffffffffff))
(assert_return (invoke "shr_u" (i64.const 0x8000000000000000) (i64.const 1)) (i64.const 0x4000000000000000))
(assert_return (invoke "shr_u" (i64.const 0x4000000000000000) (i64.const 1)) (i64.const 0x2000000000000000))
(assert_return (invoke "shr_u" (i64.const 1) (i64.const 64)) (i64.const 0))
(assert_return (invoke "shr_u" (i64.const 1) (i64.const 65)) (i64.const 0))
(assert_return (invoke "shr_u" (i64.const 1) (i64.const -1)) (i64.const 0))
(assert_return (invoke "shr_u" (i64.const 1) (i64.const 0x7fffffffffffffff)) (i64.const 0))
(assert_return (invoke "shr_u" (i64.const 1) (i64.const 0x8000000000000000)) (i64.const 0))
(assert_return (invoke "shr_u" (i64.const 0x8000000000000000) (i64.const 63)) (i64.const 1))
(assert_return (invoke "shr_u" (i64.const -1) (i64.const 64)) (i64.const 0))
(assert_return (invoke "shr_u" (i64.const -1) (i64.const 65)) (i64.const 0))
(assert_return (invoke "shr_u" (i64.const -1) (i64.const -1)) (i64.const 0))
(assert_return (invoke "shr_u" (i64.const -1) (i64.const 0x7fffffffffffffff)) (i64.const 0))
(assert_return (invoke "shr_u" (i64.const -1) (i64.const 0x8000000000000000)) (i64.const 0))

(assert_return (invoke "clz" (i64.const 0xffffffffffffffff)) (i64.const 0))
(assert_return (invoke "clz" (i64.const 0)) (i64.const 64))
(assert_return (invoke "clz" (i64.const 0x00008000)) (i64.const 48))
(assert_return (invoke "clz" (i64.const 0xff)) (i64.const 56))
(assert_return (invoke "clz" (i64.const 0x8000000000000000)) (i64.const 0))
(assert_return (invoke "clz" (i64.const 1)) (i64.const 63))
(assert_return (invoke "clz" (i64.const 2)) (i64.const 62))

(assert_return (invoke "ctz" (i64.const -1)) (i64.const 0))
(assert_return (invoke "ctz" (i64.const 0)) (i64.const 64))
(assert_return (invoke "ctz" (i64.const 0x00008000)) (i64.const 15))
(assert_return (invoke "ctz" (i64.const 0x00010000)) (i64.const 16))
(assert_return (invoke "ctz" (i64.const 0x8000000000000000)) (i64.const 63))

(assert_return (invoke "popcnt" (i64.const -1)) (i64.const 64))
(assert_return (invoke "popcnt" (i64.const 0)) (i64.const 0))
(assert_return (invoke "popcnt" (i64.const 0x00008000)) (i64.const 1))

(assert_return (invoke "eq" (i64.const 0) (i64.const 0)) (i32.const 1))
(assert_return (invoke "eq" (i64.const 1) (i64.const 1)) (i32.const 1))
(assert_return (invoke "eq" (i64.const -1) (i64.const 1)) (i32.const 0))
(assert_return (invoke "eq" (i64.const 0x8000000000000000) (i64.const 0x8000000000000000)) (i32.const 1))
(assert_return (invoke "eq" (i64.const 0x7fffffffffffffff) (i64.const 0x7fffffffffffffff)) (i32.const 1))
(assert_return (invoke "eq" (i64.const -1) (i64.const -1)) (i32.const 1))
(assert_return (invoke "eq" (i64.const 1) (i64.const 0)) (i32.const 0))
(assert_return (invoke "eq" (i64.const 0x8000000000000000) (i64.const 0)) (i32.const 0))
(assert_return (invoke "eq" (i64.const 0x8000000000000000) (i64.const -1)) (i32.const 0))
(assert_return (invoke "eq" (i64.const 0x8000000000000000) (i64.const 0x7fffffffffffffff)) (i32.const 0))

(assert_return (invoke "ne" (i64.const 0) (i64.const 0)) (i32.const 0))
(assert_return (invoke "ne" (i64.const 1) (i64.const 1)) (i32.const 0))
(assert_return (invoke "ne" (i64.const -1) (i64.const 1)) (i32.const 1))
(assert_return (invoke "ne" (i64.const 0x8000000000000000) (i64.const 0x8000000000000000)) (i32.const 0))
(assert_return (invoke "ne" (i64.const 0x7fffffffffffffff) (i64.const 0x7fffffffffffffff)) (i32.const 0))
(assert_return (invoke "ne" (i64.const -1) (i64.const -1)) (i32.const 0))
(assert_return (invoke "ne" (i64.const 1) (i64.const 0)) (i32.const 1))
(assert_return (invoke "ne" (i64.const 0x8000000000000000) (i64.const 0)) (i32.const 1))
(assert_return (invoke "ne" (i64.const 0x8000000000000000) (i64.const -1)) (i32.const 1))
(assert_return (invoke "ne" (i64.const 0x8000000000000000) (i64.const 0x7fffffffffffffff)) (i32.const 1))

(assert_return (invoke "lt_s" (i64.const 0) (i64.const 0)) (i32.const 0))
(assert_return (invoke "lt_s" (i64.const 1) (i64.const 1)) (i32.const 0))
(assert_return (invoke "lt_s" (i64.const -1) (i64.const 1)) (i32.const 1))
(assert_return (invoke "lt_s" (i64.const 0x8000000000000000) (i64.const 0x8000000000000000)) (i32.const 0))
(assert_return (invoke "lt_s" (i64.const 0x7fffffffffffffff) (i64.const 0x7fffffffffffffff)) (i32.const 0))
(assert_return (invoke "lt_s" (i64.const -1) (i64.const -1)) (i32.const 0))
(assert_return (invoke "lt_s" (i64.const 1) (i64.const 0)) (i32.const 0))
(assert_return (invoke "lt_s" (i64.const 0) (i64.const 1)) (i32.const 1))
(assert_return (invoke "lt_s" (i64.const 0x8000000000000000) (i64.const 0)) (i32.const 1))
(assert_return (invoke "lt_s" (i64.const 0) (i64.const 0x8000000000000000)) (i32.const 0))
(assert_return (invoke "lt_s" (i64.const 0x8000000000000000) (i64.const -1)) (i32.const 1))
(assert_return (invoke "lt_s" (i64.const -1) (i64.const 0x8000000000000000)) (i32.const 0))
(assert_return (invoke "lt_s" (i64.const 0x8000000000000000) (i64.const 0x7fffffffffffffff)) (i32.const 1))
(assert_return (invoke "lt_s" (i64.const 0x7fffffffffffffff) (i64.const 0x8000000000000000)) (i32.const 0))

(assert_return (invoke "lt_u" (i64.const 0) (i64.const 0)) (i32.const 0))
(assert_return (invoke "lt_u" (i64.const 1) (i64.const 1)) (i32.const 0))
(assert_return (invoke "lt_u" (i64.const -1) (i64.const 1)) (i32.const 0))
(assert_return (invoke "lt_u" (i64.const 0x8000000000000000) (i64.const 0x8000000000000000)) (i32.const 0))
(assert_return (invoke "lt_u" (i64.const 0x7fffffffffffffff) (i64.const 0x7fffffffffffffff)) (i32.const 0))
(assert_return (invoke "lt_u" (i64.const -1) (i64.const -1)) (i32.const 0))
(assert_return (invoke "lt_u" (i64.const 1) (i64.const 0)) (i32.const 0))
(assert_return (invoke "lt_u" (i64.const 0) (i64.const 1)) (i32.const 1))
(assert_return (invoke "lt_u" (i64.const 0x8000000000000000) (i64.const 0)) (i32.const 0))
(assert_return (invoke "lt_u" (i64.const 0) (i64.const 0x8000000000000000)) (i32.const 1))
(assert_return (invoke "lt_u" (i64.const 0x8000000000000000) (i64.const -1)) (i32.const 1))
(assert_return (invoke "lt_u" (i64.const -1) (i64.const 0x8000000000000000)) (i32.const 0))
(assert_return (invoke "lt_u" (i64.const 0x8000000000000000) (i64.const 0x7fffffffffffffff)) (i32.const 0))
(assert_return (invoke "lt_u" (i64.const 0x7fffffffffffffff) (i64.const 0x8000000000000000)) (i32.const 1))

(assert_return (invoke "le_s" (i64.const 0) (i64.const 0)) (i32.const 1))
(assert_return (invoke "le_s" (i64.const 1) (i64.const 1)) (i32.const 1))
(assert_return (invoke "le_s" (i64.const -1) (i64.const 1)) (i32.const 1))
(assert_return (invoke "le_s" (i64.const 0x8000000000000000) (i64.const 0x8000000000000000)) (i32.const 1))
(assert_return (invoke "le_s" (i64.const 0x7fffffffffffffff) (i64.const 0x7fffffffffffffff)) (i32.const 1))
(assert_return (invoke "le_s" (i64.const -1) (i64.const -1)) (i32.const 1))
(assert_return (invoke "le_s" (i64.const 1) (i64.const 0)) (i32.const 0))
(assert_return (invoke "le_s" (i64.const 0) (i64.const 1)) (i32.const 1))
(assert_return (invoke "le_s" (i64.const 0x8000000000000000) (i64.const 0)) (i32.const 1))
(assert_return (invoke "le_s" (i64.const 0) (i64.const 0x8000000000000000)) (i32.const 0))
(assert_return (invoke "le_s" (i64.const 0x8000000000000000) (i64.const -1)) (i32.const 1))
(assert_return (invoke "le_s" (i64.const -1) (i64.const 0x8000000000000000)) (i32.const 0))
(assert_return (invoke "le_s" (i64.const 0x8000000000000000) (i64.const 0x7fffffffffffffff)) (i32.const 1))
(assert_return (invoke "le_s" (i64.const 0x7fffffffffffffff) (i64.const 0x8000000000000000)) (i32.const 0))

(assert_return (invoke "le_u" (i64.const 0) (i64.const 0)) (i32.const 1))
(assert_return (invoke "le_u" (i64.const 1) (i64.const 1)) (i32.const 1))
(assert_return (invoke "le_u" (i64.const -1) (i64.const 1)) (i32.const 0))
(assert_return (invoke "le_u" (i64.const 0x8000000000000000) (i64.const 0x8000000000000000)) (i32.const 1))
(assert_return (invoke "le_u" (i64.const 0x7fffffffffffffff) (i64.const 0x7fffffffffffffff)) (i32.const 1))
(assert_return (invoke "le_u" (i64.const -1) (i64.const -1)) (i32.const 1))
(assert_return (invoke "le_u" (i64.const 1) (i64.const 0)) (i32.const 0))
(assert_return (invoke "le_u" (i64.const 0) (i64.const 1)) (i32.const 1))
(assert_return (invoke "le_u" (i64.const 0x8000000000000000) (i64.const 0)) (i32.const 0))
(assert_return (invoke "le_u" (i64.const 0) (i64.const 0x8000000000000000)) (i32.const 1))
(assert_return (invoke "le_u" (i64.const 0x8000000000000000) (i64.const -1)) (i32.const 1))
(assert_return (invoke "le_u" (i64.const -1) (i64.const 0x8000000000000000)) (i32.const 0))
(assert_return (invoke "le_u" (i64.const 0x8000000000000000) (i64.const 0x7fffffffffffffff)) (i32.const 0))
(assert_return (invoke "le_u" (i64.const 0x7fffffffffffffff) (i64.const 0x8000000000000000)) (i32.const 1))

(assert_return (invoke "gt_s" (i64.const 0) (i64.const 0)) (i32.const 0))
(assert_return (invoke "gt_s" (i64.const 1) (i64.const 1)) (i32.const 0))
(assert_return (invoke "gt_s" (i64.const -1) (i64.const 1)) (i32.const 0))
(assert_return (invoke "gt_s" (i64.const 0x8000000000000000) (i64.const 0x8000000000000000)) (i32.const 0))
(assert_return (invoke "gt_s" (i64.const 0x7fffffffffffffff) (i64.const 0x7fffffffffffffff)) (i32.const 0))
(assert_return (invoke "gt_s" (i64.const -1) (i64.const -1)) (i32.const 0))
(assert_return (invoke "gt_s" (i64.const 1) (i64.const 0)) (i32.const 1))
(assert_return (invoke "gt_s" (i64.const 0) (i64.const 1)) (i32.const 0))
(assert_return (invoke "gt_s" (i64.const 0x8000000000000000) (i64.const 0)) (i32.const 0))
(assert_return (invoke "gt_s" (i64.const 0) (i64.const 0x8000000000000000)) (i32.const 1))
(assert_return (invoke "gt_s" (i64.const 0x8000000000000000) (i64.const -1)) (i32.const 0))
(assert_return (invoke "gt_s" (i64.const -1) (i64.const 0x8000000000000000)) (i32.const 1))
(assert_return (invoke "gt_s" (i64.const 0x8000000000000000) (i64.const 0x7fffffffffffffff)) (i32.const 0))
(assert_return (invoke "gt_s" (i64.const 0x7fffffffffffffff) (i64.const 0x8000000000000000)) (i32.const 1))

(assert_return (invoke "gt_u" (i64.const 0) (i64.const 0)) (i32.const 0))
(assert_return (invoke "gt_u" (i64.const 1) (i64.const 1)) (i32.const 0))
(assert_return (invoke "gt_u" (i64.const -1) (i64.const 1)) (i32.const 1))
(assert_return (invoke "gt_u" (i64.const 0x8000000000000000) (i64.const 0x8000000000000000)) (i32.const 0))
(assert_return (invoke "gt_u" (i64.const 0x7fffffffffffffff) (i64.const 0x7fffffffffffffff)) (i32.const 0))
(assert_return (invoke "gt_u" (i64.const -1) (i64.const -1)) (i32.const 0))
(assert_return (invoke "gt_u" (i64.const 1) (i64.const 0)) (i32.const 1))
(assert_return (invoke "gt_u" (i64.const 0) (i64.const 1)) (i32.const 0))
(assert_return (invoke "gt_u" (i64.const 0x8000000000000000) (i64.const 0)) (i32.const 1))
(assert_return (invoke "gt_u" (i64.const 0) (i64.const 0x8000000000000000)) (i32.const 0))
(assert_return (invoke "gt_u" (i64.const 0x8000000000000000) (i64.const -1)) (i32.const 0))
(assert_return (invoke "gt_u" (i64.const -1) (i64.const 0x8000000000000000)) (i32.const 1))
(assert_return (invoke "gt_u" (i64.const 0x8000000000000000) (i64.const 0x7fffffffffffffff)) (i32.const 1))
(assert_return (invoke "gt_u" (i64.const 0x7fffffffffffffff) (i64.const 0x8000000000000000)) (i32.const 0))

(assert_return (invoke "ge_s" (i64.const 0) (i64.const 0)) (i32.const 1))
(assert_return (invoke "ge_s" (i64.const 1) (i64.const 1)) (i32.const 1))
(assert_return (invoke "ge_s" (i64.const -1) (i64.const 1)) (i32.const 0))
(assert_return (invoke "ge_s" (i64.const 0x8000000000000000) (i64.const 0x8000000000000000)) (i32.const 1))
(assert_return (invoke "ge_s" (i64.const 0x7fffffffffffffff) (i64.const 0x7fffffffffffffff)) (i32.const 1))
(assert_return (invoke "ge_s" (i64.const -1) (i64.const -1)) (i32.const 1))
(assert_return (invoke "ge_s" (i64.const 1) (i64.const 0)) (i32.const 1))
(assert_return (invoke "ge_s" (i64.const 0) (i64.const 1)) (i32.const 0))
(assert_return (invoke "ge_s" (i64.const 0x8000000000000000) (i64.const 0)) (i32.const 0))
(assert_return (invoke "ge_s" (i64.const 0) (i64.const 0x8000000000000000)) (i32.const 1))
(assert_return (invoke "ge_s" (i64.const 0x8000000000000000) (i64.const -1)) (i32.const 0))
(assert_return (invoke "ge_s" (i64.const -1) (i64.const 0x8000000000000000)) (i32.const 1))
(assert_return (invoke "ge_s" (i64.const 0x8000000000000000) (i64.const 0x7fffffffffffffff)) (i32.const 0))
(assert_return (invoke "ge_s" (i64.const 0x7fffffffffffffff) (i64.const 0x8000000000000000)) (i32.const 1))

(assert_return (invoke "ge_u" (i64.const 0) (i64.const 0)) (i32.const 1))
(assert_return (invoke "ge_u" (i64.const 1) (i64.const 1)) (i32.const 1))
(assert_return (invoke "ge_u" (i64.const -1) (i64.const 1)) (i32.const 1))
(assert_return (invoke "ge_u" (i64.const 0x8000000000000000) (i64.const 0x8000000000000000)) (i32.const 1))
(assert_return (invoke "ge_u" (i64.const 0x7fffffffffffffff) (i64.const 0x7fffffffffffffff)) (i32.const 1))
(assert_return (invoke "ge_u" (i64.const -1) (i64.const -1)) (i32.const 1))
(assert_return (invoke "ge_u" (i64.const 1) (i64.const 0)) (i32.const 1))
(assert_return (invoke "ge_u" (i64.const 0) (i64.const 1)) (i32.const 0))
(assert_return (invoke "ge_u" (i64.const 0x8000000000000000) (i64.const 0)) (i32.const 1))
(assert_return (invoke "ge_u" (i64.const 0) (i64.const 0x8000000000000000)) (i32.const 0))
(assert_return (invoke "ge_u" (i64.const 0x8000000000000000) (i64.const -1)) (i32.const 0))
(assert_return (invoke "ge_u" (i64.const -1) (i64.const 0x8000000000000000)) (i32.const 1))
(assert_return (invoke "ge_u" (i64.const 0x8000000000000000) (i64.const 0x7fffffffffffffff)) (i32.const 1))
(assert_return (invoke "ge_u" (i64.const 0x7fffffffffffffff) (i64.const 0x8000000000000000)) (i32.const 0))
