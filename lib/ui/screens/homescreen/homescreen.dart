import 'package:flutter/material.dart';
import 'package:socials/ui/screens/broadcast_screen/broadcast_screen.dart';
import 'package:socials/ui/screens/chat_list_screen/chat_list_screen.dart';
import 'package:socials/ui/screens/homescreen/friends_list_page.dart';
import 'package:socials/ui/screens/homescreen/widgets/bottom_navigation_widget.dart';
import 'package:socials/ui/screens/homescreen/widgets/custom_drawer.dart';
import 'package:socials/ui/screens/stock_screen/stock_screen.dart';
import 'package:socials/utils/models/app_state.dart';
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
              if (_current == 0)
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> FriendsListPage()
                    )
                );
              // context.read<AppState>().twitter!.getFriends();


            },
          ),
        ),
        body: Container(
            child: pages[_current]
        )
    );
  }
}
