import 'package:flutter/material.dart';
import 'package:flutter_zhifu_ui/constant/Config.dart';
import 'package:flutter_zhifu_ui/modules/home/detail/QuestionPage.dart';
import 'package:flutter_zhifu_ui/modules/home/model/QuestionModel.dart';

class HotPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HotPage();
  }
}

class _HotPage extends State<HotPage> {
  @override
  Widget build(BuildContext context) {
    Widget hotCard(QuestionModel question) {
      return new Container(
        decoration: new BoxDecoration(
            color: Config.cardBackgroundColor,
            border: new BorderDirectional(
                bottom: new BorderSide(
                    color: Config.dark == true
                        ? Colors.white12
                        : Colors.black12,
                    width: 1.0))),
        child: new FlatButton(
            onPressed: (){
              Navigator.of(context).push(new MaterialPageRoute(builder: (context){
                return new QuestionPage();
              }));
            },
            child: new Container(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          child: new Text(
                            question.order,
                            style: new TextStyle(
                              color: question.order.compareTo("03") <= 0
                                  ? Colors.red
                                  : Colors.yellow,
                              fontSize: 18.0,
                            ),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        question.rise != null
                            ? new Row(
                                children: <Widget>[
                                  new Icon(
                                    Icons.arrow_upward,
                                    color: Colors.red,
                                    size: 10.0,
                                  ),
                                  new Text(
                                    question.rise,
                                    style: new TextStyle(
                                        color: Colors.red, fontSize: 10.0),
                                  )
                                ],
                              )
                            : new Container()
                      ],
                    ),
                    flex: 1,
                  ),
                  new Expanded(
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          child: new Text(question.title,
                          style: new TextStyle(color: Config.dark == true ? Colors.white70 : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,height: 1.1),),
                          padding: const EdgeInsets.only(bottom: 10.0,right: 4.0),
                          alignment: Alignment.topLeft,
                        ),
                        question.mark !=null?new Container(
                          child: new Text(question.mark,style: new TextStyle(color: Config.fontColor)),
                          padding: const EdgeInsets.only(bottom: 8.0,right: 4.0),
                          alignment: Alignment.topLeft,
                        ):new Container(),
                        new Container(
                          child: new Text(question.hotNum,style: new TextStyle(color: Config.fontColor),),
                          alignment: Alignment.topLeft,
                        )

                      ],
                    ),
                    flex: 6,
                  ),
                  new Expanded(
                    child: new AspectRatio(aspectRatio: 3.0/2.0,
                    child: new Container(
                      foregroundDecoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: new NetworkImage(question.imgUrl),
                          centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0)
                        ),
                        borderRadius: const BorderRadius.all(const Radius.circular(6.0))
                      ),
                    ),),
                    flex: 3,
                  ),
                ],
              ),
            )),
      );
    }

    return new SingleChildScrollView(
      child: new Container(
        margin: const EdgeInsets.only(top: 5.0),
        child: new Column(
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(top: 5.0),
            ),
            hotCard(questionList[0]),
            hotCard(questionList[1]),
            hotCard(questionList[2]),
            hotCard(questionList[3]),
            hotCard(questionList[4]),
          ],
        ),
      ),
    );
  }
}
