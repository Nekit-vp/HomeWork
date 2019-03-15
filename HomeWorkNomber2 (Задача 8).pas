Program HomeWorkNomber2;

type  
    list = ^newList;
    
    newList = record
        info: integer;
        next: list;
    end;

Var
    head, headCopy: list;
    i, n, x: integer;

Procedure Create(inf: integer);  // создание списка
Var
    NewUzel, buf: list;
begin 
    new(NewUzel);
    NewUzel^.info := inf;
    if head = nil then 
        head := NewUzel
    else  begin
        buf := head;
        while buf^.next <> nil do 
            buf := buf^.next;
        buf^.next := NewUzel;
    end;
end;

Function Copy(Uzel : list):list;// рекурсивная функция copy(L), которая строит копию списка L
var NewUzel : list;
begin
if Uzel = nil then Copy:= nil  // если дошли до конца копирования списка, то функция возвращает nil
    else begin 
        new(NewUzel); //создание копии элемента
        NewUzel^.info:= Uzel^.info; // пренесение информации с оригинала в копию
        NewUzel^.next:= Copy(Uzel^.next); //присваивание ссылки на след элемент(рекурсия)
        Copy := NewUzel;  // возвращение значения функции
    end;
end;

Procedure WriteList(start : list); // вывод списка по голове start
Var buf: list;
begin
    write('Список: ');
    buf := start;
    while buf <> nil do begin
        write(buf^.info, ' ');
        buf := buf^.next;
    end;
end;

begin
    write('Количество узлов в списке: ');
    readln(n);
    write('Введите элементы: ');
    for i := 1 to n do begin
        read(x);
        Create(x);
    end;
    WriteList(head);
    writeln;
    headCopy := Copy(head);  // присваивание новой голову копию спска с головой head
    writeln('Копия списка сделана!'); 
    WriteList(headCopy); //вывод копированного списка
end.