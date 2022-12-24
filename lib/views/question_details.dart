import 'package:assessment_task/models/question.dart';
import 'package:flutter/material.dart';

class QuestionDetail extends StatelessWidget {
  QuestionDetail(this.question, {Key? key}) : super(key: key);

  final question;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question Detail'),
      ),
        body: Column(
          children: [

            Column(
              children: [
                SizedBox(height: 16),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white38,
                  backgroundImage:
                  question.owner?.profile_image!=null?
                  NetworkImage((question.owner?.profile_image).toString())
                      :null,
                ),
                SizedBox(height: 10,),
                Text(question.owner?.display_name,
                  style: Theme.of(context).textTheme.titleMedium,),
                SizedBox(height: 10,),
                Text(question.owner?.user_type,
                  style: Theme.of(context).textTheme.titleSmall,),
              ],
            ),

            Padding(
              padding: EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [


                  const SizedBox(width: 12,),

                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Question ID ('+question.question_id.toString()+'): \n'+question.title!,
                            style: Theme.of(context).textTheme.titleMedium,),
                          const SizedBox(height: 12,),
                          Text('Is answered: '+question.is_answered.toString(),
                            style: const TextStyle(color: Colors.grey),
                            maxLines: 1,overflow: TextOverflow.ellipsis,),
                          const SizedBox(height: 8,),
                          Row(
                            children: [
                              Text('Answers num: '+question.answer_count.toString(),
                                style: const TextStyle(color: Colors.grey),
                                maxLines: 1,overflow: TextOverflow.ellipsis,),
                              const Spacer(),
                              const Icon(
                                Icons.calendar_today_sharp,
                                size: 15,
                              ),
                              const SizedBox(width: 8,),
                              Text(DateTime.fromMillisecondsSinceEpoch(question.creation_date! * 1000).toString().substring(0, DateTime.fromMillisecondsSinceEpoch(question.creation_date! * 1000).toString().length -13),
                                style: const TextStyle(color: Colors.grey),
                                maxLines: 2,overflow: TextOverflow.ellipsis,),
                            ],
                          )

                        ],
                      )
                  ),

                  const SizedBox(width: 16,),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
