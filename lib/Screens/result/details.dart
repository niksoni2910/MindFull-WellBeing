import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final int index;
  const DetailScreen({super.key, required this.index});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<Map<String, dynamic>> illnessData = [
    {
      'name': 'Somatization',
      'details':
          'Somatization is the expression of psychological or emotional factors as physical (somatic) symptoms. For example, stress can cause some people to develop headaches, chest pain, back pain, nausea or fatigue.',
      'remedies':
          "Remedies for somatization involve a multifaceted approach. Psychotherapy, such as cognitive-behavioral or psychodynamic therapy, helps address underlying emotional issues. Practicing mindfulness, meditation, and relaxation techniques can reduce stress and improve mind-body awareness. Regular physical activity, a healthy lifestyle, and stress management techniques contribute to overall well-being. Medication may be prescribed by a healthcare professional in some cases. Support from support groups and educational resources can also aid in coping with somatization. Consulting with a healthcare provider is essential for tailoring these remedies to an individual's specific needs."
    },
    {
      'name': 'OCD',
      'details':
          'OCD is a mental health disorder characterized by uncontrollable, recurring thoughts (obsessions) and repetitive behaviors or rituals (compulsions) that are performed to alleviate anxiety. It can interfere with daily life and relationships, but can be treated with therapy and medication.',
      'remedies': "Remedies for Obsessive-Compulsive Disorder (OCD) typically encompass a combination of cognitive-behavioral therapy (CBT), particularly Exposure and Response Prevention (ERP), and medication, usually selective serotonin reuptake inhibitors (SSRIs) like fluoxetine or sertraline. CBT helps individuals address the root causes of obsessions and compulsions, while SSRIs can alleviate symptoms. Deep Brain Stimulation (DBS) may be considered for severe, treatment-resistant cases, but it's a specialized intervention. It's crucial to consult a mental health professional for an accurate diagnosis and personalized treatment plan tailored to your specific needs."
    },
    {
      'name': 'Interpersonal Sensitivity',
      'details':
          "Interpersonal Sensitivity refers to the ability to perceive and understand other people's emotions, thoughts, and behaviors in social interactions. It involves being empathetic, attentive, and responsive to others, and is important for building positive relationships and effective communication.",
      'remedies': "Remedies for interpersonal sensitivity often involve a combination of psychotherapy and self-help strategies. Cognitive-behavioral therapy (CBT) can help individuals identify and challenge negative thought patterns and develop healthier ways of perceiving and interacting with others. Interpersonal therapy (IPT) is another therapeutic approach focused on improving interpersonal relationships and communication skills. Self-help strategies may include mindfulness and emotional regulation techniques to manage heightened sensitivity, as well as assertiveness training to express needs and boundaries effectively. Building social support networks and seeking guidance from a mental health professional for tailored interventions can also be beneficial in addressing interpersonal sensitivity."
    },
    {
      'name': 'Depression',
      'details':
          "Depression is a mental health disorder characterized by persistent feelings of sadness, hopelessness, and disinterest in activities that were once enjoyable. It can impact a person's thoughts, behaviors, and physical health, but can be treated with therapy, medication, and lifestyle changes.",
      'remedies': "Remedies for depression often involve a multifaceted approach. Psychotherapy, such as cognitive-behavioral therapy (CBT) or interpersonal therapy (IPT), can help individuals address negative thought patterns and improve coping strategies. Medication, including selective serotonin reuptake inhibitors (SSRIs) or other antidepressants, may be prescribed by a healthcare provider to alleviate symptoms. Lifestyle modifications, such as regular exercise, a balanced diet, sufficient sleep, and stress management, are essential for overall well-being. Building a strong support system through social connections and support groups can also be beneficial. It's crucial to consult with a healthcare professional for a personalized treatment plan and ongoing monitoring of progress in managing depression"
    },
    {
      'name': 'Anxiety',
      'details':
          'Anxiety is a mental health disorder characterized by excessive and persistent worry, fear, and unease that can interfere with daily activities and relationships. It can be treated with therapy, medication, and relaxation techniques.',
      'remedies': "Remedies for anxiety typically include a combination of approaches. Cognitive-behavioral therapy (CBT) is a widely used psychotherapy that helps individuals identify and challenge anxious thought patterns and develop coping strategies. Medications like selective serotonin reuptake inhibitors (SSRIs) or benzodiazepines may be prescribed by a healthcare provider in certain cases. Relaxation techniques such as deep breathing, mindfulness meditation, and progressive muscle relaxation can help manage acute anxiety symptoms. Lifestyle modifications, including regular exercise, a balanced diet, adequate sleep, and stress management, are crucial. Additionally, seeking support from a mental health professional and considering support groups can provide valuable guidance and a sense of community. Tailored treatment plans are essential, so consulting with a healthcare provider is recommended to determine the most appropriate remedies for specific anxiety disorders."
    },
    {
      'name': 'Phobic Anxiety',
      'details':
          'Phobic anxiety is a type of anxiety disorder characterized by an excessive and persistent fear of a specific object, situation, or activity. It can lead to avoidance behaviors, interfere with daily life, but can be treated with therapy and medication',
      'remedies': "Remedies for specific phobias often involve exposure therapy and cognitive-behavioral techniques. Exposure therapy gradually exposes individuals to the feared object or situation in a controlled and safe manner, helping them confront and reduce their anxiety response over time. Cognitive-behavioral strategies focus on identifying and challenging irrational thoughts and beliefs associated with the phobia. Medications are generally not the first-line treatment for specific phobias, but in some cases, a healthcare provider may prescribe anti-anxiety medication for short-term relief. Seeking the guidance of a mental health professional trained in phobia treatment is crucial for developing a personalized and effective plan to address specific phobic anxieties."
    },
    {
      'name': 'Paranoid Ideation',
      'details':
          'Paranoid ideation is a type of thought pattern characterized by an excessive and irrational suspicion or mistrust of others, their motives, or their intentions. It can be a symptom of various mental health disorders, and may require therapy or medication for treatment.',
      'remedies': "remedies for paranoid ideation typically involve a combination of psychotherapy, medication, and lifestyle adjustments. Cognitive-behavioral therapy (CBT) can help individuals identify and challenge irrational or exaggerated paranoid thoughts, replacing them with more balanced thinking patterns. Medications such as antipsychotics or mood stabilizers may be prescribed by a mental health professional to alleviate severe or persistent symptoms. Creating a supportive and nonjudgmental social network can reduce feelings of isolation and paranoia. Reducing stress through relaxation techniques, exercise, and a healthy lifestyle can also be beneficial. It's essential to consult with a mental health specialist for a thorough assessment and tailored treatment plan for paranoid ideation."
    },
    {
      'name': 'Hostility',
      'details':
          'Hostility is a psychological state characterized by a negative attitude, anger, aggression, and a tendency to respond aggressively to stimuli. It can lead to physical and emotional harm, and may be a symptom of other underlying mental health disorders.',
      'remedies': "Remedies for managing hostility typically involve psychotherapy, anger management techniques, and lifestyle changes. Cognitive-behavioral therapy (CBT) can help individuals understand and modify thought patterns that contribute to hostile behavior, promoting more constructive responses to triggers. Anger management therapy teaches techniques for recognizing and managing anger, including deep breathing, problem-solving, and assertiveness skills. Developing healthy coping mechanisms, such as mindfulness meditation and physical exercise, can reduce overall irritability and hostility. Additionally, addressing underlying issues through therapy, like past trauma or unresolved conflicts, can be instrumental in managing hostile tendencies. Consulting with a mental health professional is essential to tailor a treatment plan to the specific causes and manifestations of hostility in an individual's life."
    },
    {
      'name': 'Psychoticism',
      'details':
          'Psychoticism is a personality trait characterized by a lack of empathy, impulsivity, aggression, and a tendency towards unconventional beliefs and behaviors. It can be a symptom of certain mental health disorders, and may require therapy or medication for treatment.',
      'remedies': "remedies for psychoticism, which often involves symptoms like hallucinations, delusions, and disorganized thinking, typically require a comprehensive approach. Antipsychotic medications prescribed by a healthcare provider can help alleviate the most severe symptoms. Psychotherapy, particularly cognitive-behavioral therapy for psychosis (CBTp), can aid in managing distressing beliefs and improving coping strategies. Building a strong support system with family and friends is essential for ongoing assistance and monitoring. Maintaining a stable daily routine, avoiding substance abuse, and managing stress through relaxation techniques and a structured lifestyle can also contribute to symptom management. Regular follow-up with a mental health specialist is crucial to monitor progress and adjust treatment as needed for psychoticism."
    },
  ];
  AppBar _buildAppBar() {
  return AppBar(
    leading: IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    title: Text("Details"),
  );
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/main-bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Card(
        margin: EdgeInsets.all(16.0),
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Details",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 12.0),
              Text(
                illnessData[widget.index]['details'],
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24.0),
              Text(
                "Remedies",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 12.0),
              Text(
                illnessData[widget.index]['remedies'],
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
}
