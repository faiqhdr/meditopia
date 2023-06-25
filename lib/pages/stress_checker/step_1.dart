import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import '../../size_config.dart';
import '../../style/style.dart';
import 'step_2.dart';

class StressLevelChecker extends StatelessWidget {
  const StressLevelChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal! * 17,
            ),
            child: Column(
              children: const [
                // Header Area.
                Header(),
                // Questionnaire Area.
                Questionnaire(),
                // Next Button.
                NextButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical! * 3,
        bottom: 16.0,
      ),
      subtitle: const Padding(
        padding: EdgeInsets.only(
          bottom: 7,
          top: 7,
        ),
        child: Text(
          "Stress Level Checker",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 27,
            color: Color(0xff0e1012),
          ),
        ),
      ),
      trailing: SizedBox(
        height: 30,
        width: 30,
        child: SvgPicture.asset(
          AppStyle.checkListIcon,
        ),
      ),
    );
  }
}

class Questionnaire extends StatelessWidget {
  const Questionnaire({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Question 1
        Question(
          question: "How often do you feel stressed?",
          choices: ["Rarely", "Sometimes", "Often", "Always"],
        ),
        // Question 2
        Question(
          question: "What are the main causes of your stress?",
          choices: ["Work", "Relationships", "Health", "Finances"],
        ),
        // Question 3
        Question(
          question: "How does stress affect your daily life?",
          choices: [
            "Difficulty sleeping",
            "Loss of appetite",
            "Mood swings",
            "Difficulty concentrating"
          ],
        ),
        // Question 4
        Question(
          question: "What coping mechanisms do you use to manage stress?",
          choices: [
            "Exercise",
            "Meditation",
            "Talking to friends/family",
            "Listening to music"
          ],
        ),
      ],
    );
  }
}

class Question extends StatefulWidget {
  final String question;
  final List<String> choices;

  const Question({Key? key, required this.question, required this.choices})
      : super(key: key);

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  String? selectedChoice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.question,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.0),
          Column(
            children: widget.choices.map((choice) {
              return RadioListTile<String>(
                title: Text(choice),
                value: choice,
                groupValue: selectedChoice,
                onChanged: (value) {
                  setState(() {
                    selectedChoice = value;
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: () {
          // Perform actions when the next button is pressed.
          // Navigate to the result screen or perform data processing.
          // Pass the selected choices to the result screen.
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StressLevelCheckerResult(
                stressLevel: "Often",
                mainCauses: "Work",
                impactOnDailyLife: "Difficulty sleeping",
                copingMechanisms: "Exercise",
              ),
            ),
          );
        },
        child: const Text("Next"),
      ),
    );
  }
}
