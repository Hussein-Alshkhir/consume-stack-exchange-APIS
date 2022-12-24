import 'dart:convert';

import 'package:assessment_task/models/question.dart';
import 'package:assessment_task/network/network_enums.dart';
import 'package:assessment_task/network/network_helper.dart';
import 'package:assessment_task/network/network_service.dart';
import 'package:assessment_task/network/query_param.dart';
import 'package:assessment_task/static/static_values.dart';
import 'package:assessment_task/widgets/question_widget.dart';
import 'package:flutter/material.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Consume Stack Exchange API',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final controller = ScrollController();

  int len = 10;
  // int l = 0;

  @override
  void initState(){
    super.initState();
    controller.addListener(() {
      if(controller.position.maxScrollExtent == controller.offset){
        setState(() {
          // len = len+10;
          if(len+10<30){
          len = len +10;}
          else{
            len = len+(30-len);}
        });
      }
    });
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  Future<List<Question>?> getData() async{

      final response = await NetworkService.sendRequest(
          requestType: RequestType.get,
          url: StaticValues.apiUrl,
          queryParam: QP.apiQP(

              sort: StaticValues.sort,
              order: StaticValues.order,
              site: StaticValues.site));


      return await NetworkHelper.filterResponse(
          callBack: _listOfQuestionsFromJson,
          response: response,
          parameterName: CallBackParameterName.items,
          onFailureCallBackWithMessage: (errorType, msg){
            print('Error Type - $errorType - Message - $msg');
            return null;
          });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Questions'),
      ),

      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
              final List<Question> questions = snapshot.data as List<Question>;

                // l=questions.length;

              return ListView.builder(
                controller: controller,
                itemBuilder: (context, index) {

                    if(index<len){
                      return QuestionWidget(question: questions[index]);
                    }else{
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 35),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }



                },
                // itemCount: questions.length+1,
                itemCount: len+1,

              );
            }
            else if (snapshot.hasError){
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 25,
                    ),
                    SizedBox(height: 10,),
                    Text('Something went wrong!')
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),

    );
  }

  List<Question> _listOfQuestionsFromJson(json) => (json as List)
      .map((e) => Question.fromJson(e as Map<String, dynamic>))
      .toList();

}

