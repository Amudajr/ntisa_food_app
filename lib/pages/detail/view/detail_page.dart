import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ntisa_food_app/utils/constants.dart';

class DetailProduct extends StatefulWidget {
  final String name;
  final String dsc;
  final String img;
  final num price;
  const DetailProduct(
      {Key? key,
      required this.name,
      required this.dsc,
      required this.price,
      required this.img})
      : super(key: key);

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  late double productPrice = widget.price.toDouble();
  int _counter = 0;
  bool isValidated = true;

  void incrementCounter() {
    setState(() {
      _counter++;
      productPrice += widget.price;
    });
  }

  void decrementCounter() {
    setState(() {
      _counter--;
      productPrice -= widget.price;
      if (_counter < 1) {
        _counter = 0;
        productPrice = widget.price.toDouble();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                color: Colors.black,
                icon: Icon(
                  isValidated ? Icons.favorite_border_outlined : Icons.favorite,
                ),
                onPressed: () {
                  setState(() {
                    isValidated = !isValidated;
                  });
                },
              ),
            )
          ],
          backgroundColor: Colors.white,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back, color: Colors.black)),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: GoogleFonts.ubuntu(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 280,
                  width: 280,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: NetworkImage(widget.img),
                          fit: BoxFit.contain)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "523 kkal",
                        style: GoogleFonts.ubuntu(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Energy",
                        style: GoogleFonts.ubuntu(
                            fontSize: 18,
                            color: Colours.kSecondary,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "800 gr.",
                        style: GoogleFonts.ubuntu(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Weight",
                        style: GoogleFonts.ubuntu(
                            fontSize: 18,
                            color: Colours.kSecondary,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "80 min",
                        style: GoogleFonts.ubuntu(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Delivery",
                        style: GoogleFonts.ubuntu(
                            fontSize: 18,
                            color: Colours.kSecondary,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            incrementCounter();
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colours.kPrimary),
                            child: Center(
                              child: Text("+",
                                  style: GoogleFonts.ubuntu(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Colors.grey)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          _counter.toString(),
                          style: GoogleFonts.ubuntu(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            decrementCounter();
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colours.kPrimary),
                            child: Center(
                              child: Text("-",
                                  style: GoogleFonts.ubuntu(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Colors.grey)),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          widget.dsc,
                          style: GoogleFonts.ubuntu(
                              fontSize: 18, color: Colors.grey),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 70,
                    width: 220,
                    decoration: BoxDecoration(
                        color: Colours.kSecondary,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "+",
                          style: GoogleFonts.ubuntu(
                              fontSize: 35,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Add to cart",
                          style: GoogleFonts.ubuntu(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "\$$productPrice",
                    style: GoogleFonts.ubuntu(
                        fontSize: 30,
                        color: Colours.kSecondary,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ],
          ),
        )));
  }
}
