import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MultiLineGraphPage extends StatefulWidget {
  @override
  _MultiLineGraphPageState createState() => _MultiLineGraphPageState();
}

List<String> disease = [
  'Somatization',
  'OCD',
  'Interpersonal Sensitivity',
  'Depression',
  'Anxiety',
  'Phobic Anxiety',
  'Paranoid Ideation',
  'Hostility',
  'Psychoticism'
];

List<double> dumy = [10,20,50,40,70,80,90,20,40,90,10,40];

class _MultiLineGraphPageState extends State<MultiLineGraphPage> {
  List<bool> showLines = [
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
  ]; // Track which lines to show/hide
  List<Color> lineColors = [
    Colors.white,
    Colors.red,
    Colors.green,
    Colors.amber,
    Colors.pink,
    Colors.black,
    Colors.indigo,
    Colors.teal,
    Colors.purple
  ]; // Line colors
  List<List<FlSpot>> lineData = [
    [
      FlSpot(0, dumy[0]),
      FlSpot(0.5, dumy[1]),
      FlSpot(1, dumy[2]),
      FlSpot(1.5, dumy[3]),
      FlSpot(2, dumy[4]),
      FlSpot(2.5, dumy[5]),
      FlSpot(3, dumy[6]),
      FlSpot(3.5, dumy[7]),
      FlSpot(4, dumy[8]),
      FlSpot(4.5, dumy[9]),
      FlSpot(5, dumy[10]),
      FlSpot(5.5, dumy[11]),
    ],
    // [FlSpot(3, 43), FlSpot(1, 81), FlSpot(2, 53), FlSpot(4, 62)],
    // [FlSpot(5.0, 26), FlSpot(1.5, 42), FlSpot(3, 61), FlSpot(3, 23)],
    // [FlSpot(4.5, 25), FlSpot(2, 35), FlSpot(2.5, 15), FlSpot(3.5, 94)],
    // [FlSpot(0.5, 75), FlSpot(2, 33), FlSpot(2.5, 56), FlSpot(3.5, 45)],
    // [FlSpot(0.5, 75), FlSpot(2, 33), FlSpot(2.5, 56), FlSpot(3.5, 45)],
    // [FlSpot(2.5, 1), FlSpot(1.5, 30), FlSpot(2.5, 25), FlSpot(3, 45)],
    // [FlSpot(3, 43), FlSpot(1, 81), FlSpot(2, 53), FlSpot(4, 62)],
    // [FlSpot(5.0, 26), FlSpot(1.5, 42), FlSpot(3, 61), FlSpot(3, 23)],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiline Graph'),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.lightBlue, Colors.purple])),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 300,
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(show: true),
                      titlesData: FlTitlesData(
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        // rightTitles:
                        //     AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            switch (value) {
                              case 0:
                                return Text('Jan');
                              case 0.5:
                                return Text('Feb');
                              case 1:
                                return Text('Mar');
                              case 1.5:
                                return Text('Apr');
                              case 2:
                                return Text('May');
                              case 2.5:
                                return Text('June');
                              case 3:
                                return Text('July');
                              case 3.5:
                                return Text('Aug');
                              case 4:
                                return Text('Sept');
                              case 4.5:
                                return Text('Oct');
                              case 5:
                                return Text('Nov');
                              case 5.5:
                                return Text('Dec');
                              // Add more cases for other months
                              default:
                                return Text('');
                            }
                          },
                        )),
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(
                          color: const Color(0xff37434d),
                          width: 4.5,
                        ),
                      ),
                      minX: 0,
                      maxX: 5.5,
                      minY: 0,
                      maxY: 100,
                      lineBarsData: [
                        for (int i = 0; i < lineData.length; i++)
                          if (showLines[i])
                            LineChartBarData(
                              spots: lineData[i],
                              isCurved: true,
                              color: lineColors[i],
                              dotData: FlDotData(show: false),
                              belowBarData: BarAreaData(show: false),
                            ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int i = 0; i < showLines.length; i++)
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                showLines[i] = !showLines[i];
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  showLines[i] ? lineColors[i] : Colors.grey,
                            ),
                            child: Text(disease[i]),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
