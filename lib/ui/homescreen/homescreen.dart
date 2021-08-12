import 'package:flutter/material.dart';
import 'package:socials/ui/broadcast_screen/broadcast_screen.dart';
import 'package:socials/ui/chat_list_screen/chat_list_screen.dart';
import 'package:socials/ui/homescreen/widgets/bottom_navigation_widget.dart';
import 'package:socials/ui/homescreen/widgets/custom_drawer.dart';
import 'package:socials/ui/stock_screen/stock_screen.dart';
import 'package:socials/utils/helpers/database.dart';
import 'package:socials/utils/models/app_state.dart';
import 'package:socials/utils/models/product.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  List<Widget> pages  = [
    ChatListScreen(),
    BroadcastScreen(),
    StockScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Socials"),
        centerTitle: true,

      ),

      drawer: CustomDrawer(),



      bottomNavigationBar: BottomNavigationWidget(
        onChanged: (index){
          setState(() {
            _current = index;
          });
        },
      ),
        floatingActionButton: HeroMode(
          child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {


            },
          ),
        ),
        body: Container(
            child: pages[_current]
        )
    );
  }
}
