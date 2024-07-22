import 'package:flutter/material.dart';
import 'package:history_trade/src/components/widgets/buttons/custom_button.dart';
import 'package:history_trade/src/components/container/custom_container_bagraound_color.dart';
import 'package:history_trade/src/presemtation/adding_data/create_user/create_user.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class QuestionnaireScreen extends StatefulWidget {
  const QuestionnaireScreen({super.key});

  @override
  State<QuestionnaireScreen> createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  double currentPage = 0;
  final PageController _controller = PageController();
  List<int> selectedAnswers =
      List.filled(7, -1); 

  @override
  Widget build(BuildContext context) {
    return CustomContainerBagraoundColor(
      body: Column(
        children: [
          SizedBox(
            height: 86.1.h,
            width: double.infinity,
            child: PageView.builder(
              controller: _controller,
              itemCount: 7,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index.toDouble();
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 55.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/questionnaire${index + 1}.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(65),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 30),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          heightFactor: 0.1,
                          child: Text(
                            QuestionsText.question[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 21),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AnswerButton(
                            text: QuestionsText.answersA[index],
                            isSelected: selectedAnswers[index] == 0,
                            onPressed: () {
                              setState(() {
                                selectedAnswers[index] = 0;
                              });
                            },
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          AnswerButton(
                            text: QuestionsText.answersB[index],
                            isSelected: selectedAnswers[index] == 1,
                            onPressed: () {
                              setState(() {
                                selectedAnswers[index] = 1;
                              });
                            },
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          AnswerButton(
                            text: QuestionsText.answersC[index],
                            isSelected: selectedAnswers[index] == 2,
                            onPressed: () {
                              setState(() {
                                selectedAnswers[index] = 2;
                              });
                            },
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          AnswerButton(
                            text: QuestionsText.answersD[index],
                            isSelected: selectedAnswers[index] == 3,
                            onPressed: () {
                              setState(() {
                                selectedAnswers[index] = 3;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Center(
            child: CustomButton(
              height: 4.1.h,
              width: 40.w,
              onPressed: () {
                if (currentPage == 6) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateUser(),
                    ),
                  );
                } else {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                }
              },
              text: Center(
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnswerButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  const AnswerButton(
      {required this.text,
      required this.isSelected,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isSelected ? const Color(0xFF474B95) : const Color(0xFFC5D4F1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(vertical: 1.5.h),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF858585),
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class QuestionsText {
  static final question = <String>[
    'What type of startup do you run?',
    'How long has your startup been in operation?',
    'How often do you use mobile applications to manage your startup?',
    'What features are most important to you in a business management mobile app?',
    'What is your primary challenge when using mobile applications for your startup?',
    'How do you prefer to receive support for mobile applications?',
    'What are your main goals for using a mobile app in your startup?',
  ];

  static final answersA = <String>[
    'Technology startup',
    'Less than 1 year',
    'Daily',
    'Project management',
    'Ease of use',
    'In-app chat support',
    'Improving efficiency',
  ];

  static final answersB = <String>[
    'Social enterprise',
    '1-2 years',
    'Weekly',
    'Team collaboration',
    'Integration with other tools',
    'Email support',
    'Increasing team productivity',
  ];

  static final answersC = <String>[
    'Environmental startup',
    '3-5 years',
    'Monthly',
    'Financial tracking',
    'Data security',
    'Phone support',
    'Enhancing customer engagement',
  ];

  static final answersD = <String>[
    'Cultural/creative startup',
    'More than 5 years',
    'Rarely or never',
    'Customer relationship management',
    'Cost',
    'Online help resources (e.g., FAQs, tutorials)',
    'Streamlining financial management',
  ];
}
