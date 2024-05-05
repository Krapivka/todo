// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notification {
    return Intl.message(
      'Notifications',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Date format`
  String get dateFormat {
    return Intl.message(
      'Date format',
      name: 'dateFormat',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Info`
  String get info {
    return Intl.message(
      'Info',
      name: 'info',
      desc: '',
      args: [],
    );
  }

  /// `Select themes`
  String get chooseTheme {
    return Intl.message(
      'Select themes',
      name: 'chooseTheme',
      desc: '',
      args: [],
    );
  }

  /// `System`
  String get systemThemeModeName {
    return Intl.message(
      'System',
      name: 'systemThemeModeName',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get lightThemeModeName {
    return Intl.message(
      'Light',
      name: 'lightThemeModeName',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get darkThemeModeName {
    return Intl.message(
      'Dark',
      name: 'darkThemeModeName',
      desc: '',
      args: [],
    );
  }

  /// `How many days should notify about tasks?`
  String get daysShouldINotifyAboutTasks {
    return Intl.message(
      'How many days should notify about tasks?',
      name: 'daysShouldINotifyAboutTasks',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Select a language:`
  String get chooseYourLanguage {
    return Intl.message(
      'Select a language:',
      name: 'chooseYourLanguage',
      desc: '',
      args: [],
    );
  }

  /// `About app`
  String get aboutApp {
    return Intl.message(
      'About app',
      name: 'aboutApp',
      desc: '',
      args: [],
    );
  }

  /// `Application Version: {appVersion}`
  String appVersionN(Object appVersion) {
    return Intl.message(
      'Application Version: $appVersion',
      name: 'appVersionN',
      desc: '',
      args: [appVersion],
    );
  }

  /// `Author: {author}`
  String authorN(Object author) {
    return Intl.message(
      'Author: $author',
      name: 'authorN',
      desc: '',
      args: [author],
    );
  }

  /// `Welcome to our application for effective task management.`
  String get welcomeMessageInInfo {
    return Intl.message(
      'Welcome to our application for effective task management.',
      name: 'welcomeMessageInInfo',
      desc: '',
      args: [],
    );
  }

  /// `We have developed this application with one goal in mind - so that you never forget about your important business. Our app is easily customizable to provide timely reminders and help you complete tasks successfully.`
  String get purposeMessageAppInInfo {
    return Intl.message(
      'We have developed this application with one goal in mind - so that you never forget about your important business. Our app is easily customizable to provide timely reminders and help you complete tasks successfully.',
      name: 'purposeMessageAppInInfo',
      desc: '',
      args: [],
    );
  }

  /// `Trust us to manage your time and we will help you achieve maximum productivity.`
  String get hopeMessageAppInInfo {
    return Intl.message(
      'Trust us to manage your time and we will help you achieve maximum productivity.',
      name: 'hopeMessageAppInInfo',
      desc: '',
      args: [],
    );
  }

  /// `Select the date format:`
  String get chooseDateFormat {
    return Intl.message(
      'Select the date format:',
      name: 'chooseDateFormat',
      desc: '',
      args: [],
    );
  }

  /// `There are no tasks on this day`
  String get emptyDayCalendar {
    return Intl.message(
      'There are no tasks on this day',
      name: 'emptyDayCalendar',
      desc: '',
      args: [],
    );
  }

  /// `You can add a task by clicking the "+" button below`
  String get emptyTasksList {
    return Intl.message(
      'You can add a task by clicking the "+" button below',
      name: 'emptyTasksList',
      desc: '',
      args: [],
    );
  }

  /// `The task was not found`
  String get tasksNotFound {
    return Intl.message(
      'The task was not found',
      name: 'tasksNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Enter name`
  String get enterNameInTextField {
    return Intl.message(
      'Enter name',
      name: 'enterNameInTextField',
      desc: '',
      args: [],
    );
  }

  /// `Title*`
  String get hintTextNameInTextField {
    return Intl.message(
      'Title*',
      name: 'hintTextNameInTextField',
      desc: '',
      args: [],
    );
  }

  /// `Add task`
  String get addTask {
    return Intl.message(
      'Add task',
      name: 'addTask',
      desc: '',
      args: [],
    );
  }

  /// `Add task`
  String get addTaskButton {
    return Intl.message(
      'Add task',
      name: 'addTaskButton',
      desc: '',
      args: [],
    );
  }

  /// `Update task`
  String get updateTask {
    return Intl.message(
      'Update task',
      name: 'updateTask',
      desc: '',
      args: [],
    );
  }

  /// `What time do you want to receive notifications?`
  String get receiveNotificationsTime {
    return Intl.message(
      'What time do you want to receive notifications?',
      name: 'receiveNotificationsTime',
      desc: '',
      args: [],
    );
  }

  /// `notify {day} days in advance at {hour}:{minute}`
  String notifyDayNInAdvanceAtHourNminuteN(
      Object day, Object hour, Object minute) {
    return Intl.message(
      'notify $day days in advance at $hour:$minute',
      name: 'notifyDayNInAdvanceAtHourNminuteN',
      desc: '',
      args: [day, hour, minute],
    );
  }

  /// `You have not entered a required field!`
  String get youHaveNotEnteredARequiredField {
    return Intl.message(
      'You have not entered a required field!',
      name: 'youHaveNotEnteredARequiredField',
      desc: '',
      args: [],
    );
  }

  /// `Fill in the required fields`
  String get fillInTheRequiredFields {
    return Intl.message(
      'Fill in the required fields',
      name: 'fillInTheRequiredFields',
      desc: '',
      args: [],
    );
  }

  /// `This is a test notification. It's all right!`
  String get thisIsATestNotificationItsAllRight {
    return Intl.message(
      'This is a test notification. It\'s all right!',
      name: 'thisIsATestNotificationItsAllRight',
      desc: '',
      args: [],
    );
  }

  /// `Tasks`
  String get tasks {
    return Intl.message(
      'Tasks',
      name: 'tasks',
      desc: '',
      args: [],
    );
  }

  /// `Calendar`
  String get calendar {
    return Intl.message(
      'Calendar',
      name: 'calendar',
      desc: '',
      args: [],
    );
  }

  /// `Turns {nextAge}`
  String turnsN(Object nextAge) {
    return Intl.message(
      'Turns $nextAge',
      name: 'turnsN',
      desc: '',
      args: [nextAge],
    );
  }

  /// `month`
  String get month {
    return Intl.message(
      'month',
      name: 'month',
      desc: '',
      args: [],
    );
  }

  /// `2 weeks`
  String get twoWeeks {
    return Intl.message(
      '2 weeks',
      name: 'twoWeeks',
      desc: '',
      args: [],
    );
  }

  /// `week`
  String get week {
    return Intl.message(
      'week',
      name: 'week',
      desc: '',
      args: [],
    );
  }

  /// `Выберите дату и время:`
  String get chooseDateTime {
    return Intl.message(
      'Выберите дату и время:',
      name: 'chooseDateTime',
      desc: '',
      args: [],
    );
  }

  /// `Описание`
  String get descriptionForTask {
    return Intl.message(
      'Описание',
      name: 'descriptionForTask',
      desc: '',
      args: [],
    );
  }

  /// `How long does it take to notify about a task (hours, minutes)?`
  String get howLongDoesItTakeToNotifyAboutATask {
    return Intl.message(
      'How long does it take to notify about a task (hours, minutes)?',
      name: 'howLongDoesItTakeToNotifyAboutATask',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
