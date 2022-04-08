import 'package:blue_love_app/Logic/Bloc/BluetoothBloc.dart';
import 'package:blue_love_app/Logic/Bloc/BluetoothPingBloc.dart';
import 'package:blue_love_app/Logic/Events/BluetoothEvents.dart';
import 'package:blue_love_app/Utility/button.dart';
import 'package:blue_love_app/Utility/circle.dart';
import 'package:blue_love_app/pages/search_new_devices.dart';
import 'package:blue_love_app/widget/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    NewDevicesPageState();
    BluetoothBlocPing().stream.listen((event) {
      Fluttertoast.showToast(msg: event.status ? "دستگاه متصل" : "عدم اتصال");
    });
    super.initState();
  }

  void _sendText() {
    setState(() {
      print("Fuck");
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: NavigationDrawerWidget(),
      body: Builder(builder: (context) {
        return SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              SizedBox(
                width: size.width,
                height: size.height,
                child: Center(
                  child: StreamBuilder<BandSate>(
                    stream: BluetoothBloc().stream,
                    builder: (BuildContext context,
                        AsyncSnapshot<BandSate> snapshot) {
                      return CustomCircle(
                        children: [
                          Padding(padding: new EdgeInsets.all(85)),
                          Text("آخرین پیام"),
                          Container(
                              padding: EdgeInsets.only(right: 15),
                              width: 350,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.green),
                              child: Text(
                                "دستگاه متصل",
                                textAlign: TextAlign.end,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                          Text("عاشقانه های من"),
                          CustomButton(
                            buttonText: "عاشقتم عزیزترینم",
                            selectHandler: _sendText,
                            colorBtn: Colors.green,
                            isSelected: snapshot.data != null &&
                                snapshot.data! is ChangeMessage &&
                                (snapshot.data! as ChangeMessage).color == 1,
                          ),
                          CustomButton(
                            buttonText: "عاشقتم عزیزترینم",
                            selectHandler: _sendText,
                            colorBtn: Colors.red,
                            isSelected: snapshot.data != null &&
                                snapshot.data! is ChangeMessage &&
                                (snapshot.data! as ChangeMessage).color == 2,
                          ),
                          CustomButton(
                            buttonText: "عاشقتم عزیزترینم",
                            selectHandler: _sendText,
                            colorBtn: Colors.blueAccent,
                            isSelected: snapshot.data != null &&
                                snapshot.data! is ChangeMessage &&
                                (snapshot.data! as ChangeMessage).color == 3,
                          ),
                          CustomButton(
                            buttonText: "عاشقتم عزیزترینم",
                            selectHandler: _sendText,
                            colorBtn: Colors.yellow,
                            isSelected: snapshot.data != null &&
                                snapshot.data! is ChangeMessage &&
                                (snapshot.data! as ChangeMessage).color == 4,
                          ),
                          CustomButton(
                            buttonText: "عاشقتم عزیزترینم",
                            selectHandler: _sendText,
                            colorBtn: Colors.purple,
                            isSelected: snapshot.data != null &&
                                snapshot.data! is ChangeMessage &&
                                (snapshot.data! as ChangeMessage).color == 5,
                          ),
                          CustomButton(
                            buttonText: "عاشقتم عزیزترینم",
                            selectHandler: _sendText,
                            colorBtn: Colors.lightBlue,
                            isSelected: snapshot.data != null &&
                                snapshot.data! is ChangeMessage &&
                                (snapshot.data! as ChangeMessage).color == 6,
                          ),
                          CustomButton(
                            buttonText: "عاشقتم عزیزترینم",
                            selectHandler: _sendText,
                            colorBtn: Colors.white70,
                            isSelected: snapshot.data != null &&
                                snapshot.data! is ChangeMessage &&
                                (snapshot.data! as ChangeMessage).color == 7,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 30,
                child: SizedBox(
                  height: 70,
                  width: 70,
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                    child: IconButton(
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
