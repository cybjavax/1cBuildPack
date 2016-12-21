#Использовать cmdline

Парсер = Новый ПарсерАргументовКоманднойСтроки();
Парсер.ДобавитьПараметр("repo");
Парсер.ДобавитьПараметр("devonly");

Параметры = Парсер.Разобрать(АргументыКоманднойСтроки);

Если ЗначениеЗаполнено(Параметры["repo"]) Тогда
	Репо = Параметры["repo"];
Иначе
	Репо = "";
КонецЕсли;

Если ЗначениеЗаполнено(Параметры["devonly"]) Тогда
	ТолькоРепо = Параметры["devonly"];
Иначе
	ТолькоРепо = "";
КонецЕсли;

_текущийКаталог = ТекущийКаталог();

//Загружаем все необходимое с github
Если ЗначениеЗаполнено(Репо) Тогда
    ЗапуститьПриложение("git clone "+Репо+" ./develop");
Иначе
    ЗапуститьПриложение("git clone https://github.com/cybjavax/vanessa-bootstrap-1cBuildPackTemplate.git ./develop");
КонецЕсли;

Если ЗначениеЗаполнено(ТолькоРепо) Тогда
Иначе
    ЗапуститьПриложение("git clone https://github.com/EvilBeaver/oscript-library.git ./tools/onescript -b develop", ,Истина);
    УстановитьТекущийКаталог(_текущийКаталог+"/tools/onescript");
    ЗапуститьПриложение("git submodule update --init --recursive");
    УстановитьТекущийКаталог(_текущийКаталог);

    ЗапуститьПриложение("git clone https://github.com/silverbulleters/vanessa-bdd-editor.git ./tools/bdd-editor -b develop");
    ЗапуститьПриложение("git clone https://github.com/silverbulleters/vanessa-behavior.git ./tools/behavior -b develop", ,Истина); //дольше всех грузится
КонецЕсли;