% 10 明示的状態と並列性

% (a)

declare
C={NewCell 0}

thread
   C:=1
end

thread
   C:=2
end

{Delay 1000}
{Browse @C}

% 何度実行しても2が出力される.
% 理由: threadは上の行から順に開始されるためC:=1がC:=2より先に実行される

% (b)

declare
C={NewCell 0}

thread
   {Delay 100}
   C:=1
end

thread
   {Delay 10}
   C:=2
end

{Delay 1000}
{Browse @C}

% (c)

declare
C={NewCell 0}
L={NewLock}

thread
   lock L then I in
      {Delay 10}
      I=@C
      C:=I+1
   end
end

thread
   lock L then J in
      {Delay 100}
      J=@C
      C:=J+1
   end
end

{Delay 100}
{Browse @C}