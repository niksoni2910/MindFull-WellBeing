import 'dart:convert';

import 'package:http/http.dart' as http;

import 'workout.dart';
// const unirest = require('unirest');

// const req = unirest('GET', 'https://exercises-by-api-ninjas.p.rapidapi.com/v1/exercises');

// req.query({
// 	type: 'cardio',
// 	difficulty: 'beginner'
// });

// req.headers({
// 'X-RapidAPI-Key': '6379ceae4dmshf8b2bda689a4f8cp1f6fe5jsn934c7d3a3746',
// 'X-RapidAPI-Host': 'exercises-by-api-ninjas.p.rapidapi.com'
// });

// req.end(function (res) {
// 	if (res.error) throw new Error(res.error);

// 	console.log(res.body);
// });

import 'package:health_app/Screens/workout.dart';

class WorkoutApi {
  static Future<List<Workout>> getWorkout() async {
    var uri = Uri.https('https://exercises-by-api-ninjas.p.rapidapi.com',
        '/v1/exercises', {'type': 'cardio', 'difficulty': 'beginner'});
    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': '6379ceae4dmshf8b2bda689a4f8cp1f6fe5jsn934c7d3a3746',
      'X-RapidAPI-Host': 'exercises-by-api-ninjas.p.rapidapi.com'
    });
    print(response.body);
    Map data = jsonDecode(response.body);
    List temp = [];
    for (var i in data['name']) {
      temp.add(i);
    }
    return Workout.workoutFromSnapshot(temp);
  }
}
