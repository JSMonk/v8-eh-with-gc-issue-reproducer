(module
  (import "env" "print" (func $print (param i32)))
  (type $ExceptionStruct (struct))
  (func $main
    block $catch (result i32) ;; catch block with the result of try/catch
      block $try (result (ref $ExceptionStruct)) ;; try block with an $exception param
        try_table (result (ref $ExceptionStruct)) (catch $exception $try)
          i32.const 1
          br $catch
        end
      end
      drop
      i32.const 0
    end
    call $print
  )
  (tag $exception (param (ref $ExceptionStruct)))
  (export "main" (func $main))
)
