#Использовать v8runner

Функция ОбернутьВКавычки(Знач Строка);
	Если Лев(Строка, 1) = """" и Прав(Строка, 1) = """" Тогда
		Возврат Строка;
	Иначе
		Возврат """" + Строка + """";
	КонецЕсли;
КонецФункции

_текущийКаталог = ТекущийКаталог()+"/testclone";
_текущийКаталогДев = ТекущийКаталог()+"/develop";
_каталогБазыРазработки = _текущийКаталог+"/1cbases/develop";
_ванессаБихавиорОбработка = ТекущийКаталог()+"/tools/behavior/vanessa-behavior.epf";

//УстановитьТекущийКаталог(_текущийКаталог);

УдалитьФайлы("./develop/allurereport","*.xml");
УдалитьФайлы("./develop/allurereport/allure-report");

Конфигуратор = Новый УправлениеКонфигуратором();
Конфигуратор.УстановитьКонтекст("/F"+_каталогБазыРазработки, "admin", "");
Конфигуратор.ЗапуститьВРежимеПредприятия(,Истина,СтрШаблон(" /Execute "+_ванессаБихавиорОбработка+" /C %1", ОбернутьВКавычки("StartFeaturePlayer;VBParams="+_текущийКаталогДев+"\autotestclone.json")));

ЗапуститьПриложение("allure generate ./develop/allurereport -o ./develop/allurereport/allure-report", ,Истина);
ЗапуститьПриложение("allure report open -o ./develop/allurereport/allure-report", ,Истина);