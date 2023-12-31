import 'package:flutter/material.dart';

class RemediesPage extends StatefulWidget {
  @override
  _RemediesPageState createState() => _RemediesPageState();
}

class _RemediesPageState extends State<RemediesPage> {
  List<Map<String, dynamic>> illnessData = [
    {
      'name': 'Somatization',
      'remedies': [
        "1. Psychotherapy, such as cognitive-behavioral or psychodynamic therapy, to address underlying emotional issues.",
        "2. Practice mindfulness, meditation, and relaxation techniques to reduce stress and improve mind-body awareness.",
        "3. Engage in regular physical activity and maintain a healthy lifestyle.",
        "4. Medication prescribed by a healthcare professional in some cases.",
        "5. Seek support from support groups and educational resources for coping.",
        "6. Consult with a healthcare provider for personalized guidance."
      ],
    },
    {
      'name': 'OCD',
      'remedies': [
        "1. Cognitive-behavioral therapy (CBT), particularly Exposure and Response Prevention (ERP), to address obsessions and compulsions.",
        "2. Medication, usually selective serotonin reuptake inhibitors (SSRIs) like fluoxetine or sertraline.",
        "3. Deep Brain Stimulation (DBS) for severe, treatment-resistant cases.",
        "4. Consult a mental health professional for accurate diagnosis and personalized treatment."
      ],
    },
    {
      'name': 'Interpersonal Sensitivity',
      'remedies': [
        "1. Cognitive-behavioral therapy (CBT) to identify and challenge negative thought patterns and develop healthier ways of interacting with others.",
        "2. Interpersonal therapy (IPT) to improve interpersonal relationships and communication skills.",
        "3. Mindfulness and emotional regulation techniques.",
        "4. Assertiveness training to express needs and boundaries effectively.",
        "5. Build social support networks and seek guidance from a mental health professional.",
      ],
    },
    {
      'name': 'Depression',
      'remedies': [
        "1. Psychotherapy, such as cognitive-behavioral therapy (CBT) or interpersonal therapy (IPT), to address negative thought patterns and improve coping strategies.",
        "2. Medication, including selective serotonin reuptake inhibitors (SSRIs) or other antidepressants.",
        "3. Lifestyle modifications, such as regular exercise, a balanced diet, sufficient sleep, and stress management.",
        "4. Build a strong support system through social connections and support groups.",
        "5. Consult with a healthcare professional for a personalized treatment plan and ongoing monitoring of progress."
      ],
    },
    {
      'name': 'Anxiety',
      'remedies': [
        "1. Cognitive-behavioral therapy (CBT) to identify and challenge anxious thought patterns and develop coping strategies.",
        "2. Medications like selective serotonin reuptake inhibitors (SSRIs) or benzodiazepines in some cases.",
        "3. Relaxation techniques such as deep breathing, mindfulness meditation, and progressive muscle relaxation.",
        "4. Lifestyle modifications including regular exercise, a balanced diet, adequate sleep, and stress management.",
        "5. Seek support from a mental health professional and consider support groups for guidance and community."
      ],
    },
    {
      'name': 'Hostility',
      'remedies': [
        "1. Cognitive-behavioral therapy (CBT) to understand and modify thought patterns that contribute to hostile behavior.",
        "2. Anger management therapy to recognize and manage anger through techniques like deep breathing and problem-solving.",
        "3. Develop healthy coping mechanisms, such as mindfulness meditation and physical exercise.",
        "4. Address underlying issues through therapy, like past trauma or unresolved conflicts.",
        "5. Consult with a mental health professional for a tailored treatment plan."
      ],
    },
    {
      'name': 'Phobic Anxiety',
      'remedies': [
        "1. Exposure therapy to gradually expose individuals to the feared object or situation in a controlled and safe manner.",
        "2. Cognitive-behavioral strategies to identify and challenge irrational thoughts and beliefs associated with the phobia.",
        "3. Medications generally not the first-line treatment but may be prescribed for short-term relief.",
        "4. Seek guidance from a mental health professional for personalized treatment."
      ],
    },
    {
      'name': 'Paranoid Ideation',
      'remedies': [
        "1. Cognitive-behavioral therapy (CBT) to identify and challenge irrational or exaggerated paranoid thoughts.",
        "2. Medications such as antipsychotics or mood stabilizers for severe symptoms.",
        "3. Create a supportive and nonjudgmental social network.",
        "4. Reduce stress through relaxation techniques, exercise, and a healthy lifestyle.",
        "5. Consult with a mental health specialist for a tailored treatment plan."
      ],
    },
    {
      'name': 'Psychoticism',
      'remedies': [
        "1. Antipsychotic medications prescribed by a healthcare provider for severe symptoms.",
        "2. Psychotherapy, particularly cognitive-behavioral therapy for psychosis (CBTp), to manage distressing beliefs and improve coping strategies.",
        "3. Build a strong support system with family and friends.",
        "4. Maintain a stable daily routine, avoid substance abuse, and manage stress through relaxation techniques.",
        "5. Regular follow-up with a mental health specialist to monitor progress."
      ],
    },
  ];

  String selectedIllness = "Somatization"; // Default selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Remedies Page'),
      // ),
      body: Container(
        decoration: BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage("assets/main-bg.jpg"),
            //   fit: BoxFit.cover,
            // ),
            // ),
            gradient:
                LinearGradient(colors: [Colors.lightBlue, Colors.purple])),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              DropdownButton<String>(
                dropdownColor: Colors.purple,
                borderRadius: BorderRadius.circular(10),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 133, 195, 223)),
                value: selectedIllness,
                items: illnessData
                    .map<DropdownMenuItem<String>>(
                      (data) => DropdownMenuItem<String>(
                        value: data['name'],
                        child: Text(data['name']),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedIllness = value!;
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                'Remedies for $selectedIllness',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 133, 195, 223),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: illnessData
                        .where((data) => data['name'] == selectedIllness)
                        .map<Widget>(
                          (data) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: data['remedies']
                                .map<Widget>(
                                  (remedy) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Card(
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          // boxShadow: [
                                          //   BoxShadow(
                                          //       spreadRadius: 10,
                                          //       color: Colors.lightBlue)
                                          // ],
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          // gradient: LinearGradient(colors: [Colors.lightBlue, Colors.purple])
                                          color: const Color.fromARGB(
                                              255, 133, 195, 223),
                                        ),
                                        child: ListTile(
                                          leading: Icon(
                                            Icons.check_circle,
                                            color: Colors.green,
                                          ),
                                          title: Text(
                                            remedy,
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}