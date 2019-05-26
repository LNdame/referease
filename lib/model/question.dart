
enum QuestionType{all, reflect, discuss}

class Question{

  final int id;

  final String questionDesc;
  final QuestionType questionType;

 const Question({this.id, this.questionDesc, this.questionType}):assert(id !=null),

        assert(questionDesc !=null),
        assert(questionType !=null)
        ;


  @override
  String toString() =>"$questionDesc";
}