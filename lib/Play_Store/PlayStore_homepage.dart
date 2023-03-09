import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:play_store/Global.dart';
import 'package:play_store/Play_Store/categories_page.dart';
import 'package:play_store/Play_Store/foryou_page.dart';
import 'package:play_store/Play_Store/top_page.dart';
import 'package:play_store/main.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int bottomIndex = 0;

  late TabController tabController;
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this); // initialise it here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
              child: CupertinoSearchTextField(
                backgroundColor: Globals.icon,
                itemColor: Colors.black54,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          Switch(
            activeColor: Globals.button,
            inactiveThumbColor: Globals.button,
            inactiveTrackColor: Globals.icon,
            value: Globals.platForm,
            onChanged: (val) {
              setState(() {
                Globals.platForm = val;
              });
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const MyApp(),
                  ),
                      (route) => false);
            },
          )
        ],
        bottom: TabBar(
          indicatorColor: Globals.button,
          controller: tabController,
          labelColor: Globals.button,
          unselectedLabelColor: Colors.black54,
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          isScrollable: true,
          tabs: const [
            Tab(
              text: "For you",
            ),
            Tab(
              text: "Top charts",
            ),
            Tab(
              text: "Events",
            ),
            Tab(
              text: "Categories",
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (val) {
          setState(() {
            bottomIndex = val;
            pageController.animateToPage(
              val,
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,
            );
          });
        },
        currentIndex: bottomIndex,
        selectedItemColor: Globals.button,
        backgroundColor: Globals.icon,
        elevation: 0,
        unselectedIconTheme: IconThemeData(
          color: Colors.brown.shade900,
        ),
        unselectedLabelStyle: TextStyle(
            color: Globals.button, fontSize: 14, fontWeight: FontWeight.w400),
        selectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.gamecontroller),
            label: "Games",
            backgroundColor: Colors.brown,
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.command),
            label: "Apps",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.tags_solid),
            label: "Offers",
          ),
        ],
      ),
      body: PageView(
        controller: pageController,
        children: [
          page(id: bottomIndex),
          page(id: bottomIndex),
          page(id: bottomIndex),
        ],
      ),
    );
  }

  page({required int id}) {
    return TabBarView(
      controller: tabController,
      children: [
        Center(
          child: (id == 0) ? const ForYou() : const ForYouApp(),
        ),
        Center(
          child:(id == 0) ?const TopGamePage() :const TopPage(),
        ),
        Center(
          child: (id == 0) ? const ForYou() : const Categories(),
        ),
        Center(
          child: (id == 0) ? const CategoriesGame() :const Categories() ,
        ),
      ],
    );
  }
}
