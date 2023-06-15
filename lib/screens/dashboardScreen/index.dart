import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kripto/config/color.dart';
import 'package:kripto/config/navigator.dart';
import 'package:kripto/config/size.dart';
import 'package:kripto/screens/dashboardScreen/component/demo.dart';
import 'package:kripto/screens/dashboardScreen/component/graph_componets.dart';
import 'package:kripto/screens/dashboardScreen/component/prices_tab.dart';
import 'package:kripto/screens/dashboardScreen/component/see_more.dart';
import 'package:kripto/screens/import_screen.dart/index.dart';

import 'package:kripto/screens/widget/graph.dart';
import 'package:kripto/screens/widget/tokenscontainer.dart';
import 'package:kripto/screens/widget/transaction-button.dart';
import 'package:kripto/utils/style.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String img = "assets/images/icons/up.png";
  List dataimg = [
    {
      "imagedata": "assets/images/icons/up.png",
      "btext": "Send",
    },
    {
      "imagedata": "assets/images/icons/down.png",
      "btext": "Receive",
    },
    {
      "imagedata": "assets/images/icons/label.png",
      "btext": "Buy",
    }
  ];
  String coinname = "Bitcoin";
  String dollarval = "43,000";
  String shortform = "BTC";
  String percentchange = "1.55";
  String balance = "0.09665";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* -------------------------------------------------------------------------- */
      /*                                 for app bar                                */
      /* -------------------------------------------------------------------------- */
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorConfig.statusBarColor,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        backgroundColor: ColorConfig.statusBarColor,
        leading: Container(),
        actions: [
          Container(
            margin: EdgeInsets.only(left: SizeConfig.getPercentageWidth(10)),
            child: Row(
              children: [
                CircleAvatar(
                    child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/splash/man.png"),
                        fit: BoxFit.cover),
                  ),
                ))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: SizeConfig.getPercentageWidth(2)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Good evening,",
                    style: titleStyle(context, false, size: 18)),
                Text("@xystus", style: titleStyle(context, false, size: 18))
              ],
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Center(
            child: Stack(children: [
              Container(
                margin:
                    EdgeInsets.only(right: SizeConfig.getPercentageWidth(6)),
                child: Icon(
                  Icons.notifications,
                  color: ColorConfig.white,
                ),
              ),
              Positioned(
                  left: SizeConfig.getPercentageWidth(3),
                  child: CircleAvatar(
                    radius: SizeConfig.getPercentageWidth(1),
                    backgroundColor: ColorConfig.splash,
                  ))
            ]),
          ),
        ], // toolbarHeight: SizeConfig.getPercentageWidth(16),
      ),

      /* -------------------------------------------------------------------------- */
      /*                        wallet container                                    */
      /* -------------------------------------------------------------------------- */
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(left: SizeConfig.getPercentageWidth(4)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Multi-wallet 1",
                            style: titleStyle(context, false, size: 18)),
                        Icon(
                          Icons.arrow_drop_down_outlined,
                          color: ColorConfig.white,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.getPercentageWidth(4),
                  ),
                  Text("\$0.00", style: titleStyle(context, true, size: 35))
                ],
              ),
              margin: EdgeInsets.only(top: SizeConfig.getPercentageWidth(6)),
              height: SizeConfig.getPercentageWidth(35),
              width: SizeConfig.getPercentageWidth(70),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: ColorConfig.statusBarColor),
            ),
          ),

          /* -------------------------------------------------------------------------- */
          /*                                purple button                               */
          /* -------------------------------------------------------------------------- */
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: (() {
                    print(dataimg[0]["btext"]);
                  }),
                  child: Purplebutton(
                    img: dataimg[0]["imagedata"],
                    text: dataimg[0]["btext"],
                  )),
              GestureDetector(
                  onTap: (() {
                    print(dataimg[1]["imagedata"]);
                  }),
                  child: Purplebutton(
                      img: dataimg[1]["imagedata"], text: dataimg[1]["btext"])),
              GestureDetector(
                  onTap: (() {
                    print(dataimg[2]["imagedata"]);
                  }),
                  child: Purplebutton(
                      img: dataimg[2]["imagedata"], text: dataimg[2]["btext"])),
            ],
          ),
          //analytics
          SizedBox(
            height: SizeConfig.getPercentageWidth(6),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: SizeConfig.getPercentageWidth(7),
            ),
            child: Row(
              children: [
                Text("Analytics", style: titleStyle(context, false, size: 16)),
                Expanded(
                  child: Container(),
                ),
                GestureDetector(
                  onTap: (() {
                    NavConfig.push(context, const SeeMore());
                  }),
                  child: Text("See more",
                      style: titleStyle(context, false,
                          size: 16, color: ColorConfig.brown)),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: ColorConfig.brown,
                  size: 16,
                ),
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.getPercentageWidth(2),
          ),
          // Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       Graph_components(),
          //     ],
          //   ),
          Container(
            width: double.infinity,
            height: SizeConfig.getPercentageWidth(65),
            child: ListView(scrollDirection: Axis.horizontal, children: [
              Demo(),
              Graph_components(),
              Graphcontainer(),
            ]),
          ),
          /* -------------------------------------------------------------------------- */
          /*                                   tabveiw                                  */
          /* -------------------------------------------------------------------------- */
          SizedBox(
            height: SizeConfig.getPercentageWidth(5),
          ),
          Container(
            width: SizeConfig.getPercentageWidth(85),
            height: SizeConfig.getPercentageWidth(75),
            child: ContainedTabBarView(
              tabBarProperties: TabBarProperties(
                height: SizeConfig.getPercentageWidth(10),
                //   indicatorColor: Colors.black,

                //  indicatorWeight: 10.0,
                //  indicator:  ContainerTabIndicator(
                //     radius: BorderRadius.circular(7.0),
                //     color: Colors.blue,
                //     borderWidth: 9.0,
                //     borderColor: Colors.red,
                //   ),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(9),
                    topRight: Radius.circular(9),
                  ),
                  border: Border.all(),
                  color: ColorConfig.tabpurple.withOpacity(0.2),
                ),
                labelColor: ColorConfig.tabcurrentindex,
                unselectedLabelColor: ColorConfig.tabincurrentindex,
              ),
              tabs: [
                Text(
                  'Coin Prices',
                  style: TextStyle(fontSize: 16),
                ),
                Text('Tokens', style: TextStyle(fontSize: 16)),
              ],
              views: [
                /* -------------------------------------------------------------------------- */
                /*                               coin price body                               */
                /* -------------------------------------------------------------------------- */
                Container(
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Prices_tab(),
                      SizedBox(
                        height: SizeConfig.getPercentageWidth(3),
                      ),
                    ]),
                  ),
                ),
                /* -------------------------------------------------------------------------- */
                /*                               token tab body                               */
                /* -------------------------------------------------------------------------- */
                Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: SizeConfig.getPercentageWidth(3),
                        ),
                        Text(
                          'Import Token',
                          style: titleStyle(context, false,
                              size: 16, color: ColorConfig.brown),
                        ),
                        Tokenscontainer(
                            coinname: coinname,
                            shortform: shortform,
                            balance: balance,
                            dollarval: dollarval),
                        Tokenscontainer(
                            coinname: coinname,
                            shortform: shortform,
                            balance: balance,
                            dollarval: dollarval),
                        Tokenscontainer(
                            coinname: coinname,
                            shortform: shortform,
                            balance: balance,
                            dollarval: dollarval),
                        Tokenscontainer(
                            coinname: coinname,
                            shortform: shortform,
                            balance: balance,
                            dollarval: dollarval),
                        Tokenscontainer(
                            coinname: coinname,
                            shortform: shortform,
                            balance: balance,
                            dollarval: dollarval),
                        Tokenscontainer(
                            coinname: coinname,
                            shortform: shortform,
                            balance: balance,
                            dollarval: dollarval),
                        Tokenscontainer(
                            coinname: coinname,
                            shortform: shortform,
                            balance: balance,
                            dollarval: dollarval),
                        SizedBox(
                          height: SizeConfig.getPercentageWidth(3),
                        ),
                      ],
                    ),
                  ),
                )
              ],
              onChange: (index) => print(index),
            ),
          ),
        ]),
      ),
    );
  }
}
