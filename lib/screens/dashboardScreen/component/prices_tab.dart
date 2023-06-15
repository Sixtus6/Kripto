import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kripto/config/base-url.dart';
import 'package:kripto/config/color.dart';
import 'package:kripto/screens/widget/prices-container.dart';

class Prices_tab extends StatefulWidget {
  const Prices_tab({super.key});

  @override
  State<Prices_tab> createState() => _Prices_tabState();
}

class _Prices_tabState extends State<Prices_tab> {
  String coinname = "Bitcoin";
  String dollarval = "43,000";
  String shortform = "BTC";
  String percentchange = "1.55";
  String balance = "0.09665";
  List<dynamic> coinListData = [];

  List<mycoinapi> coinsarray = [];

  Future<List<mycoinapi>> fetch_coin() async {
    var _url = Apis.fetch_coin_api;
    http.Response response = await http.get(
      Uri.parse(_url),

      //  headers: {"Authorization": "Bearer " + prefs.getString('token')!}
    );
    print(response.body);
    if (response.statusCode == 200) {
      List<dynamic> values = [];
      print("this is for values");
      values = json.decode(response.body);
      // print(coinsarray.first);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            coinsarray.add(mycoinapi.fromJson(map));
          }
        }
      }
      setState(() {});
      return coinsarray;
    } else {
      throw Exception("failed to load coins");
    }
  }

  List coins_data = [];

  Future getallcoins() async {
    if (true) {
      var _url = "https://api.coingecko.com/api/v3/coins/";
      http.Response response = await http.get(Uri.parse(_url));
      print('api has come');
      setState(() {
        coins_data = jsonDecode(response.body);
      });

      //.Map decodedresponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

      print(response.statusCode);

      print(coins_data[0]["image"]["large"].toString());
      return response.body;
    }
  }

  @override
  void initState() {
    getallcoins();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (coins_data.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(100),
        child: CircularProgressIndicator(
          color: ColorConfig.splash,
        ),
      );
    } else {
      return Container(
          child: Column(
        children: [
          coinpricescontainer(
              coinname: "Krypto",
              dollarval: "9",
              shortform: "KPT",
              percentchange: "9",
              image: "https://bvertexcare.com/logo_ios.png"),
          ...List.generate(
            coins_data.length,
            (index) => coinpricescontainer(
              coinname: coins_data[index]["name"].toString(),
              dollarval: coins_data[index]["market_data"]["current_price"]
                      ["usd"]
                  .toString(),
              shortform: coins_data[index]["symbol"].toUpperCase(),
              percentchange: coins_data[index]["market_data"]
                      ["price_change_percentage_24h"]
                  .toString(),
              image: coins_data[index]["image"]["large"].toString(),
            ),
          )
        ],
      ));
    }
  }
}

class mycoinapi {
  mycoinapi({
    required this.name,
    required this.symbol,
    required this.rank,
    required this.imageUrl,
    required this.price,
    required this.change,
    required this.changePercentage,
  });
  final String name;
  final String symbol;
  final num rank;
  final String imageUrl;
  final num price;
  final num change;
  final num changePercentage;

  factory mycoinapi.fromJson(Map<String, dynamic> json) {
    return mycoinapi(
      name: json['name'],
      symbol: json['symbol'],
      rank: json['market_cap_rank'],
      imageUrl: json['image'],
      price: json['current_price'],
      change: json['price_change_24h'],
      changePercentage: json['price_change_percentage_24h'],
    );
  }
  // List<mycoinapi> myarray = [];

}
