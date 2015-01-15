% 8 明示的状態と関数

declare
local Acc in
   Acc={NewCell 0}
   fun {Accumulate N}
      Acc:=@Acc+N
      @Acc
   end
end

{Browse {Accumulate 5}}
{Browse {Accumulate 10}}