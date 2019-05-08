Program Turing;
label q0, q1, q2, q3;

var mas: array[1..50] of char;
    cursor, i , number, numberMax, max , min: integer;
    lenta : string;
    
    
Procedure actions;
begin
    inc(number);
    if cursor > max then max := cursor;
    if cursor < min then min := cursor;
end;


begin
    for i:= 1 to 50 do
        mas[i] := '_';
    write('Введите ленту: ');
    read(lenta);
    for i:= 1 to length(lenta) do 
        mas[i+9] := lenta[i];
    cursor := 10;
    number := 0;
    write('Установите максимальное количество тактов: ');
    read(numberMax);
    max := -1;
    min := 10;
    
    q1:
    case mas[cursor] of
        '_': begin                     inc(cursor); actions; if (number = numberMax) then goto q0;  goto q1; end;
        '0': begin                     inc(cursor); actions; if (number = numberMax) then goto q0; goto q1; end;
        '1': begin mas[cursor] := '_'; inc(cursor); actions; if (number = numberMax) then goto q0; goto q3; end;
        '*': begin mas[cursor] := '_';              actions; if (number = numberMax) then goto q0; goto q0; end;
    end;
    
    q2: 
    case mas[cursor] of
        '_': begin mas[cursor] := '_'; inc(cursor); actions; if (number = numberMax) then goto q0; goto q1; end;
        '0': begin mas[cursor] := '*'; dec(cursor); actions; if (number = numberMax) then goto q0; goto q3; end;
        '1': begin mas[cursor] := '1'; dec(cursor); actions; if (number = numberMax) then goto q0; goto q2; end;
        '*': begin mas[cursor] := '*'; dec(cursor); actions; if (number = numberMax) then goto q0; goto q2; end;
    end;

    q3: 
    case mas[cursor] of
        '_': begin mas[cursor] := '1';              actions; if (number = numberMax) then goto q0; goto q2; end;
        '0': begin mas[cursor] := '_';              actions; if (number = numberMax) then goto q0; goto q2; end;
        '1': begin mas[cursor] := '1'; inc(cursor); actions; if (number = numberMax) then goto q0; goto q3; end;
        '*': begin mas[cursor] := '*'; inc(cursor); actions; if (number = numberMax) then goto q0; goto q3; end;
    end;

    q0:
    for i := 1 to 50 do 
        write(mas[i]);
    writeln;
    writeln('Машина прошла ',number,' тактов');
    writeln('Машина обошла ', max - min + 1,' ячеек');
end.
