﻿
#Область ПрограмныйИнтерфейс

Функция ТаблицаВМассивСоответствий(Знач Таблица) Экспорт
	
	Результат = Новый Массив;
	
	Для Каждого Строка Из Таблица Цикл
		СоответствиеСтроки = Новый Соответствие;
		Для Каждого Колонка Из Таблица.Колонки Цикл
			СоответствиеСтроки[Колонка.Имя] = Строка[Колонка.Имя];
		КонецЦикла;
		Результат.Добавить(СоответствиеСтроки);
	КонецЦикла;
	
	Возврат Результат;
	
КонецФункции

Функция ПредставлениеСпринта(Знач Спринт) Экспорт
	
	Результат = "";
	
	ДатаНачала = ""; // ПредставлениеДаты(Спринт["SPRINT_START"]);
	ДатаОкончания = ""; // ПредставлениеДаты(Спринт["SPRINT_END"]);
	Результат = СтрШаблон("%1 с %2 по %3", Спринт, ДатаНачала, ДатаОкончания);
	
	Возврат Результат;
	
КонецФункции 

Функция ПредставлениеДаты(Знач Строка) Экспорт 
	Возврат СтрРазделить(Строка, "T")[0];
КонецФункции

Функция ДатаИзСтроки(Знач Строка) Экспорт
	Возврат Дата(СтрЗаменить(СтрРазделить(Строка, "T")[0], "-", ""))
КонецФункции

Функция CamelCase(Знач Строка) Экспорт
	
	Результат = "";
	
	Строка = СтрЗаменить(Строка, ")", "");
	Строка = СтрЗаменить(Строка, "(", "");
	МассивСлов = СтрРазделить(Строка, " ");
	МассивСловСБольшойБуквы = Новый Массив;
	Для Каждого Слово Из МассивСлов Цикл
		МассивСловСБольшойБуквы.Добавить(ТРег(СокрЛП(Слово)));
	КонецЦикла;
	Результат = СтрСоединить(МассивСловСБольшойБуквы, "");
	
	Возврат Результат;
	
КонецФункции

Функция СекундыВЧасы(Знач Секунды) Экспорт
	Возврат Число(Секунды) / Число("3600");
КонецФункции

Функция ОтсортированныеКлючи(Знач НеотсортированноеСоответствие) Экспорт
	
	Результат = Новый Массив;
	
	Сортировщик = Новый СписокЗначений;
	Для Каждого Элемент Из НеотсортированноеСоответствие Цикл
		Сортировщик.Добавить(Элемент.Ключ);
	КонецЦикла;
	Сортировщик.СортироватьПоЗначению();
	
	Результат = Сортировщик.ВыгрузитьЗначения();
	
	Возврат Результат;
	
КонецФункции

#КонецОбласти