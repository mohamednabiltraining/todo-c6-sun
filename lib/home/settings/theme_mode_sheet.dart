import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/home/provider/app_provider.dart';
import 'package:todo_app/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({Key? key}) : super(key: key);

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      color: provider.isDark()?Color(0xFF141922):Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        children: [
          InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.light);
              },
              child: provider.isDark()
                  ? getUnSelectedRow(AppLocalizations.of(context)!.light)
                  : getSelectedRow(AppLocalizations.of(context)!.light)),
          SizedBox(
            height: 10,
          ),
          InkWell(

              onTap: () {
                provider.changeTheme(ThemeMode.dark);
              },
              child: provider.isDark()
                  ? getSelectedRow(AppLocalizations.of(context)!.dark)
                  : getUnSelectedRow(AppLocalizations.of(context)!.dark)),
        ],
      ),
    );
  }

  Widget getSelectedRow(String text) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: provider.isDark()?Color(0xFF060E1E):Colors.grey.shade300,
      ),
      child: Row(
        children: [
          Text(
            text,
            style:
                Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 16),
          ),
          Icon(
            Icons.check,
            size: 24,
            color: MyTheme.lightPrimary,
          ),
        ],
      ),
    );
  }

  Widget getUnSelectedRow(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 16, color: Colors.black),
          ),
          Icon(
            Icons.check,
            size: 24,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
