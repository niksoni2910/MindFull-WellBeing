// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import 'package:health_app/Screens/result/details.dart';

class ResultsPage extends StatefulWidget {
  final List<String> m;

  const ResultsPage({super.key, required this.m});
  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  List<Map<String, dynamic>> illnessData = [];
  late double s;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    s = double.parse(widget.m[10]);
    illnessData = [
      {'name': 'Somatization', 'percentage': widget.m[0].toString()},
      {'name': 'OCD', 'percentage': widget.m[1].toString()},
      {
        'name': 'Interpersonal Sensitivity',
        'percentage': widget.m[2].toString()
      },
      {'name': 'Depression', 'percentage': widget.m[3].toString()},
      {'name': 'Anxiety', 'percentage': widget.m[4].toString()},
      {'name': 'Hostility', 'percentage': widget.m[5].toString()},
      {'name': 'Phobic Anxiety', 'percentage': widget.m[6].toString()},
      {'name': 'Paranoid Ideation', 'percentage': widget.m[7].toString()},
      {'name': 'Psychoticism', 'percentage': widget.m[8].toString()},
    ];
  }

  Widget buildIllnessIndicators(String name, double percentage, int index) {
    return Column(
      children: [
        SleekCircularSlider(
            appearance: CircularSliderAppearance(
              size: name == "Overall" ? 125 : 100.0,
              startAngle: 180,
              angleRange: 180,
              customColors: CustomSliderColors(
                progressBarColors: [
                  Colors.blue,
                  Colors.blue
                ], // Set the same color for both
              ),
              customWidths: CustomSliderWidths(
                trackWidth: 8.0,
                progressBarWidth: 8.0,
              ),
            ),
            min: 0,
            max: 100,
            initialValue: percentage,
            innerWidget: (percentage) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    textDirection: TextDirection.ltr,
                    children: [
                      Text(
                        '${percentage.toStringAsFixed(1)}%',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        name,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      )
                    ])),
        if (name != 'Overall')
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        index: index,
                      ),
                    ));
              },
              child: Text("Details")),
        SizedBox(
          height: 5,
        )
      ],
    );

    // return CircularPercentIndicator(
    //   footer: Text(name),
    //   curve: Curves.linearToEaseOut,
    //   animation: true,
    //   radius: 60.0,
    //   lineWidth: 8.0,
    //   percent: percentage / 100.0,
    //   center: Text(
    //     '${percentage.toStringAsFixed(1)}%',
    //     style: const TextStyle(fontSize: 16.0),
    //   ),
    //   progressColor: Colors.blue,
    // );
  }

  List<Widget> createList() {
    final List<Widget> rows = [];
    rows.add(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildIllnessIndicators('Overall', s, 0),
      ],
    ));
    for (int i = 0; i < 9; i += 3) {
      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildIllnessIndicators('${illnessData[i]['name']}',
              double.parse(illnessData[i]['percentage']), i),
          buildIllnessIndicators('${illnessData[i + 1]['name']}',
              double.parse(illnessData[i + 1]['percentage']), i + 1),
          buildIllnessIndicators('${illnessData[i + 2]['name']}',
              double.parse(illnessData[i + 2]['percentage']), i + 2)
        ],
      ));
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Assessment Results',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF6BB9F0), // Customize the app bar color
      ),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Color(0xFF6BB9F0)
              ], // Customize the gradient colors
            ),
          ),
        ),
        // Mental Health Icon
        Positioned(
          top: 100,
          left: MediaQuery.of(context).size.width / 2 - 50,
          child: Icon(
            Icons.favorite,
            size: 100,
            color: Colors.white.withOpacity(0.3),
          ),
        ),
        Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 15.0),
                Column(
                  children: createList(),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:pie_chart/pie_chart.dart';

// class ResultsPage extends StatelessWidget {
//   final Map<String, double> dataMap = {
//     "Obsessive Compulsive Disorder": 20,
//     "Interpersonal Sensitivity": 10,
//     "Hostility": 50,
//     "Phobic Anxiety": 10,
//     "Paranoid Ideation": 10,
//     "Psychoticism": 5,
//     "Depression": 3,
//     "Anxiety": 2,
//   };

//   final gradientList = <List<Color>>[
//   [
//     Color.fromRGBO(223, 250, 92, 1),
//     Color.fromRGBO(129, 250, 112, 1),
//   ],
//   [
//     Color.fromRGBO(129, 182, 205, 1),
//     Color.fromRGBO(91, 253, 199, 1),
//   ],
//   [
//     Color.fromRGBO(175, 63, 62, 1.0),
//     Color.fromRGBO(254, 154, 92, 1),
//   ],
//   [
//     Color.fromRGBO(255, 87, 34, 1),
//     Color.fromRGBO(255, 193, 7, 1),
//   ],
//   [
//     Color.fromRGBO(103, 58, 183, 1),
//     Color.fromRGBO(63, 81, 181, 1),
//   ],
//   [
//     Color.fromRGBO(76, 175, 80, 1),
//     Color.fromRGBO(255, 152, 0, 1),
//   ],
//   [
//     Color.fromRGBO(233, 30, 99, 1),
//     Color.fromRGBO(156, 39, 176, 1),
//   ],
//   [
//     Color.fromRGBO(0, 150, 136, 1),
//     Color.fromRGBO(3, 169, 244, 1),
//   ],
// ];

//   ResultsPage({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Results'),
//       ),
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             const Text('Your overall score is 1%', style: TextStyle(fontSize: 24)),
//             const SizedBox(height: 50),
//             PieChart(
//               dataMap: dataMap,
//               totalValue: 100,
//               gradientList: gradientList,
//               animationDuration: const Duration(milliseconds: 800),
//               chartRadius: MediaQuery.of(context).size.width / 2,
//               initialAngleInDegree: 0,
//               chartType: ChartType.disc,
//               ringStrokeWidth: 32,
//               centerText: "Score",
//               legendOptions: const LegendOptions(
//                 showLegends: true,
//                 legendPosition: LegendPosition.bottom,
//                 legendTextStyle: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               chartValuesOptions: const ChartValuesOptions(
//                 showChartValueBackground: true,
//                 showChartValues: true,
//                 showChartValuesInPercentage: false,
//                 showChartValuesOutside: false,
//                 chartValueStyle: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 50),
//             const Text('App version v0.8', style: TextStyle(fontSize: 18)),
//           ],
//         ),
//       ),
//     );
//   }
// }