% 9 記憶域

% (a)

declare
S={NewStore}
{Put S 2 [22 33]}
{Browse {Get S 2}}
{Browse {Size S}}

% (b)

declare Pascal AddList ShiftLeft ShiftRight FastPascal FasterPascal
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

local S = {NewStore} in
   {Put S 1 [1]}
   fun {FasterPascal N}
      if {Size S} >= N then {Get S N}
      else L in
	 L = {FasterPascal N-1}
	 {Put S N {AddList {ShiftLeft L} {ShiftRight L}}}
	 {Get S N}
      end
   end
end

{Browse {FasterPascal 10}}