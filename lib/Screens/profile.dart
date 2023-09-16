import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart' as http;

class Screening {
  final String date;
  final String result;
  final String riskLevel;

  Screening({
    required this.date,
    required this.result,
    required this.riskLevel,
  });
}

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  // Simulated user data for demonstration purposes
  final String userName = "Akshay Potkhule";

  final String userEmail = "Akshaypotkhule123@example.com";
  final List<Screening> screeningHistory = [
    Screening(date: "2023-01-15", result: "Normal", riskLevel: "Low"),
    Screening(
        date: "2023-02-22", result: "Mild anxiety", riskLevel: "Moderate"),
    // Add more screening entries as needed
  ];

  bool isscreen = false;
  bool isprogress = false;
  bool isrecommend = false;

  final List<double> mentalHealthProgress = [80, 85, 70, 90, 78, 95];

  Widget recommendation = CircularProgressIndicator();
  Future<String> generateMentalHealthRecommendation() async {
    final apiKey =
        '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'; // Replace with your OpenAI API key
    final apiUrl =
        'https://api.openai.com/v1/chat/completions'; // Use the GPT-3.5 Turbo engine
    final headers = {
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
    };

    final messages = [
      {"role": "system", "content": "You are a helpful assistant."},
      {
        "role": "user",
        "content": "I'm feeling stressed, what can I do to relax?"
      }, // Modify the user's input or prompt
    ];

    final requestBody = json.encode({
      'model': 'gpt-3.5-turbo',
      'messages': messages,
      'max_tokens': 50,
    });

    final response =
        await http.post(Uri.parse(apiUrl), headers: headers, body: requestBody);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final recommendation = data['choices'][0]['message']['content'];
      return recommendation;
    } else {
      print('API Error: ${response.body}');
      throw Exception('Failed to generate recommendation');
    }
  }

  Widget recommend() {
    return FutureBuilder<String>(
      future: generateMentalHealthRecommendation(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Loading indicator
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No recommendations available.');
        } else {
          // Display the generated recommendation
          return Text(snapshot.data!);
        }
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    recommendation = recommend();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                title: Text('Name'),
                subtitle: Text(userName),
                // You can add an "Edit" button to update user information here
              ),
              ListTile(
                title: Text('Email Address'),
                subtitle: Text(userEmail),
                // You can add an "Edit" button to update email here
              ),
              Divider(height: 30),

              // Screening History Section
              TextButton(
                onPressed: (() {
                  setState(() {
                    if (isscreen == true) {
                      isscreen = false;
                    } else {
                      isscreen = true;
                    }
                  });
                }),
                child: Text(
                  'Screening History',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              // Implement a list of past screenings with dates, results, and risk levels
              if (isscreen == true)
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: screeningHistory.length,
                  itemBuilder: (context, index) {
                    final screening = screeningHistory[index];
                    return ListTile(
                      title: Text('Date: ${screening.date}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Result: ${screening.result}'),
                          Text('Risk Level: ${screening.riskLevel}'),
                        ],
                      ),
                    );
                  },
                ),
              // You can use ListView.builder to create a scrollable list

              Divider(height: 30),

              // Progress Tracker Section
              TextButton(
                onPressed: (() {
                  setState(() {
                    if (isprogress == true) {
                      isprogress = false;
                    } else {
                      isprogress = true;
                    }
                  });
                }),
                child: Text(
                  'Progress Tracker',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              if (isprogress == true)
                Container(
                  height: 200,
                  width: 300,
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(show: false),
                      borderData: FlBorderData(show: false),
                      minX: 0,
                      maxX: mentalHealthProgress.length.toDouble() - 1,
                      minY: 0,
                      maxY: 100,
                      lineBarsData: [
                        LineChartBarData(
                          color: Colors.blue,
                          spots: mentalHealthProgress
                              .asMap()
                              .entries
                              .map((entry) =>
                                  FlSpot(entry.key.toDouble(), entry.value))
                              .toList(),
                          isCurved: true,
                          dotData: FlDotData(show: false),
                          belowBarData: BarAreaData(show: false),
                        ),
                      ],
                    ),
                  ),
                ),
              // Implement charts or graphs to display mental health progress
              // You can use packages like 'fl_chart' for charts

              Divider(height: 30),

              // Personalized Recommendations Section
              TextButton(
                onPressed: (() {
                  setState(() {
                    if (isrecommend == true) {
                      isrecommend = false;
                    } else {
                      isrecommend = true;
                    }
                  });
                }),
                child: Text(
                  'Personalized Recommendations',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              // Display personalized recommendations and links to resources
              if(isrecommend==true)
              recommendation,
              // You can use a ListView or other widgets for this section
            ],
          ),
        ),
      ),
    );
  }
}
