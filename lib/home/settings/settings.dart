import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/generated/l10n.dart';
import 'package:todo_app/home/provider/app_provider.dart';
import 'package:todo_app/home/settings/theme_mode_sheet.dart';
import 'package:todo_app/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'language_bottom_sheet.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.lang,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
          ),
          InkWell(
            onTap: (){
              showBottomSheetLanguage();
            },
            child: Container(
              width: 320,
              height: 50,
              margin: EdgeInsets.only(
                top: 20,
                left: 20,
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: provider.isDark()
                      ? MyTheme.darkScaffoldBackground
                      : Colors.white,
                  border: Border.all(
                    color: MyTheme.lightPrimary,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.currentLang == "en" ? "English" : "العربية",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 14,
                        ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: MyTheme.lightPrimary,
                    size: 26,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
          ),
          InkWell(
            onTap: () {
              showBottomSheetThemeMode();
            },
            child: Container(
              width: 320,
              height: 50,
              margin: EdgeInsets.only(
                top: 20,
                left: 20,
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: provider.isDark()
                      ? MyTheme.darkScaffoldBackground
                      : Colors.white,
                  border: Border.all(
                    color: MyTheme.lightPrimary,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.isDark()
                        ? AppLocalizations.of(context)!.dark
                        : AppLocalizations.of(context)!.light,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 14,
                        ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: MyTheme.lightPrimary,
                    size: 26,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showBottomSheetThemeMode() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return ThemeBottomSheet();
        });
  }

void showBottomSheetLanguage(){
  showModalBottomSheet(context: context, builder: (buildContext){
      return LanguageBottomSheet();
  });
}
}
