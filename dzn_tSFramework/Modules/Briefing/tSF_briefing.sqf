//     tSF Briefing
// Do not modify this part
#define BRIEFING		_briefing = [];
#define TOPIC(NAME) 	_briefing pushBack ["Diary", [ NAME,
#define END			]];
#define ADD_TOPICS	for "_i" from (count _briefing) to 0 step -1 do {player createDiaryRecord (_briefing select _i);};
//
//
// Briefing goes here

BRIEFING

TOPIC("Отряды")
"Отряды будут сформированы автоматически после запуска миссии. Ваша роль в отряде будет выбранна случайною
<br /><br />Используйте следующую структуру управления, в зависимости от количества людей:
<br />- 1 команда:    под управлением   <font color='#961c1c'>RED Лидер команды</font>
<br />- до 2 команд:  под управлением   <font color='#961c1c'>RED Лидер команды</font>
<br />- до 3 команд:  под управлением   <font color='#f7c100'>1'1 Командира отедления</font>
<br />- 3+ команды:   под управлением   <font color='#f7c100'>1'6 Командира взвода</font>
<br /><br />Посмотреть текущий ORBAT можно сочетанием клавиш <font color='#2f70e0'>[Ctrl + O]</font> или кликнув <font color='#B0E84F'><execute expression='call dzn_fnc_roles_showORBAT'>ORBAT</execute></font>"
END

TOPIC("Задание")
"Вашей задачей будет завхат и удержание зоны, которая будет выбрана после старта миссии.
<br /><br />Время на выполнение задания ограничено. Посмотреть оставшееся время можно сочетанием клавиш <font color='#2f70e0'>[Alt + O]</font> или кликнув <font color='#B0E84F'><execute expression='[] spawn dzn_fnc_notif_showTimeNotification'>ВРЕМЯ</execute></font>"
END

ADD_TOPICS
