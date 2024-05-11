// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  static String m0(appVersion) => "Версия приложения: ${appVersion}";

  static String m1(author) => "Автор: ${author}";

  static String m2(day, hour, minute) =>
      "Уведомлять за ${day} дней в ${hour}:${minute}";

  static String m3(dateTime) => "Уведомлять за ${dateTime} часов/минут";

  static String m4(nextAge) => "Исполняется ${nextAge}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "aboutApp": MessageLookupByLibrary.simpleMessage("О приложении"),
        "addTask": MessageLookupByLibrary.simpleMessage("Добавить задачу"),
        "addTaskButton": MessageLookupByLibrary.simpleMessage("Создать"),
        "appVersionN": m0,
        "authorN": m1,
        "calendar": MessageLookupByLibrary.simpleMessage("Календарь"),
        "chooseDateFormat":
            MessageLookupByLibrary.simpleMessage("Выберите формат даты:"),
        "chooseDateTime":
            MessageLookupByLibrary.simpleMessage("Выберите дату и время:"),
        "chooseTheme": MessageLookupByLibrary.simpleMessage("Выбор темы"),
        "chooseYourLanguage":
            MessageLookupByLibrary.simpleMessage("Выберите язык:"),
        "darkThemeModeName": MessageLookupByLibrary.simpleMessage("Темная"),
        "dateFormat": MessageLookupByLibrary.simpleMessage("Формат даты"),
        "daysShouldINotifyAboutTasks": MessageLookupByLibrary.simpleMessage(
            "За сколько дней уведомлять о задачах?"),
        "deleted": MessageLookupByLibrary.simpleMessage("Удалено"),
        "descriptionForTask": MessageLookupByLibrary.simpleMessage("Описание"),
        "emptyDayCalendar":
            MessageLookupByLibrary.simpleMessage("В этот день нет задач"),
        "emptyNoteList": MessageLookupByLibrary.simpleMessage(
            "Вы можете добавить заметку, нажав на кнопку \"+\" ниже"),
        "emptyTasksList": MessageLookupByLibrary.simpleMessage(
            "Вы можете добавить задачу, нажав кнопку \"+\" ниже"),
        "enterNameInTextField":
            MessageLookupByLibrary.simpleMessage("Введите наименование"),
        "enterTheTextOfTheNote":
            MessageLookupByLibrary.simpleMessage("Введите текст заметки"),
        "fillInTheRequiredFields":
            MessageLookupByLibrary.simpleMessage("Заполните обязательные поля"),
        "hintTextNameInTextField":
            MessageLookupByLibrary.simpleMessage("Наименование*"),
        "hopeMessageAppInInfo": MessageLookupByLibrary.simpleMessage(
            "Доверьтесь нам в управлении вашим временем, и мы поможем вам достичь максимальной продуктивности."),
        "howLongDoesItTakeToNotifyAboutATask":
            MessageLookupByLibrary.simpleMessage(
                "За сколько уведомлять о задаче (часы, минуты)?"),
        "info": MessageLookupByLibrary.simpleMessage("Информация"),
        "language": MessageLookupByLibrary.simpleMessage("Язык"),
        "lightThemeModeName": MessageLookupByLibrary.simpleMessage("Светлая"),
        "month": MessageLookupByLibrary.simpleMessage("месяц"),
        "notes": MessageLookupByLibrary.simpleMessage("Заметки"),
        "notification": MessageLookupByLibrary.simpleMessage("Уведомления"),
        "notifyDayNInAdvanceAtHourNminuteN": m2,
        "notifyInDatetimeNHoursminutes": m3,
        "purposeMessageAppInInfo": MessageLookupByLibrary.simpleMessage(
            "Мы разработали это приложение с одной целью - чтобы вы никогда не забывали о своих важных делах. Наше приложение легко настраивается, чтобы обеспечить своевременные напоминания и помочь  успешно выполнять задачи."),
        "receiveNotificationsTime": MessageLookupByLibrary.simpleMessage(
            "В какое время хотите получать уведомления?"),
        "save": MessageLookupByLibrary.simpleMessage("Сохранить"),
        "search": MessageLookupByLibrary.simpleMessage("Поиск"),
        "selectColor": MessageLookupByLibrary.simpleMessage("Select color"),
        "settings": MessageLookupByLibrary.simpleMessage("Настройки"),
        "startTyping": MessageLookupByLibrary.simpleMessage("Начните ввод"),
        "systemThemeModeName":
            MessageLookupByLibrary.simpleMessage("Системная"),
        "tasks": MessageLookupByLibrary.simpleMessage("Задачи"),
        "tasksNotFound":
            MessageLookupByLibrary.simpleMessage("Задача не найдена"),
        "theNoteIsSaved":
            MessageLookupByLibrary.simpleMessage("Заметка сохранена"),
        "theNoteWasNotFound":
            MessageLookupByLibrary.simpleMessage("Записка не была найдена"),
        "theme": MessageLookupByLibrary.simpleMessage("Тема"),
        "thisIsATestNotificationItsAllRight":
            MessageLookupByLibrary.simpleMessage(
                "Это тестовое уведомление. Всё работает!"),
        "titleNote": MessageLookupByLibrary.simpleMessage("Заголовок"),
        "turnsN": m4,
        "twoWeeks": MessageLookupByLibrary.simpleMessage("2 недели"),
        "updateTask": MessageLookupByLibrary.simpleMessage("Обновить"),
        "week": MessageLookupByLibrary.simpleMessage("неделя"),
        "welcomeMessageInInfo": MessageLookupByLibrary.simpleMessage(
            "Приветствуем вас в нашем приложении для эффективного управления задачами."),
        "youHaveNotEnteredARequiredField": MessageLookupByLibrary.simpleMessage(
            "You have not entered a required field!")
      };
}
