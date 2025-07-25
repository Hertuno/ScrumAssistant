
#Область ПрограммныйИнтерфейс

Процедура Прочитать() Экспорт // регистр
	// TODO:
КонецПроцедуры

Процедура Обновить() Экспорт // битрикс 
	// TODO:
КонецПроцедуры

Функция Получить(Знач URL, Знач GROUP_ID, Знач SPRINT_ID, Знач Обновить = Ложь) Экспорт 
	
	Результат = Новый Массив;
	
	Отступ = 0;
	Всего = 100;
	Фильтр = Новый Структура;
	Фильтр.Вставить("GROUP_ID", GROUP_ID);
	Фильтр.Вставить("SPRINT_ID", SPRINT_ID);
	Поля = "";
	
	Если Обновить Тогда
		
		Пока Отступ < Всего Цикл
			
			Ответ = OPI_Bitrix24.ПолучитьСписокЗадач(URL, Фильтр, Отступ,, Поля);
			Если Ответ["result"] = Неопределено Тогда 
				Возврат Результат;
			КонецЕсли;
			
			Для Каждого Задача Из Ответ["result"]["tasks"] Цикл
				Результат.Добавить(Задача);
			КонецЦикла;
			Отступ = ?(Ответ["next"] = Неопределено, Число(Ответ["total"]), Число(Ответ["next"]));
			Всего = Число(Ответ["total"]);
			
			РегистрыСведений.БИТС_Задачи.СоздатьНаборЗаписей().Обновить(Результат);
			
		КонецЦикла;
		
	Иначе
		
		Запрос = Новый Запрос;
		Запрос.Текст = 
			"ВЫБРАТЬ
			|	Задачи.groupId КАК groupId,
			|	Задачи.sprintId КАК sprintId,
			|	Задачи.id КАК id,
			|	Задачи.stageId КАК stageId,
			|	Задачи.durationPlan КАК durationPlan,
			|	Задачи.timeEstimate КАК timeEstimate,
			|	Задачи.timeSpentInLogs КАК timeSpentInLogs,
			|	Задачи.title КАК title,
			|	Задачи.description КАК description,
			|	Задачи.parentId КАК parentId,
			|	Задачи.responsibleId КАК responsibleId,
			|	Задачи.auditorsData КАК auditorsData,
			|	Задачи.creator КАК creator,
			|	Задачи.newCommentsCount КАК newCommentsCount,
			|	Задачи.favorite КАК favorite,
			|	Задачи.exchangeId КАК exchangeId,
			|	Задачи.status КАК status,
			|	Задачи.dateStart КАК dateStart,
			|	Задачи.flowId КАК flowId,
			|	Задачи.durationFact КАК durationFact,
			|	Задачи.sorting КАК sorting,
			|	Задачи.notViewed КАК notViewed,
			|	Задачи.startDatePlan КАК startDatePlan,
			|	Задачи.outlookVersion КАК outlookVersion,
			|	Задачи.statusChangedDate КАК statusChangedDate,
			|	Задачи.exchangeModified КАК exchangeModified,
			|	Задачи.subordinate КАК subordinate,
			|	Задачи.siteId КАК siteId,
			|	Задачи.forumTopicId КАК forumTopicId,
			|	Задачи.group КАК group,
			|	Задачи.durationType КАК durationType,
			|	Задачи.allowTimeTracking КАК allowTimeTracking,
			|	Задачи.allowChangeDeadline КАК allowChangeDeadline,
			|	Задачи.isMuted КАК isMuted,
			|	Задачи.multitask КАК multitask,
			|	Задачи.serviceCommentsCount КАК serviceCommentsCount,
			|	Задачи.auditors КАК auditors,
			|	Задачи.forkedByTemplateId КАК forkedByTemplateId,
			|	Задачи.accomplices КАК accomplices,
			|	Задачи.guid КАК guid,
			|	Задачи.xmlId КАК xmlId,
			|	Задачи.closedBy КАК closedBy,
			|	Задачи.isPinnedInGroup КАК isPinnedInGroup,
			|	Задачи.closedDate КАК closedDate,
			|	Задачи.addInReport КАК addInReport,
			|	Задачи.commentsCount КАК commentsCount,
			|	Задачи.backlogId КАК backlogId,
			|	Задачи.statusChangedBy КАК statusChangedBy,
			|	Задачи.accomplicesData КАК accomplicesData,
			|	Задачи.changedDate КАК changedDate,
			|	Задачи.subStatus КАК subStatus,
			|	Задачи.changedBy КАК changedBy,
			|	Задачи.isPinned КАК isPinned,
			|	Задачи.createdDate КАК createdDate,
			|	Задачи.endDatePlan КАК endDatePlan,
			|	Задачи.responsible КАК responsible,
			|	Задачи.forumId КАК forumId,
			|	Задачи.deadline КАК deadline,
			|	Задачи.activityDate КАК activityDate,
			|	Задачи.viewedDate КАК viewedDate,
			|	Задачи.createdBy КАК createdBy,
			|	Задачи.taskControl КАК taskControl,
			|	Задачи.replicate КАК replicate,
			|	Задачи.descriptionInBbcode КАК descriptionInBbcode,
			|	Задачи.matchWorkTime КАК matchWorkTime,
			|	Задачи.priority КАК priority,
			|	Задачи.mark КАК mark
			|ИЗ
			|	РегистрСведений.БИТС_Задачи КАК Задачи";
		
		Выгрузка = Запрос.Выполнить().Выгрузить();
		
		Результат = БИТС_СлужебныйСервер.ТаблицаВМассивСоответствий(Выгрузка);
		
	КонецЕсли;
	
	Возврат Результат;
	
КонецФункции

Функция ВремяЗаСпринт(Знач URL, Знач Задачи, Знач ДатаНачала, Знач ДатаОкончания) Экспорт
	
	Результат = Новый Соответствие;
	
	Для Каждого Задача Из Задачи Цикл
		
		Результат[Задача] = Новый Структура("Всего, ЗаСпринт", 0, 0);
		
		Ответ = OPI_Bitrix24.ПолучитьСписокТрудозатратЗадачи(URL, Задача);
		Если Ответ["result"] = Неопределено Тогда 
			Продолжить;
		КонецЕсли;
		
		Для Каждого Затрата Из Ответ["result"] Цикл
			Часы = БИТС_СлужебныйСервер.СекундыВЧасы(Затрата["SECONDS"]);
			ДатаЗатраты = БИТС_СлужебныйСервер.ДатаИзСтроки(Затрата["DATE_START"]);
			Результат[Задача]["Всего"] = Результат[Задача]["Всего"] + Часы;
			Если ЗатратаВЭтотСпринт(ДатаНачала, ДатаОкончания, ДатаЗатраты) Тогда
				Результат[Задача]["ЗаСпринт"] = Результат[Задача]["ЗаСпринт"] + Часы;
			КонецЕсли;
		КонецЦикла;
		
	КонецЦикла;
	
	Возврат Результат;
	
КонецФункции

#КонецОбласти 

#Область СлужебныеПроцедурыИФункции

Функция ЗатратаВЭтотСпринт(Знач ДатаНачала, Знач ДатаОкончания, Знач ДатаЗатраты)
	Возврат ДатаЗатраты >= ДатаНачала И ДатаЗатраты <= ДатаОкончания;
КонецФункции

#КонецОбласти