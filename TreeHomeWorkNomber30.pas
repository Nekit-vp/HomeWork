Program TreeMassiv;

Type 
    tree = ^NewTree;  
    NewTree = record
        info : integer;
        left, right : tree;
    end;
    
Var 
    root : tree;
    mas : array[1..100] of integer;
    i, n : integer;
    
Procedure recursion(node : tree; i : integer); // процедура образования дерева, которая вызывает саму себя (рекурсия)
Var                                            // на входи получает узел и порядковый номер элемента массива, который находится в этом узле
    NewLeft, NewRight : tree;
begin
    new(NewLeft);                              //левое звено узла создается всегда, так как процедура бы не вызвалась, если бы это было невозможно 
    NewLeft^.info := mas[2 * i];               //заполняется звено согласно условию  
    node^.left := NewLeft;                     //и приростает к корню процедуры
   
    if (n >= 2 * i + 1) then begin             // правое звено существует на всегда, поэтому проверяем, есть ли у нас еще неиспользованные элементы массива
        new(NewRight);                         // если элементы есть, то повторяем то же самое для првого звена(создание, заполнение, прививание)
        NewRight^.info := mas[2 * i + 1];
        node^.right := NewRight;
    end;
    
    if (2 * i <= n div 2) then                 // основная часть программы: если мы еще не обработали половину массива то создаем дальше узлы
        recursion(NewLeft, 2 * i);
    if (2 * i + 1 <= n div 2) then             // рекурсия в правое звено немного строже, так как заполнение идет слева направо
        recursion(NewRight, 2 * i + 1);
end;

Procedure WriteTree(root_tree : tree); // обычная рекурсивная процедура вывода дерева в виде ЛКП, для того, чтобы проверить составление дерева
begin
    if root_tree <> nil then
    begin
        WriteTree(root_tree^.left);
        Write(root_tree^.info, ' ');
        WriteTree(root_tree^.right);
    end;
end;

Begin
    write('Введите размер массива: '); 
    readln(n);
    write('Введите массив: ');
    for i := 1 to n do 
        read(mas[i]);
    new(root);               // создание корня
    root^.info := mas[1];   //заполнение корня дерева
    recursion(root, 1);  // вызов рекурсивной процедуры с конем дерева и первым индексом
    writeTree(root);    // вывод дерева для проверки
end.