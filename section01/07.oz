% 7 明示的状態

local X in
   X=23
   local X in
      X=44
   end
   {Browse X} %23
end

local X in
   X={NewCell 23}
   X:=44
   {Browse @X} %44
end