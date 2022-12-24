// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      json['is_answered'] as bool?,
      json['view_count'] as int?,
      json['answer_count'] as int?,
      json['score'] as int?,
      json['last_activity_date'] as int?,
      json['creation_date'] as int?,
      json['question_id'] as int?,
      json['content_license'] as String?,
      json['link'] as String?,
      json['title'] as String?,
      json['owner'] == null
          ? null
          : QuestionOwner.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'is_answered': instance.is_answered,
      'view_count': instance.view_count,
      'answer_count': instance.answer_count,
      'score': instance.score,
      'last_activity_date': instance.last_activity_date,
      'creation_date': instance.creation_date,
      'question_id': instance.question_id,
      'content_license': instance.content_license,
      'link': instance.link,
      'title': instance.title,
      'owner': instance.owner?.toJson(),
    };

QuestionOwner _$QuestionOwnerFromJson(Map<String, dynamic> json) =>
    QuestionOwner(
      json['account_id'] as int?,
      json['reputation'] as int?,
      json['user_id'] as int?,
      json['user_type'] as String?,
      json['profile_image'] as String?,
      json['display_name'] as String?,
      json['link'] as String?,
    );

Map<String, dynamic> _$QuestionOwnerToJson(QuestionOwner instance) =>
    <String, dynamic>{
      'account_id': instance.account_id,
      'reputation': instance.reputation,
      'user_id': instance.user_id,
      'user_type': instance.user_type,
      'profile_image': instance.profile_image,
      'display_name': instance.display_name,
      'link': instance.link,
    };
