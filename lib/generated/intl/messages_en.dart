// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(appVersion) => "Application Version: ${appVersion}";

  static String m1(author) => "Author: ${author}";

  static String m2(day, hour, minute) =>
      "notify ${day} days in advance at ${hour}:${minute}";

  static String m3(nextAge) => "Turns ${nextAge}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "aboutApp": MessageLookupByLibrary.simpleMessage("About app"),
        "addTask": MessageLookupByLibrary.simpleMessage("Add task"),
        "addTaskButton": MessageLookupByLibrary.simpleMessage("Add task"),
        "appVersionN": m0,
        "authorN": m1,
        "calendar": MessageLookupByLibrary.simpleMessage("Calendar"),
        "chooseDateFormat":
            MessageLookupByLibrary.simpleMessage("Select the date format:"),
        "chooseDateTime":
            MessageLookupByLibrary.simpleMessage("Выберите дату и время:"),
        "chooseTheme": MessageLookupByLibrary.simpleMessage("Select themes"),
        "chooseYourLanguage":
            MessageLookupByLibrary.simpleMessage("Select a language:"),
        "darkThemeModeName": MessageLookupByLibrary.simpleMessage("Dark theme"),
        "dateFormat": MessageLookupByLibrary.simpleMessage("Date format"),
        "daysShouldINotifyAboutTasks": MessageLookupByLibrary.simpleMessage(
            "How many days should notify about tasks?"),
        "descriptionForTask": MessageLookupByLibrary.simpleMessage("Описание"),
        "emptyDayCalendar": MessageLookupByLibrary.simpleMessage(
            "There are no tasks on this day"),
        "emptyTasksList": MessageLookupByLibrary.simpleMessage(
            "You can add a task by clicking the \"+\" button below"),
        "enterNameInTextField":
            MessageLookupByLibrary.simpleMessage("Enter name"),
        "fillInTheRequiredFields":
            MessageLookupByLibrary.simpleMessage("Fill in the required fields"),
        "hintTextNameInTextField":
            MessageLookupByLibrary.simpleMessage("Title*"),
        "hopeMessageAppInInfo": MessageLookupByLibrary.simpleMessage(
            "We hope that our application will make your greetings more organized and memorable."),
        "info": MessageLookupByLibrary.simpleMessage("Info"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "lightThemeModeName":
            MessageLookupByLibrary.simpleMessage("Light theme"),
        "month": MessageLookupByLibrary.simpleMessage("month"),
        "notification": MessageLookupByLibrary.simpleMessage("Notifications"),
        "notifyDayNInAdvanceAtHourNminuteN": m2,
        "purposeMessageAppInInfo": MessageLookupByLibrary.simpleMessage(
            "The application is designed so that you never forget about the tasks of your loved ones and dear ones. Easily set notifications to wish them a happy holiday on time!"),
        "receiveNotificationsTime": MessageLookupByLibrary.simpleMessage(
            "What time do you want to receive notifications?"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "search": MessageLookupByLibrary.simpleMessage("Search"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "systemThemeModeName":
            MessageLookupByLibrary.simpleMessage("System theme"),
        "tasks": MessageLookupByLibrary.simpleMessage("Tasks"),
        "tasksNotFound":
            MessageLookupByLibrary.simpleMessage("The task was not found"),
        "theme": MessageLookupByLibrary.simpleMessage("Theme"),
        "thisIsATestNotificationItsAllRight":
            MessageLookupByLibrary.simpleMessage(
                "This is a test notification. It\'s all right!"),
        "turnsN": m3,
        "twoWeeks": MessageLookupByLibrary.simpleMessage("2 weeks"),
        "updateTask": MessageLookupByLibrary.simpleMessage("Update task"),
        "week": MessageLookupByLibrary.simpleMessage("week"),
        "welcomeMessageInInfo": MessageLookupByLibrary.simpleMessage(
            "Welcome to our task reminder app!"),
        "youHaveNotEnteredARequiredField": MessageLookupByLibrary.simpleMessage(
            "You have not entered a required field!")
      };
}
