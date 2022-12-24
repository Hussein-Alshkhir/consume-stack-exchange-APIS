import 'package:json_annotation/json_annotation.dart';
part 'question.g.dart';

@JsonSerializable(explicitToJson: true)
class Question{
  final bool? is_answered;
  final int? view_count;
  final int? answer_count;
  final int? score;
  final int? last_activity_date;
  final int? creation_date;
  final int? question_id;
  final String? content_license;
  final String? link;
  final String? title;
  final QuestionOwner? owner;

  Question(
      this.is_answered,
      this.view_count,
      this.answer_count,
      this.score,
      this.last_activity_date,
      this.creation_date,
      this.question_id,
      this.content_license,
      this.link,
      this.title,
      this.owner);

  factory Question.fromJson(Map <String, dynamic> json) => _$QuestionFromJson(json);

}

@JsonSerializable(explicitToJson: true)
class QuestionOwner{
  final int? account_id;
  final int? reputation;
  final int? user_id;
  final String? user_type;
  final String? profile_image;
  final String? display_name;
  final String? link;

  QuestionOwner(this.account_id, this.reputation, this.user_id, this.user_type,
      this.profile_image, this.display_name, this.link);

  factory QuestionOwner.fromJson(Map <String, dynamic> json) => _$QuestionOwnerFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionOwnerToJson(this);

}