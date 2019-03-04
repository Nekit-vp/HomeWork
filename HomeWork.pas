program HomeWork;

Uses crt;

type
    list = ^newList;
    
    newlist = record
        info: integer;
        next: list;
    end;

var
    ihead, bubble: list;
    x, n, i, Nomber: integer;

function CreateNewElement(information: integer): list; //функция создания нового элемнта: занесения в него данных и возвращение указателя на этот элемент
var
    NewElement: list;
begin
    new(NewElement);
    NewElement^.info := information;
    NewElement^.next := nil;
    result := NewElement;
end;

procedure addAfter(Afterlis: list; lis: list);//добавление после заданного Nolis элемента с указателем lis
begin
    lis^.next := Afterlis^.next;
    Afterlis^.next := lis;
end;

procedure addNewElement(lis: list);//добавление элемента в конец  списка(если там нет элементов, то создание нового)
var
    ba: list;
begin
    if ihead = nil then ihead := lis
    else begin
        ba := ihead;
        while ba^.next <> nil do 
           ba := ba^.next;
        addAfter(ba, lis);
    end;
end;

procedure Writelist;
var
    ba: list;
begin
    ba := ihead;
    repeat 
        write(ba^.info, ' ');
        ba := ba^.next;
    until ba = ihead;
end;

procedure Delite(No: integer); //процедура удаления элемента по номеру стоящего в списке No
var
    ba, bufer: list;
    count: integer;
begin
    if No = 1 then No := n + 1;
    count := 2;
    ba := ihead;
    while count <> No do 
    begin
        ba := ba^.next;
        inc(count);
    end;
    bufer := ba^.next;           //копирруем указатель на ненужный элемент  в некоторую переменную bufer, чтобы потом его удалить
    ba^.next := ba^.next^.next;
    Dispose(bufer);                 //освобождение динамической памяти по указателю
    if No = n + 1 then ihead := ba^.next;
end;

procedure NewElement(no : integer; information : integer);//процедура добавления нового элемента в циклический список
  Var NewElementlist, ba : list;
      count : integer;
      start : boolean;
Begin 
    if no = 1  then 
    begin
        no := n;
        start := true;        
    end;
    NewElementlist := CreateNewElement(information);// создание узла
    ba := ihead;
    count:= 2;
    while count <> no do begin
        ba := ba^.next;
        inc(count);
    end;
    addAfter(ba,NewElementlist);
    if start = true then ihead := NewElementlist;// проверка на добавление первого элемента и изменение головы
end;

Procedure Turning; //процедура обращения списка в противоположную сторону
Var
    buffer1, buffer2, bufer : list;
    a : integer;
begin
    buffer1 := ihead^.next;
    buffer2 := ihead^.next^.next;
    bufer := ihead;
    for a := 1 to n-1 do
    begin
        buffer1^.next := ihead;
        ihead := buffer1;
        buffer1 := buffer2;
        if buffer2 <> bufer then buffer2 := buffer2^.next;
        bufer^.next := ihead;
    end;


end;

begin
    write('Введите количество элементов в списке: ');
    read(n);
    write('Введите элементы списка: ');
    for i := 1 to n do 
    begin
        read(x);
          addNewElement(CreateNewElement(x));
      end;
    //преобразование линейного односвязного списка в циклический 
    bubble := ihead;
    while (bubble^.next <> nil) do 
        bubble := bubble^.next;
    bubble^.next := ihead;
    writeln('Список составлен и преобразован в циклический!');
    writelist;
    //подпрограмма удаления элемента
    writeln;
    write('Какой элемент Вам необходимо удалить? ');
    read(Nomber);
    Delite(Nomber);
    writelist;
    //подпрограмма добавления нового элемента
    writeln;
    write('Под каким номеров Вам нужно вставить новый элемент? ');
    read(Nomber);
    write('Какая информация будет в этом элементе? ');
    read(x);
    NewElement(Nomber,x);
    Writelist;
    
    writeln;
    Writeln('Изменение порядка списка: обращение списка в другую сторону');
    Turning;
    Writelist;
  
end.