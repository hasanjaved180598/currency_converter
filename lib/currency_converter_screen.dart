import 'package:flutter/material.dart';

class CurrencyConverterScreen extends StatefulWidget{
   const CurrencyConverterScreen ({super.key});

  @override
  State<CurrencyConverterScreen> createState() => _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {

  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    const border = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(
          width: 2.0,
          style: BorderStyle.solid,
          // strokeAlign: BorderSide.strokeAlignOutside,
        )
    );
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Currency Converter',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text("Pak ${result!=0 ? result.toStringAsFixed(2) : 0}",style: const TextStyle(
              fontSize: 55,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              ),
             ),
             Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 18),
              child: TextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: Colors.black,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  hintText: 'Please enter amount in USD',
                  hintStyle: TextStyle(
                  color: Colors.black,
                  ),
                  prefixIcon: Icon(Icons.monetization_on_sharp),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
              ),
            ),
            Padding(
              padding:  const EdgeInsets.all(18.0),
              child: ElevatedButton(
                onPressed: (){
                  result = double.parse(textEditingController.text) * 81;
                  setState(() {

                  });
                },
                style:   TextButton.styleFrom(
                    backgroundColor:  Colors.black,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )
                ),
                child: const Text("Convert"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}