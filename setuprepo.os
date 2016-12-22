#Использовать cmdline

Парсер = Новый ПарсерАргументовКоманднойСтроки();
Парсер.ДобавитьПараметр("repo");

Параметры = Парсер.Разобрать(АргументыКоманднойСтроки);

Если ЗначениеЗаполнено(Параметры["repo"]) Тогда
	Репо = Параметры["repo"];
Иначе
	Репо = "";
КонецЕсли;

_текущийКаталог = ТекущийКаталог();

//Загружаем все необходимое с github
Если ЗначениеЗаполнено(Репо) Тогда
    ЗапуститьПриложение("git clone "+Репо+" ./develop");
Иначе
    ЗапуститьПриложение("git clone https://github.com/cybjavax/vanessa-bootstrap-1cBuildPackTemplate.git ./develop");
КонецЕсли;