import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localeNotifierProvider = StateNotifierProvider<LocaleNotifier, Locale>(
  (ref) => LocaleNotifier(),
);

class LocaleNotifier extends StateNotifier<Locale> {
  final Locale _locale;
  final List<Locale> _supportedLocales;
  LocaleNotifier(
      {Locale locale = const Locale('tr', 'TR'),
      List<Locale> supportedLocales = const [
        Locale('tr', 'TR'), // Türkçe, Türkiye country code
        //Locale('en', 'US'), // English, United States country code
      ]})
      : _locale = locale,
        _supportedLocales = supportedLocales,
        super(locale) {
    getLocale();
  }

  void changeLocale(Locale locale) {
    state = locale;
  }

  Future<Locale> getLocale() async {
    return _locale;
  }

  Future<List<Locale>> getSupportedLocales() async {
    return _supportedLocales;
  }
}
