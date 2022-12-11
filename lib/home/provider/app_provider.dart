import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier{
  String currentLang = "en";
  ThemeMode currentTheme = ThemeMode.light;
  bool isDark(){
    return currentTheme == ThemeMode.dark;
  }
  void changeTheme(ThemeMode newTheme){
    if(newTheme == currentTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }
  void changeLanguage(String newLang){
    if(newLang == currentLang) return;
    currentLang = newLang;
    notifyListeners();
  }
}