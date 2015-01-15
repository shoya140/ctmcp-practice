% 6 高階プログラミング

declare Pascal AddList ShiftLeft ShiftRight FastPascal GenericPascal Add Xor MyMull Mull
fun {Pascal N}
   if N==1 then [1]
   else
      {AddList {ShiftLeft {Pascal N-1}} {ShiftRight {Pascal N-1}}}
   end
end

fun {ShiftLeft L}
   case L of H|T then
      H | {ShiftLeft T}
   else [0] end
end

fun {ShiftRight L} 0 | L end

fun {AddList L1 L2}
   case L1 of H1 | T1 then
      case L2 of H2 | T2 then
	 H1 + H2 | {AddList T1 T2}
      end
   else nil end
end

fun {FastPascal N}
   if N==1 then[1]
   else L in
      L = {FastPascal N-1}
      {AddList {ShiftLeft L} {ShiftRight L}}
   end
end

fun {GenericPascal Op N}
   if N==1 then [1]
   else L in
      L = {GenericPascal Op N-1}
      {OpList Op {ShiftLeft L} {ShiftRight L}}
   end
end

fun {OpList Op L1 L2}
   case L1 of H1|T1 then
      case L2 of H2|T2 then
	 {Op H1 H2}|{OpList Op T1 T2}
      end
   else nil end
end

fun {Add X Y} X+Y end

fun {Xor X Y} if X==Y then 0 else 1 end end

fun {Mull X Y} (X+1) * (Y+1) end

for I in 1..10 do {Browse {GenericPascal Mull I}} end