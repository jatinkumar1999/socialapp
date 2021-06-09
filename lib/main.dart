import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:socialapp/BottomNaviationBarWidget.dart';
import 'package:socialapp/PanelWidget.dart';
import 'package:socialapp/users.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  final panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    final user = users[index];
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: const Icon(
            Icons.person_add_outlined,
          ),
          actions: const [
            Icon(
              Icons.close,
            ),
            SizedBox(width: 10),
          ],
        ),
        body: SlidingUpPanel(
            color: Colors.transparent,
            minHeight: 130,
            maxHeight: 320,
            controller: panelController,
            body: PageView(
              children: users
                  .map((user) => Image.asset(
                        user.urlImage,
                        fit: BoxFit.cover,
                      ))
                  .toList(),
              onPageChanged: (index) {
                setState(() {
                  this.index = index;
                });
              },
            ),
            panelBuilder: (ScrollController scrollController) => PanelWidget(
                  user: user,
                  onClickedPanel: panelController.open,
                  onClickedFollowing: () {
                    setState(() {
                      user.isFollowing = !user.isFollowing;
                    });
                  },
                )),
        bottomNavigationBar: const BottomNavigationBarWidget(),
      ),
    );
  }
}
