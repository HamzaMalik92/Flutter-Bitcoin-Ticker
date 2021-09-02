import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform; // import only Plateform library
// import 'dart:io' show Plateform;  // import all except Plateform library

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String dropDownStartingValue = currenciesList[0];

  CoinData coinData=CoinData();
  var lastPrice='?';


  //  Drop down Button for Android
  DropdownButton<String> androidDropDown() {
    List<DropdownMenuItem<String>> items = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(child: Text(currency), value: currency);
      items.add(newItem);
    }

    return DropdownButton(
      value: dropDownStartingValue,
      items: items, // list of DropDownMenuItem
      onChanged: (value) async{
        var price=await coinData.getCoinData();
        setState(()  {
          dropDownStartingValue = value;
          lastPrice=price.toString();
          print('lastPrice');
          print(lastPrice);

        },);
      },
    );
  }

  //  Cupertino Picker for Android
  CupertinoPicker iOSpicker() {
    List<Text> items = [];
    for (String currency in currenciesList) {
      items.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      children: items,
      itemExtent: 22,
      onSelectedItemChanged: (int value) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $lastPrice USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isAndroid? androidDropDown():iOSpicker(),
          ),
        ],
      ),
    );
  }
}