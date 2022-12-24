import 'package:assessment_task/models/question.dart';
import 'package:assessment_task/views/question_details.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({Key? key, required this.question}) : super(key: key);

  final Question question;
  // final QuestionOwner questionOwner;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => QuestionDetail(question)));
      },
      child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white38,
                    backgroundImage:
                    question.owner?.profile_image!=null?
                    NetworkImage((question.owner?.profile_image).toString())
                        :null,
                  ),

                  const SizedBox(width: 12,),

                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Question ID ('+question.question_id.toString()+'): \n'+question.title!,
                            style: Theme.of(context).textTheme.titleMedium,maxLines: 2,overflow: TextOverflow.ellipsis,),
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
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
