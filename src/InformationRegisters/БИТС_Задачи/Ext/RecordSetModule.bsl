
Процедура Обновить(Задачи) Экспорт
	
	ЭтотОбъект.Записать(Истина);
	ЭтотОбъект.Прочитать();
	
	Для Каждого Задача Из Задачи Цикл 
		
		НоваяЗапись = ЭтотОбъект.Добавить();
		НоваяЗапись["accomplices"]			= Задача["accomplices"];
		НоваяЗапись["accomplicesData"]		= Задача["accomplicesData"];
		НоваяЗапись["activityDate"]			= Задача["activityDate"];
		НоваяЗапись["addInReport"]			= Задача["addInReport"];
		НоваяЗапись["allowChangeDeadline"]	= Задача["allowChangeDeadline"];
		НоваяЗапись["allowTimeTracking"]	= Задача["allowTimeTracking"];
		НоваяЗапись["auditors"]				= Задача["auditors"];
		НоваяЗапись["auditorsData"]			= Задача["auditorsData"];
		НоваяЗапись["backlogId"]			= Задача["backlogId"];
		НоваяЗапись["changedBy"]			= Задача["changedBy"];
		НоваяЗапись["changedDate"]			= Задача["changedDate"];
		НоваяЗапись["closedBy"]				= Задача["closedBy"];
		НоваяЗапись["closedDate"]			= Задача["closedDate"];
		НоваяЗапись["commentsCount"]		= Задача["commentsCount"];
		НоваяЗапись["createdBy"]			= Задача["createdBy"];
		НоваяЗапись["createdDate"]			= Задача["createdDate"];
		НоваяЗапись["dateStart"]			= Задача["dateStart"];
		НоваяЗапись["deadline"]				= Задача["deadline"];
		НоваяЗапись["description"]			= Задача["description"];
		НоваяЗапись["descriptionInBbcode"]	= Задача["descriptionInBbcode"];
		НоваяЗапись["durationFact"]			= Задача["durationFact"];
		НоваяЗапись["durationPlan"]			= Задача["durationPlan"];
		НоваяЗапись["durationType"]			= Задача["durationType"];
		НоваяЗапись["endDatePlan"]			= Задача["endDatePlan"];
		НоваяЗапись["exchangeId"]			= Задача["exchangeId"];
		НоваяЗапись["exchangeModified"]		= Задача["exchangeModified"];
		НоваяЗапись["favorite"]				= Задача["favorite"];
		НоваяЗапись["flowId"]				= Задача["flowId"];
		НоваяЗапись["forkedByTemplateId"]	= Задача["forkedByTemplateId"];
		НоваяЗапись["forumId"]				= Задача["forumId"];
		НоваяЗапись["forumTopicId"]			= Задача["forumTopicId"];
		НоваяЗапись["group"]				= Задача["group"];
		НоваяЗапись["groupId"]				= Задача["groupId"];
		НоваяЗапись["guid"]					= Задача["guid"];
		НоваяЗапись["id"]					= Задача["id"];
		НоваяЗапись["isMuted"]				= Задача["isMuted"];
		НоваяЗапись["isPinned"]				= Задача["isPinned"];
		НоваяЗапись["isPinnedInGroup"]		= Задача["isPinnedInGroup"];
		НоваяЗапись["mark"]					= Задача["mark"];
		НоваяЗапись["matchWorkTime"]		= Задача["matchWorkTime"];
		НоваяЗапись["multitask"]			= Задача["multitask"];
		НоваяЗапись["newCommentsCount"]		= Задача["newCommentsCount"];
		НоваяЗапись["notViewed"]			= Задача["notViewed"];
		НоваяЗапись["outlookVersion"]		= Задача["outlookVersion"];
		НоваяЗапись["parentId"]				= Задача["parentId"];
		НоваяЗапись["priority"]				= Задача["priority"];
		НоваяЗапись["replicate"]			= Задача["replicate"];
		НоваяЗапись["responsible"]			= Задача["responsible"];
		НоваяЗапись["responsibleId"]		= Задача["responsibleId"];
		НоваяЗапись["serviceCommentsCount"]	= Задача["serviceCommentsCount"];
		НоваяЗапись["siteId"]				= Задача["siteId"];
		НоваяЗапись["sorting"]				= Задача["sorting"];
		НоваяЗапись["sprintId"]				= Задача["sprintId"];
		НоваяЗапись["stageId"]				= Задача["stageId"];
		НоваяЗапись["startDatePlan"]		= Задача["startDatePlan"];
		НоваяЗапись["status"]				= Задача["status"];
		НоваяЗапись["statusChangedBy"]		= Задача["statusChangedBy"];
		НоваяЗапись["statusChangedDate"]	= Задача["statusChangedDate"];
		НоваяЗапись["subStatus"]			= Задача["subStatus"];
		НоваяЗапись["subordinate"]			= Задача["subordinate"];
		НоваяЗапись["taskControl"]			= Задача["taskControl"];
		НоваяЗапись["timeEstimate"]			= Задача["timeEstimate"];
		НоваяЗапись["timeSpentInLogs"]		= Задача["timeSpentInLogs"];
		НоваяЗапись["title"]				= Задача["title"];
		НоваяЗапись["viewedDate"]			= Задача["viewedDate"];
		НоваяЗапись["xmlId"]				= Задача["xmlId"]; 
		
	КонецЦикла;
	
	ЭтотОбъект.Записать(Истина);
	
КонецПроцедуры