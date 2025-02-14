// phq9_model.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_coach/const/color_is.dart';
import 'package:health_coach/pages/situation_test/test_result.dart';

class PHQ9Question {
  final String question;
  final int questionNumber;
  int? selectedScore; // 0-3 based on user selection

  PHQ9Question({
    required this.question,
    required this.questionNumber,
    this.selectedScore,
  });
}

class PHQ9QuestionProvider extends ChangeNotifier {
  final List<PHQ9Question> questions = [
    PHQ9Question(
      questionNumber: 1,
      question: "Little interest or pleasure in doing things",
    ),
    PHQ9Question(
      questionNumber: 2,
      question: "Feeling down, depressed, or hopeless",
    ),
    PHQ9Question(
      questionNumber: 3,
      question: "Trouble falling or staying asleep, or sleeping too much",
    ),
    PHQ9Question(
      questionNumber: 4,
      question: "Feeling tired or having little energy",
    ),
    PHQ9Question(
      questionNumber: 5,
      question: "Poor appetite or overeating",
    ),
    PHQ9Question(
      questionNumber: 6,
      question:
          "Feeling bad about yourself or that you are a failure or have let yourself or your family down",
    ),
    PHQ9Question(
      questionNumber: 7,
      question:
          "Trouble concentrating on things, such as reading the newspaper or watching television",
    ),
    PHQ9Question(
      questionNumber: 8,
      question:
          "Moving or speaking so slowly that other people could have noticed. Or the opposite — being so fidgety or restless that you have been moving around a lot more than usual",
    ),
    PHQ9Question(
      questionNumber: 9,
      question:
          "Thoughts that you would be better off dead, or of hurting yourself",
    ),
  ];

  int _currentQuestionIndex = 0;

  PHQ9Question get currentQuestion => questions[_currentQuestionIndex];

  bool get isLastQuestion => _currentQuestionIndex == questions.length - 1;

  void setAnswer(int score) {
    questions[_currentQuestionIndex].selectedScore = score;
    notifyListeners();
  }

  void nextQuestion() {
    if (_currentQuestionIndex < questions.length - 1) {
      _currentQuestionIndex++;
      notifyListeners();
    }
  }

  int calculateTotalScore() {
    return questions.fold(
        0, (sum, question) => sum + (question.selectedScore ?? 0));
  }

  String getDepressionSeverity() {
    final score = calculateTotalScore();
    if (score <= 4) return "Minimal depression";
    if (score <= 9) return "Mild depression";
    if (score <= 14) return "Moderate depression";
    if (score <= 19) return "Moderately severe depression";
    return "Severe depression";
  }

  String getSuggestion() {
    final severity = getDepressionSeverity();
    switch (severity) {
      case "Minimal depression":
        return "Practice self-care and maintain healthy habits. Monitor your mood and seek support if symptoms worsen.";
      case "Mild depression":
        return "Consider talking to a mental health professional. Focus on self-care, exercise, and maintaining social connections.";
      case "Moderate depression":
        return "Schedule an appointment with a mental health professional. Consider therapy and lifestyle changes to manage symptoms.";
      case "Moderately severe depression":
        return "Seek professional help promptly. Consider both therapy and medication. Maintain strong support systems.";
      case "Severe depression":
        return "Immediate professional intervention is recommended. Contact a mental health provider or crisis helpline for support.";
      default:
        return "Please consult with our mental health professional for personalized advice.";
    }
  }
}

class SituationTest extends StatefulWidget {
  final PHQ9QuestionProvider questionProvider;

  const SituationTest({super.key, required this.questionProvider});

  @override
  State<SituationTest> createState() => _SituationTestState();
}

class _SituationTestState extends State<SituationTest> {
  int? selectedOption;

  void _selectOption(int value) {
    setState(() {
      selectedOption = value;
    });
  }

  void _handleNext() {
    if (selectedOption != null) {
      widget.questionProvider.setAnswer(selectedOption!);

      if (widget.questionProvider.isLastQuestion) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TestResult(
              score: widget.questionProvider.calculateTotalScore().toDouble(),
              severity: widget.questionProvider.getDepressionSeverity(),
              suggestion: widget.questionProvider.getSuggestion(),
            ),
          ),
        );
      } else {
        widget.questionProvider.nextQuestion();
        setState(() {
          selectedOption = null; // Reset selection for next question
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Coloris.backgroundColor,
      ),
      backgroundColor: Coloris.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25.h),
            Center(
              child: Image.asset(
                "assets/logo/text_logo.png",
                width: 200.w,
              ),
            ),
            const SizedBox(height: 15.0),
            Text(
              "Question: ${widget.questionProvider.currentQuestion.questionNumber}/9",
            ),
            SizedBox(height: 25.h),
            Container(
              width: double.infinity,
              height: 175.h,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.5,
                  color: Coloris.liteGreen,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    widget.questionProvider.currentQuestion.question,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                      color: Coloris.text,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25.h),
            CheckOption(
              text: "Not at all",
              isSelected: selectedOption == 0,
              onTap: () => _selectOption(0),
            ),
            SizedBox(height: 15.h),
            CheckOption(
              text: "Several days",
              isSelected: selectedOption == 1,
              onTap: () => _selectOption(1),
            ),
            SizedBox(height: 15.h),
            CheckOption(
              text: "More than half the days",
              isSelected: selectedOption == 2,
              onTap: () => _selectOption(2),
            ),
            SizedBox(height: 15.h),
            CheckOption(
              text: "Nearly every day",
              isSelected: selectedOption == 3,
              onTap: () => _selectOption(3),
            ),
            const Spacer(),
            if (selectedOption != null)
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Center(
                  child: ElevatedButton(
                    onPressed: _handleNext,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Coloris.green,
                      foregroundColor: Colors.white,
                      minimumSize: Size(160.w, 45.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      widget.questionProvider.isLastQuestion
                          ? "See Results"
                          : "Next",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class CheckOption extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const CheckOption({
    super.key,
    required this.text,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.5,
            color: isSelected ? Coloris.green : Coloris.liteGreen,
          ),
          color: isSelected ? Coloris.green.withOpacity(0.1) : null,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: isSelected ? Coloris.green : Coloris.text,
            ),
          ),
        ),
      ),
    );
  }
}
