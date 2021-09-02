//2. Import the required packages.
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  String coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
  String apiKey = 'NzZlYjYwM2FmNGJmNDJhZjkyOTM5ZmE5MWYzMGRhZGU';

  Future getCoinData() async {

    String requestURL = '$coinAPIURL/BTC/USD?apikey=$apiKey';
    // Make a GET request to the URL and wait for the response.
    String url='https://apiv2.bitcoinaverage.com/indices/global/ticker/BTCUSD';
    http.Response response = await http.get(url);
    print(url);
      if(response.statusCode==200) // if everything is OK
        {
        print(url);
        var decodeData=convert.jsonDecode(response.body);
               var lastPrice=decodeData['last'];
               return lastPrice;

      }
      else{
        print(response.statusCode);
        throw 'Problem with the get request';
      }
  }
  
}
