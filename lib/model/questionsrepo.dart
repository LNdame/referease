import 'question.dart';


class QuestionRepository{

  static List<Question> loadQuestions(QuestionType quesType){

    const allQuestions =<Question>[
      //reflection
      Question(
        id: 1,
        questionDesc: "Carefully read through the text you have selected. Read again. "
            "Why did the author write the text? What did the writer hope to share with the reader?",
        questionType: QuestionType.reflect,
      ),
      Question(
        id: 2,
        questionDesc: "What details does the author provide about who they are, and what is their capacity or the context from which they write? How do you think who they are and what they do influenced this text?",
        questionType: QuestionType.reflect,
      ),
      Question(
        id: 3,
        questionDesc: "Which audience did the author have in mind when writing the text? Who was speaking, and who would, or should, be listening?",
        questionType: QuestionType.reflect,
      ),
      Question(
        id: 4,
        questionDesc: "Look at the source (the place of publication) and the date of the text. What does this reveal about the original context and audience? What else happened at the time of writing the text that may have influenced the writing thereof?",
        questionType: QuestionType.reflect,
      ),
      Question(
        id: 5,
        questionDesc: "What are the main points in the text?",
        questionType: QuestionType.reflect,
      ),
      Question(
        id: 6,
        questionDesc: "How do the main points impact on your own views, either on the subject itself or the issues raised? Explain.",
        questionType: QuestionType.reflect,
      ),
      Question(
        id: 7,
        questionDesc: "What struck you, reading the text? Something you feel the author emphasised to much, or perhaps did not emphasise? What could the writer have done differently, have left out or even added?",
        questionType: QuestionType.reflect,
      ),
      Question(
        id: 8,
        questionDesc: "In two sentences: If you were required to write a piece about this same topic today, how would you construct and write it?",
        questionType: QuestionType.reflect,
      ),
///discussion

      ///
      Question(
        id: 1,
        questionDesc: "What is the main purpose of the full text? Why was it written, by whom, and for whom?",
        questionType: QuestionType.discuss,
      ),
      Question(
        id: 2,
        questionDesc: "What are the main aims of the text? List and describe the elements.",
        questionType: QuestionType.discuss,
      ),
      Question(
        id: 3,
        questionDesc: "Which theoretical arguments or theories are used to provide a critical academic discussion?",
        questionType: QuestionType.discuss,
      ),
      Question(
        id: 4,
        questionDesc: "How do theories used in the text support the research into the topic?",
        questionType: QuestionType.discuss,
      ),
      Question(
        id: 5,
        questionDesc: "What research methodology has been employed to gather data and information?",
        questionType: QuestionType.discuss,
      ),
      Question(
        id: 6,
        questionDesc: "How was the research collected? Provide details.",
        questionType: QuestionType.discuss,
      ),
      Question(
        id: 7,
        questionDesc: "What were the main findings of the data collection process?",
        questionType: QuestionType.discuss,
      ),
      Question(
        id: 8,
        questionDesc: "What research challenges are listed?",
        questionType: QuestionType.discuss,
      ),
      Question(
        id: 9,
        questionDesc: "What are the ‘gaps’ in the research?",
        questionType: QuestionType.discuss,
      ),
      Question(
        id: 10,
        questionDesc: "What are the main recommendations emerging from the research?",
        questionType: QuestionType.discuss,
      ),
      Question(
        id: 11,
        questionDesc: "What opportunities for further investigation emerge from the research?",
        questionType: QuestionType.discuss,
      ),
      Question(
        id: 12,
        questionDesc: "In conclusion, add two sentences as an overall summary of this text",
        questionType: QuestionType.discuss,
      ),

    ];

        if(quesType== QuestionType.all){
          return allQuestions;
        }else{
          return allQuestions.where((Question q){
             return q.questionType == quesType;
          }).toList();
        }
  }
}