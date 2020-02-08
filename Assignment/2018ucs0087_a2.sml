fun insertsort [] = []
  | insertsort (x::xs) =
    let fun insert (x:real, []) = [x]
          | insert (x:real, y::ys) =
              if x<=y then x::y::ys
              else y::insert(x, ys)
    in insert(x, insertsort xs)
    end;
fun add (a,b) = a+b