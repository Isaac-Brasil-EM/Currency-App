import 'package:conversor_curso/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../components/currency_box.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();

  HomeController? homeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 100.0, left: 30, right: 30, bottom: 10),
        child: Column(
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 150,
              height: 150,
            ),
            SizedBox(height: 50),
            CurrencyBox(
                selectedItem: homeController?.toCurrency,
                controller: toText,
                items: homeController!.currencies,
                onChanged: (model) {
                  setState(() {
                    homeController?.toCurrency = model;
                  });
                }),
            SizedBox(height: 10),
            CurrencyBox(
                selectedItem: homeController?.fromCurrency,
                controller: fromText,
                items: homeController!.currencies,
                onChanged: (model) {
                  setState(() {
                    homeController?.fromCurrency = model;
                  });
                }),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                homeController?.convert();
              },
              child: Text('CONVERTER'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.amber),
              ),
            )
          ],
        ),
      ),
    );
  }
}
