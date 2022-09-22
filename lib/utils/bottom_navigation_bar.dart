import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ntisa_food_app/pages/cart/cart.dart';
import 'package:ntisa_food_app/pages/favorite/view/favorite_page.dart';
import 'package:ntisa_food_app/pages/history/view/history_page.dart';
import 'package:ntisa_food_app/pages/home/home.dart';
import 'package:ntisa_food_app/utils/constants.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({Key? key}) : super(key: key);

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  @override
  int selectedIndex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            this.selectedIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 35,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Stack(
                children: [
                  const Icon(
                    Icons.local_drink_outlined,
                    size: 35,
                  ),
                  Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: 20,
                        width: 20,
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                            color: Colours.kSecondary,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(width: 2, color: Colors.white)),
                        constraints: const BoxConstraints(
                          minWidth: 12,
                          minHeight: 12,
                        ),
                        child: Center(
                          child: Text(
                            "4",
                            style: GoogleFonts.ubuntu(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )),
                ],
              ),
              label: ""),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_outline,
                size: 35,
              ),
              label: ""),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.history_outlined,
                size: 35,
              ),
              label: ""),
        ],
      ),
      body: Stack(
        children: [
          renderView(0, const HomePage()),
          renderView(1, const CartPage()),
          renderView(2, const FavoritePage()),
          renderView(3, const HistoryPage()),
        ],
      ),
    );
  }

  IgnorePointer renderView(int tabIndex, Widget view) {
    return IgnorePointer(
      ignoring: selectedIndex != tabIndex,
      child: Opacity(
        opacity: selectedIndex == tabIndex ? 1 : 0,
        child: view,
      ),
    );
  }
}
