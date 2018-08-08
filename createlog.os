#Использовать cmdline
#Использовать logos
#Использовать "."

Перем Лог;

Функция ПолучитьПарсерКоманднойСтроки()
    
    Парсер = Новый ПарсерАргументовКоманднойСтроки();
    
    МенеджерКомандПриложения.ЗарегистрироватьКоманды(Парсер);
    
    Возврат Парсер;
    
КонецФункции

Функция ПолезнаяРабота()
    ПараметрыЗапуска = РазобратьАргументыКоманднойСтроки();
    Если ПараметрыЗапуска = Неопределено или ПараметрыЗапуска.Количество() = 0 Тогда
        Лог.Ошибка("Некорректные аргументы командной строки");
        МенеджерКомандПриложения.ПоказатьСправкуПоКомандам();
        Возврат 1;
    КонецЕсли;
    
    Возврат МенеджерКомандПриложения.ВыполнитьКоманду(ПараметрыЗапуска.Команда, ПараметрыЗапуска.ЗначенияПараметров);
    
КонецФункции

Функция РазобратьАргументыКоманднойСтроки()
    Парсер = ПолучитьПарсерКоманднойСтроки();
    Возврат Парсер.Разобрать(АргументыКоманднойСтроки);
КонецФункции

/////////////////////////////////////////////////////////////////////////

Лог = Логирование.ПолучитьЛог("vanessa.app.deployka");
УровеньЛога = УровниЛога.Отладка;

Попытка
    ЗавершитьРаботу(ПолезнаяРабота());
Исключение
    Лог.КритичнаяОшибка(ОписаниеОшибки());
    ЗавершитьРаботу(МенеджерКомандПриложения.РезультатыКоманд().ОшибкаВремениВыполнения);
КонецПопытки;
