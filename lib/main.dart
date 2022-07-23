import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xgrid_test/components/ui/buttons.dart';
import 'package:xgrid_test/models/themingProvider.dart';
import 'package:xgrid_test/theme/style.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? login = prefs.getBool("darkMode");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DarkThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    @override
    void getCurrentAppTheme() async {
      themeChangeProvider.darkTheme =
          await themeChangeProvider.darkThemePreference.getTheme();
    }

    print('sds');
    getCurrentAppTheme();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
// we are using the SharedPreferences to set the value
//  in the memory so even if we close the app and
//  reopens it, our data won't lose.

    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme(context.watch<DarkThemeProvider>().darkTheme),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlatButton(
            onPressed: () {
              themeChange.darkTheme = false;
            },
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,

                // todo: setstateHere
                children: const [Icon(Icons.dark_mode)],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 10,
              top: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              // todo: setstateHere
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).accentColor,
                  radius: MediaQuery.of(context).size.width / 5.6,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Center(
                      child: Icon(
                        Icons.person_outline,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.width / 7,
                      ),
                    ),
                    radius: MediaQuery.of(context).size.width / 6,
                  ),
                ),
              ],
            ),
          ),
          Text("John Doe",
              style: Theme.of(context).textTheme.headline2?.copyWith(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w700)),
          Text("iohn.doe@example.com"),
          Custombutton1(() {}, "Upgrade to PRO",
              buttonColor: Theme.of(context).accentColor),
          Custombutton2(
            () {},
            "Privacy",
            buttonColor: Color(0xffd1d8db),
            icon: Icon(Icons.privacy_tip_outlined, size: 26),
          ),
          Custombutton2(
            () {},
            "Purchase History",
            buttonColor: Color(0xffd1d8db),
            icon: Icon(Icons.restore, size: 26),
          ),
          Custombutton2(
            () {},
            "Help & Support",
            buttonColor: Color(0xffd1d8db),
            icon: Icon(Icons.help_outline, size: 26),
          ),
          Custombutton2(
            () {},
            "Settings",
            buttonColor: Color(0xffd1d8db),
            icon: Icon(Icons.settings_outlined, size: 26),
          ),
          Custombutton2(
            () {},
            "Invite a Friend",
            buttonColor: Color(0xffd1d8db),
            icon: Icon(Icons.person_add_outlined, size: 26),
          ),
          SimpleButton1(() {}, 'Logout')
        ],
      )),
    );
  }
}
