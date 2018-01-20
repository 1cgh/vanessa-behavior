﻿# language: ru

@IgnoreOn82Builds
@IgnoreOnOFBuilds
@IgnoreOn837
@IgnoreOn839

#из-за ошибки web клиента в 8.3.10
@IgnoreOnWeb8310

@tree


Функционал: Автоматизированное получение изменения состояния формы

Как Разработчик я хочу
Чтобы у меня был функционал для получения шагов Gherkin при изменении формы
Для того чтобы я мог использовать их в своих сценариях без программирования



Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	Когда я удаляю все элементы Справочника "Справочник1"
	Когда я создаю fixtures по макету "Макет"
	
	
	
Сценарий: Я получаю изменения формы в виде сценария Gherkin
	
#Область Создание элементов шапки	

	Когда Я нажимаю кнопку командного интерфейса "Основная"
	И     В панели функций я выбираю "Справочник1"
	Тогда открылось окно "Справочник1"
	Тогда открылось окно "Спр" "авочник1"
	Тогда открылось окно "Спр" "а" "в" "о" "ч" "н" "ик1"
	Тогда открылось окно "Спр" + "а" + "в" + "о" + "ч" + "н" + "ик1"
	
	Затем Я запоминаю значение выражения "1" в переменную "ПроверкаОкна"
	Если появилось окно с заголовком "Справочник1" в течение 10 секунд Тогда
			Затем Я запоминаю значение выражения "2" в переменную "ПроверкаОкна"
	Тогда переменная "ПроверкаОкна" имеет значение 2		
			
	
	И     В форме "Справочник1" в таблице "Список" я перехожу к строке:
		| Код       | Наименование       |
		| "000000002" | Тестовый Элемент 2 |
	И     В форме "Справочник1" в ТЧ "Список" я выбираю текущую строку
	И     открылось окно "Тестовый Элемент * (Справочник1)"
#	И     В открытой форме я открываю выпадающий список с заголовком "Реквизит1"

	Тогда открылась форма "Тестовый Элемент 2 (Справочник1)"
	Тогда открылась форма с именем "Справочник.Справочник1.Форма.ФормаЭлемента"
	

	И     в поле "Реквизит число" я увеличиваю значение
	И     в поле "Реквизит число" я уменьшаю значение
	И     в таблице "ТабличнаяЧасть1" я нажимаю на кнопку 'Добавить'
	И     в таблице "ТабличнаяЧасть1" я завершаю редактирование строки
	И     в таблице "ТабличнаяЧасть1" я выбираю текущую строку
	И     в таблице "ТабличнаяЧасть1" в поле "Реквизит число" я увеличиваю значение
	И     в таблице "ТабличнаяЧасть1" в поле "Реквизит число" я уменьшаю значение
	И     в таблице "ТабличнаяЧасть1" я завершаю редактирование строки
	
	И элемент формы с именем "РеквизитЧисло" стал равен "0,00"
	И     таблица "ТабличнаяЧасть1" стала равной:
		| 'Реквизит число' |
		| ''               |
	
	И     в таблице "ТабличнаяЧасть1" я удаляю текущую строку
	
	
	Затем Я запоминаю значение выражения "1" в переменную "ПроверкаУсловияНаЗначенияПоля"
	Если поле с именем "Наименование" стало равно "Тестовый Элемент 2" в течение 10 секунд Тогда
			Затем Я запоминаю значение выражения "2" в переменную "ПроверкаУсловияНаЗначенияПоля"
			
	Тогда переменная "ПроверкаУсловияНаЗначенияПоля" имеет значение 2
	
	
	#Проверка работы с многострочным реквизитом
	И     в поле "Реквизит многострочная строка" я ввожу текст
		|'111'|
		|'222'|
	И     элемент формы с именем "РеквизитМногострочнаяСтрока" стал равен
		|'111'|
		|'222'|

	И     элемент формы с именем "РеквизитМногострочнаяСтрока" стал равен шаблону
		|'1*1'|
		|'2*2'|

	И     элемент формы с именем "РеквизитМногострочнаяСтрока" стал равен шаблону 
		|'1*1'|
		|'222'|

	И     элемент формы с именем "Код" стал равен шаблону  "0*0*"
		
	#Проверка работы с полем стандартного периода
	И     я нажимаю кнопку выбора у поля "Реквизит стандартный период"
	Тогда открылось окно "Выберите период"
	И     в поле "DateBegin" я ввожу текст "08.04.1981"
	И     в поле "DateEnd" я ввожу текст "11.09.1983"
	И     я нажимаю на кнопку "Выбрать"
	И элемент формы "Реквизит стандартный период" стал равен "08.04.1981 - 11.09.1983"
	
	Затем Я запоминаю значение выражения "1" в переменную "ПроверкаДоступности"
	Если элемент "Наименование" доступен для редактирования Тогда
		Тогда Я запоминаю значение выражения "2" в переменную "ПроверкаДоступности"
	Тогда переменная "ПроверкаДоступности" имеет значение 2

		
	И     В открытой форме из выпадающего списка с именем "Реквизит1" я выбираю "ЗначениеПеречисления1"
	И     из выпадающего списка с именем "Реквизит1" я выбираю точное значение "ЗначениеПеречисления2"
	И     элемент формы с именем "Реквизит1" стал равен "ЗначениеПеречисления2"
	И     из выпадающего списка с именем "Реквизит1" я выбираю точное значение "ЗначениеПеречисления1"
	И     элемент формы с именем "Реквизит1" стал равен "ЗначениеПеречисления1"
	И     В открытой форме я выбираю значение реквизита с заголовком "Реквизит2" из формы списка
	Тогда открылось окно "Справочник2"
	И     В форме "Справочник2" в таблице "Список" я перехожу к строке:
		| Наименование      |
		| ТестовыйЭлемент21 |
	И     В форме "Справочник2" в ТЧ "Список" я выбираю текущую строку
	Тогда открылось окно "Тестовый Элемент * (Справочник1) *"
	И     В открытой форме в поле с именем "РеквизитЧисло" я ввожу текст "12,34"
	И     В открытой форме в поле с именем "РеквизитСтрока" я ввожу текст "тест"
	И     я запоминаю значение поля с именем "РеквизитЧисло" как "ЗначениеРеквизитЧисло"
	Тогда переменная "ЗначениеРеквизитЧисло" имеет значение "12,34"
	И     поле с именем "РеквизитЧисло" равно переменной "ЗначениеРеквизитЧисло"
	И     В открытой форме в поле с именем "РеквизитСтрока" я ввожу текст ""
	И     элемент формы с именем "РеквизитСтрока" стал равен ""
	И     В открытой форме в поле с именем "РеквизитСтрока" я ввожу текст "тест"
	
	И в поле с именем "РеквизитДата" я ввожу текущую дату
	И в поле "Рек строка1" я ввожу текущую дату и текущее время
	
	И     В открытой форме в поле с именем "РеквизитДата" я ввожу текст "08.04.1981"
	Если поле с именем "РеквизитСтрока" имеет значение "тест" тогда
		И     В открытой форме я устанавливаю флаг с заголовком "Реквизит булево"
	И     элемент формы с именем "РеквизитБулево" стал равен "Да"	
	И     В открытой форме я меняю значение переключателя с заголовком "Реквизит переключатель" на "Первое значение"
	И     поле с именем "РеквизитСтрока" присутствует на форме
	
#КонецОбласти

	Затем Я запоминаю значение выражения "1" в переменную "ПроверкаОтсутствияСтроки"
	Если в таблице "ТабличнаяЧасть1" нет строки Тогда
			| 'Реквизит строка'        |
			| 'Какое-то значение'      |
		Затем Я запоминаю значение выражения "2" в переменную "ПроверкаОтсутствияСтроки"
		
	Тогда переменная "ПроверкаОтсутствияСтроки" имеет значение 2

#Область Создание элементов ТЧ	
	
	И     В открытой форме в ТЧ "ТабличнаяЧасть1" я нажимаю на кнопку с заголовком "Добавить"
	И     В открытой форме в ТЧ "ТабличнаяЧасть1" в поле с заголовком "Реквизит число" я ввожу текст "56,78"
	И     в таблице "ТабличнаяЧасть1" я активизирую поле "Реквизит строка"
	И     в таблице "ТабличнаяЧасть1" я активизирую поле "Реквизит число"
	И     я запоминаю значение таблицы "ТабличнаяЧасть1" поля "Реквизит число" как "ЗначениеРеквизитЧислоТаблица"
	Тогда переменная "ЗначениеРеквизитЧислоТаблица" имеет значение "56,78"
	И     я вывожу значение переменной "ЗначениеРеквизитЧислоТаблица"
	И     В открытой форме в ТЧ "ТабличнаяЧасть1" в поле с заголовком "Реквизит строка" я ввожу текст "ТестСтрока"
	И     в таблице "ТабличнаяЧасть1" в поле "Реквизит дата" я ввожу текущую дату
	И     В открытой форме в ТЧ "ТабличнаяЧасть1" в поле с заголовком "Реквизит дата" я ввожу текст "11.09.1983"
	И     в таблице "ТабличнаяЧасть1" я активизирую поле "Реквизит число"
	И     поле таблицы "ТабличнаяЧасть1" "Реквизит число" равно переменной "ЗначениеРеквизитЧислоТаблица"
	И     В открытой форме в ТЧ "ТабличнаяЧасть1" из выпадающего списка с заголовком "Реквизит справочник" я выбираю "ТестовыйЭлемент21"
	И     В открытой форме в ТЧ "ТабличнаяЧасть1" я изменяю флаг с заголовком "Реквизит булево"
	И     в таблице "ТабличнаяЧасть1" я завершаю редактирование строки
	И     В открытой форме в ТЧ "ТабличнаяЧасть1" из выпадающего списка с заголовком "Реквизит справочник" я выбираю "ТестовыйЭлемент21"
	
	
	
	И     в таблице "ТабличнаяЧасть1" поле "ТабличнаяЧасть1РеквизитСтрока" имеет значение "ТестСтрока"
	
	
	И     В открытой форме в ТЧ "ТабличнаяЧасть1" я выбираю значение реквизита с заголовком "Реквизит справочник выбор из формы списка" из формы списка
	Тогда открылось окно "Справочник2"
	И     В форме "Справочник2" в таблице "Список" я перехожу к строке:
		| Наименование      |
		| ТестовыйЭлемент21 |
	И     В форме "Справочник2" в ТЧ "Список" я выбираю текущую строку
	
#КонецОбласти	
	
	И     В открытой форме я нажимаю на кнопку с заголовком "Записать"
	
	И я запоминаю количество строк таблицы "ТабличнаяЧасть1" как "КолСтрокТЧ1"
	И количество строк таблицы "ТабличнаяЧасть1" равно переменной "КолСтрокТЧ1"

#Область Проверка значений элементов формы
	Тогда элемент формы с именем "Код" стал равен "000000002"
	И     элемент формы с именем "Наименование" стал равен "Тестовый Элемент 2"
	И     значение поля с именем "Наименование" содержит текст "Тестовый"
	И     Проверяю шаги на Исключение:
		|'И     значение поля с именем "Наименование" содержит текст "Тестовый111"'|	
	
	И     элемент формы с именем "Реквизит1" стал равен "ЗначениеПеречисления1"
	И     элемент формы с именем "Реквизит2" стал равен "ТестовыйЭлемент21"
	И     элемент формы с именем "РеквизитЧисло" стал равен "12,34"
	И     элемент формы с именем "РеквизитСтрока" стал равен "тест"
	И     элемент формы с именем "РеквизитДата" стал равен "08.04.1981"
	И     элемент формы с именем "РеквизитБулево" стал равен "Да"
	И     элемент формы с именем "РеквизитПереключатель" стал равен "1"
	И     таблица формы с именем "ТабличнаяЧасть1" стала равной:
		| 'N' | 'Реквизит число' | 'Реквизит число' | 'Реквизит строка' | 'Реквизит дата' | 'Реквизит справочник выбор из формы списка' | 'Реквизит справочник' | 'Реквизит булево' |
		| '1' | '56,78'          |  '56,78'         | 'ТестСтрока'      | '11.09.1983'    | 'ТестовыйЭлемент21'                         | 'ТестовыйЭлемент21'   | 'Да'              |

	И     таблица "ТабличнаяЧасть1" стала равной по шаблону:
		| 'N' | 'Реквизит число' | 'Реквизит число' | 'Реквизит строка' | 'Реквизит дата' | 'Реквизит справочник выбор из формы списка' | 'Реквизит справочник' | 'Реквизит булево' |
		| '1' | '*,78'           |  '56,*'          | 'Т*тСт*ка'        | '11.*.1983'     | 'Тестов*Элемент21'                          | '*естовыйЭлемент2*'   | '*'               |

		
	И     таблица формы с именем "ТабличнаяЧасть1" содержит строки:
		| 'N' | 'Реквизит число' | 'Реквизит строка' | 'Реквизит дата' | 'Реквизит справочник выбор из формы списка' | 'Реквизит справочник' | 'Реквизит булево' |
		| '1' | '56,78'          | 'ТестСтрока'      | '11.09.1983'    | 'ТестовыйЭлемент21'                         | 'ТестовыйЭлемент21'   | 'Да'              |	

	И     таблица "ТабличнаяЧасть1" не содержит строки:
		| 'N' |
		| '2' |
		| '3' |
		
		
	И     таблица формы с именем "ТабличнаяЧасть1" содержит строки:
		| 'N' | 'Реквизит число' | 'Реквизит строка' | 'Реквизит дата' | 'Реквизит справочник выбор из формы списка' | 'Реквизит справочник' | 'Реквизит булево' |
		| '1' | '56,7*'          | '*'               | '11.09.1983'    | 'ТестовыйЭлемент*'                         | 'ТестовыйЭлемент21'   | 'Да'              |			
# Реквизит число специально указан два раза
		
		
	Тогда таблица формы с именем "ТабличнаяЧасть1" содержит изменения:
		| 'Реквизит число' |
		| '56,78'          |


		
		
	И     элемент формы с именем "Код1" стал равен "000000002"
	И     элемент формы с именем "Наименование2" стал равен "Тестовый Элемент 2"
	И     элемент формы с именем "Наименование1" стал равен "Тестовый Элемент 2"
	И     элемент формы с именем "Реквизит3" стал равен "ЗначениеПеречисления1"	

#КонецОбласти	
	И     Я нажмаю на кнопку Vanessa-Behavior "Забыть состояние формы TestClient"
	И     Я нажмаю на кнопку Vanessa-Behavior "ПолучитьИзмененияФормыGherkin"
	И     Пауза 2
	И     В открытой форме я нажимаю на кнопку с заголовком "Записать и закрыть"

	
#Область Проверка созданного кода Gherkin по изменениям элементов формы
	
	Тогда В реквизите Vanessa-Behavior "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "Код" стал равен \'000000002\''
	Тогда В реквизите Vanessa-Behavior "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "Наименование" стал равен \'Тестовый Элемент 2\''
	Тогда В реквизите Vanessa-Behavior "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "Реквизит1" стал равен \'ЗначениеПеречисления1\''
	Тогда В реквизите Vanessa-Behavior "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "Реквизит2" стал равен \'ТестовыйЭлемент21\''
	Тогда В реквизите Vanessa-Behavior "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "РеквизитЧисло" стал равен \'12,34\''
	Тогда В реквизите Vanessa-Behavior "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "РеквизитСтрока" стал равен \'тест\''
	Тогда В реквизите Vanessa-Behavior "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "РеквизитДата" стал равен \'08.04.1981 0:00:00\''
	Тогда В реквизите Vanessa-Behavior "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "РеквизитБулево" стал равен \'Да''
	Тогда В реквизите Vanessa-Behavior "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "РеквизитПереключатель" стал равен \'1\''
	Тогда В реквизите Vanessa-Behavior "СгенерированныйСценарий" будет содержаться строка 'таблица "ТабличнаяЧасть1" стала равной:'
#	Тогда В реквизите Vanessa-Behavior "СгенерированныйСценарий" будет содержаться строка '| 'N' | 'Реквизит число' | 'Реквизит строка' | 'Реквизит дата' | 'Реквизит справочник выбор из формы списка' | 'Реквизит справочник' | 'Реквизит булево' |'
#	Тогда В реквизите Vanessa-Behavior "СгенерированныйСценарий" будет содержаться строка '| '1' | '56,78'          | 'ТестСтрока'      | '11.09.1983'    | 'ТестовыйЭлемент21'                         | 'ТестовыйЭлемент21'   | 'Да'              |'
	Тогда В реквизите Vanessa-Behavior "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "Код1" стал равен \'000000002\''
	Тогда В реквизите Vanessa-Behavior "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "Наименование2" стал равен \'Тестовый Элемент 2\''
	Тогда В реквизите Vanessa-Behavior "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "Наименование1" стал равен \'Тестовый Элемент 2\''
	Тогда В реквизите Vanessa-Behavior "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "Реквизит3" стал равен \'ЗначениеПеречисления1\''

#КонецОбласти		
	
	
	Тогда в таблице "Список" текущая строка равна:
		| 'Реквизит1'             | 'Наименование'       |
		| 'ЗначениеПеречисления1' | 'Тестовый Элемент 2' |
	