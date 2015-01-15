% 2 組み合わせの計算

% (a)

declare Fact Numer Denom FastComb
fun {Fact N}
   if N==0 then 1 else N*{Fact N-1} end
end

fun {Numer N K}
   if K==0 then 1 else N*{Numer N-1 K-1} end
end

fun {Denom K}
   if K==0 then 1 else {Fact K} end
end

fun {FastComb N K}
   {Numer N K} div {Denom K}
end

{Browse {FastComb 10 3}}
% 120

% (b)

declare Fact Numer Denom FastComb FasterComb
fun {Fact N}
   if N==0 then 1 else N*{Fact N-1} end
end

fun {Numer N K}
   if K==0 then 1 else N*{Numer N-1 K-1} end
end

fun {Denom K}
   if K==0 then 1 else {Fact K} end
end

fun {FastComb N K}
   {Numer N K} div {Denom K}
end

fun {FasterComb N K}
   if K > N div 2 then {FastComb N K}
   else {FastComb N N-K} end
end

{Browse {FasterComb 10 3}}
% 120