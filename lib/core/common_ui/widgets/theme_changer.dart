
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mhi/core/common_ui/widgets/options_button.dart';
import 'package:mhi/core/constants/app_constants.dart';

class ThemeChanger extends StatefulWidget {
  const ThemeChanger({super.key});

  @override
  State<ThemeChanger> createState() => _ThemeChangerState();
}

class _ThemeChangerState extends State<ThemeChanger> {
  Future<bool> getTheCurrentThemeValue() async {
    return await Hive.box(AppConstants.themeBox).get(AppConstants.isDarkMode) ??
        false;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OptionButton(
        icon: Icons.abc,
        value: "الوضع الليلي",
        onTap: null,
        widget: FutureBuilder<bool>(
          future: getTheCurrentThemeValue(),
          builder: (context, snapshot) {
            bool isDarkTheme;
            if (snapshot.hasData) {
              isDarkTheme = snapshot.data ?? false;
              return Switch(
                  value: isDarkTheme,
                  onChanged: (state) {
                    Hive.box(AppConstants.themeBox)
                        .put(AppConstants.isDarkMode, state);
                    setState(() {
                      isDarkTheme = !isDarkTheme;
                    });
                  });
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const Text("err0r");
            }
          },
        ));
  }
}
