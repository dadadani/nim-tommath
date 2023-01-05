# Package

version       = "1.0.0"
author        = "dadadani"
description   = "High-Level wrapper of libtommath for Nim"
license       = "MIT"
srcDir        = "src"

# Dependencies

requires "nim >= 1.6.0"

task test, "Test bigints":
  for backend in ["c", "cpp"]:
    echo "testing " & backend & " backend"
    for gc in ["refc", "arc", "orc"]:
      echo "  using " & gc & " GC"
      for file in ["test_advanced_operands.nim", "test_basic_operands.nim", "test_bitwise.nim", "test_compare.nim", "test_other.nim", "test_read_write.nim"]:
        exec "nim r --hints:off --experimental:strictFuncs --backend:" & backend & " --gc:" & gc & " tests/" & file
