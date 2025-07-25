﻿
#Область ПрограммныйИнтерфейс

Процедура Прочитать() Экспорт // регистр
	// TODO:
КонецПроцедуры

Процедура Обновить() Экспорт // битрикс 
	// TODO:
КонецПроцедуры

Функция ПолучитьДляЗадач(Знач URL, Знач ЗадачиСпринта, Знач Обновить = Ложь) Экспорт 
	
	Если Обновить Тогда
		Возврат ЗапросБитрикс(URL, ЗадачиСпринта);
	Иначе
		Возврат ЗапросИБ(ЗадачиСпринта);
	КонецЕсли;
	
КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция ЗапросБитрикс(URL, ЗадачиСпринта)
	
	Результат = Новый Соответствие;
	
	Для Каждого Задача Из ЗадачиСпринта Цикл
		
		Результат[Задача] = Новый Массив;
		
		Ответ = OPI_Bitrix24.ПолучитьСписокРезультатов(URL, Задача);
		Если Ответ["result"] = Неопределено Тогда 
			Продолжить;
		КонецЕсли;
		
		Для Каждого РезультатЗадачи Из Ответ["result"] Цикл
			СтруктураРезультата = Новый Структура("formattedText, files");
			СтруктураРезультата["formattedText"] = РезультатЗадачи["formattedText"];
			СтруктураРезультата["files"] = РезультатЗадачи["files"];
			Результат[Задача].Добавить(СтруктураРезультата);
		КонецЦикла;
		
	КонецЦикла;
	
	Возврат Результат;
	
КонецФункции

Функция ЗапросИБ(ЗадачиСпринта)
	
	Результат = Новый Соответствие;
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	БИТС_Результаты.id КАК id,
		|	БИТС_Результаты.taskId КАК taskId,
		|	БИТС_Результаты.commentId КАК commentId,
		|	БИТС_Результаты.formattedText КАК formattedText,
		|	БИТС_Результаты.text КАК text
		|ИЗ
		|	РегистрСведений.БИТС_Результаты КАК БИТС_Результаты
		|ГДЕ
		|	БИТС_Результаты.taskId В(&taskId)";
	Запрос.УстановитьПараметр("taskId", ЗадачиСпринта);
	
	Выборка = Запрос.Выполнить().Выбрать();
	Пока Выборка.Следующий() Цикл 
		Если Результат[Выборка["taskId"]] = Неопределено Тогда
			Результат[Выборка["taskId"]] = Новый Массив;
		КонецЕсли;                          
		СтруктураРезультата = Новый Соответствие;
		СтруктураРезультата["id"]				= Выборка["id"];
		СтруктураРезультата["commentId"]		= Выборка["commentId"];
		СтруктураРезультата["formattedText"]	= Выборка["formattedText"];
		СтруктураРезультата["text"]				= Выборка["text"]; 
		Результат[Выборка["taskId"]].Добавить(СтруктураРезультата); 
	КонецЦикла;
	
	Возврат Результат;
	
КонецФункции
                                                           
#КонецОбласти             