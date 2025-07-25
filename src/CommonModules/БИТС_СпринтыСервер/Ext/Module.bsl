﻿
#Область ПрограммныйИнтерфейс

Функция Прочитать(Знач Спринт = "", Знач Группа = "", Знач ТолькоАктивные = Истина) Экспорт  
	
	Результат = Новый Соответствие;
	
	НаборЗаписей = РегистрыСведений.БИТС_Спринты.СоздатьНаборЗаписей();
	Если ЗначениеЗаполнено(Спринт) Тогда
		НаборЗаписей.Отбор["id"].Установить(Спринт);
	КонецЕсли;
	Если ЗначениеЗаполнено(Группа) Тогда
		НаборЗаписей.Отбор["groupId"].Установить(Группа);
	КонецЕсли;
	Если ТолькоАктивные Тогда
		НаборЗаписей.Отбор["status"].Установить("active");
	КонецЕсли;
	НаборЗаписей.Прочитать();
	Результат = НаборЗаписейВСоответствия(НаборЗаписей);
	
	Возврат Результат;
	
КонецФункции

Процедура Обновить(Знач URL, Знач ТолькоАктивные = Истина) Экспорт 
	
	Фильтр = Новый Структура;
	
	Если ТолькоАктивные Тогда
		Фильтр.Вставить("STATUS", "active");
	КонецЕсли;
	
	Ответ = OPI_Bitrix24.ПолучитьСписокСпринтов(URL, Фильтр);
	Если Ответ["result"] = Неопределено Тогда 
		Возврат;
	КонецЕсли;
	
	РегистрыСведений.БИТС_Спринты.СоздатьНаборЗаписей().Обновить(Ответ["result"]);
	
КонецПроцедуры

Функция Статусы() Экспорт

	Результат = Новый Соответствие;
	
	Результат.Вставить("active"   , "активный");
	Результат.Вставить("planned"  , "запланированный"); 
	Результат.Вставить("completed", "завершенный");
	
	Возврат Результат;
	
КонецФункции

#КонецОбласти    

#Область СлужебныеПроцедурыИФункции

Функция НаборЗаписейВСоответствия(Знач НаборЗаписей)

	Результат = Новый Соответствие;
	
	Для Каждого Запись Из НаборЗаписей Цикл
		Результат.Вставить(Запись["id"], Новый Соответствие);
		Результат[Запись["id"]].Вставить("groupId"  , Запись["groupId"]);
		Результат[Запись["id"]].Вставить("status"   , Запись["status"]);
		Результат[Запись["id"]].Вставить("name"     , Запись["name"]);
		Результат[Запись["id"]].Вставить("dateStart", Запись["dateStart"]);
		Результат[Запись["id"]].Вставить("dateEnd"  , Запись["dateEnd"]);
		Результат[Запись["id"]].Вставить("goal"     , Запись["goal"]);
	КонецЦикла;
	
	Возврат Результат;
	
КонецФункции 

#КонецОбласти
