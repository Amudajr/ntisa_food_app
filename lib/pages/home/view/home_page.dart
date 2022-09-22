import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ntisa_food_app/pages/detail/view/detail_page.dart';
import 'package:ntisa_food_app/pages/home/widgets/products_list.dart';
import 'package:ntisa_food_app/pages/home/widgets/varieties_list.dart';
import 'package:ntisa_food_app/utils/constants.dart';
import 'package:ntisa_food_app/utils/global_varaible.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(productProvider.notifier).getProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final productProviders = ref.watch(productProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Hi!", style: GoogleFonts.poppins(fontSize: 20)),
                  const SizedBox(width: 5),
                  Text(
                    "Vadim",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colours.kPrimary,
                    filled: true,
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(20, 40, 25, 0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(17)),
                      borderSide: BorderSide(
                        color: Colours.kPrimary,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(17)),
                      borderSide: BorderSide(color: Colours.kPrimary),
                    ),
                    border: const OutlineInputBorder(),
                    labelText: "Find what you want...",
                    labelStyle: GoogleFonts.poppins(fontSize: 15),
                    prefixIcon: const Icon(
                      Icons.search_outlined,
                      size: 30,
                      color: Color.fromARGB(255, 121, 121, 121),
                    )),
              ),
              const SizedBox(
                height: 18,
              ),
              Container(
                height: 120,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xff4AAE54),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Free Combo",
                            style: GoogleFonts.poppins(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "Burger + Coca-Cola",
                            style: GoogleFonts.poppins(
                                fontSize: 15, color: Colors.white),
                          ),
                          Text(
                            "for new users",
                            style: GoogleFonts.poppins(
                                fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 120,
                      width: 130,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/combo.png"),
                              fit: BoxFit.fill)),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const VarietiesCard(),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Top Products",
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const ProductsCard(),
            ],
          ),
        ),
      ),
    );
  }
}
