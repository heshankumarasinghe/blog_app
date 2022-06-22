class SinglePollContent {
  final int id;
  final int groupId;
  final String pollTitle;
  final List<String> pollAnswers;
  final int firstAnswerCount;
  final int secondAnswerCount;
  final int thirdAnswerCount;

  SinglePollContent({
    required this.id,
    required this.groupId,
    required this.pollTitle,
    required this.pollAnswers,
    required this.firstAnswerCount,
    required this.secondAnswerCount,
    required this.thirdAnswerCount,
  });

  SinglePollContent.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        groupId = int.parse(json['groupId']),
        pollTitle = json['pollTitle'],
        pollAnswers = List<String>.from(json['answers']),
        firstAnswerCount = int.parse(json['answer1poll']),
        secondAnswerCount = int.parse(json['answer2poll']),
        thirdAnswerCount = int.parse(json['answer2poll']);
}
