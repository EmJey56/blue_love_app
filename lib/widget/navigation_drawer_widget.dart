import 'package:blue_love_app/pages/about_us.dart';
import 'package:blue_love_app/pages/login.dart';
import 'package:blue_love_app/pages/scan_qr_code.dart';
import 'package:blue_love_app/pages/search_new_devices.dart';
import 'package:blue_love_app/pages/settings.dart';
import 'package:blue_love_app/pages/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class NavigationDrawerWidget extends StatelessWidget {
  GlobalKey key = GlobalKey();

  final padding = EdgeInsets.symmetric(horizontal: 20);
  Widget circle(double top, double right, double width, double height,
          Color color, Color shadow,
          {bool isBottom = false}) =>
      Positioned(
        top: !isBottom ? top : null,
        right: right,
        bottom: isBottom ? top : null,
        child: Container(
          width: width,
          height: height,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: color, boxShadow: [
            BoxShadow(
              blurRadius: 20,
              spreadRadius: 0.1,
              blurStyle: BlurStyle.outer,
              color: shadow,
            )
          ]),
        ),
      );
  @override
  Widget build(BuildContext context) {
    final name = "محمدجواد علی خانلو";
    final email = "emjey561@gmail.com";
    const urlImage = "";
    Size size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Drawer(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                const Color(0xffF53C3C),
                Color.fromARGB(255, 179, 38, 38),
              ],
                  stops: [
                0,
                1
              ])),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                buildHeader(
                  urlImage: urlImage,
                  name: name,
                  email: email,
                  onClicked: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          UserPage(name: name, urlImage: urlImage),
                    ),
                  ),
                ),
                Container(
                  padding: padding,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 48,
                      ),
                      buildMenuItem(
                        text: "اسکن بارکد",
                        icon: FeatherIcons.smartphone,
                        onClicked: () => selectedItem(context, 0),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      buildMenuItem(
                        text: "لیست دستگاه ها",
                        icon: FeatherIcons.bluetooth,
                        onClicked: () => selectedItem(context, 1),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      buildMenuItem(
                        text: "تنظیمات",
                        icon: FeatherIcons.settings,
                        onClicked: () => selectedItem(context, 2),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Divider(
                        color: Colors.white70,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      buildMenuItem(
                        text: "درباره ما",
                        icon: FeatherIcons.info,
                        onClicked: () => selectedItem(context, 3),
                      ),
                      buildMenuItem(
                        text: "خارج شدن",
                        icon: FeatherIcons.logOut,
                        onClicked: () => selectedItem(context, 4),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildHeader({
  String? urlImage,
  required String name,
  required String email,
  required VoidCallback onClicked,
}) =>
    InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: onClicked,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              // backgroundImage: NetworkImage(urlImage!),
              backgroundImage: AssetImage("assets/img/me.jpg"),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 18, color: Colors.white, fontFamily: "Yekan"),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );

Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  final color = Colors.white;
  final hoverColor = Colors.white70;

  return ListTile(
    leading: Icon(
      icon,
      color: color,
    ),
    title: Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: "Yekan",
      ),
    ),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}

void selectedItem(BuildContext context, int index) {
  Navigator.of(context).pop();

  switch (index) {
    case 0:
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => QrcodeScanPage(),
        ),
      );
      break;

    // case 1:
    //   Navigator.of(context).push(
    //     MaterialPageRoute(
    //       builder: (context) => NewDevicesPage(
    //         title: "Hi",
    //       ),
    //     ),
    //   );
    //   break;

    case 2:
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SettingsPage(),
        ),
      );
      break;

    case 3:
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => AboutUsPage(),
        ),
      );
      break;

    case 4:
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
      break;
  }
}
