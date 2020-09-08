import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:screen/screen.dart';
import 'package:justatry/seekbar/flutter_seekbar.dart';
import 'custom_slider_alert_dialog.dart';
import 'package:flutter_seekbar/flutter_seekbar.dart' show ProgressValue, SectionTextModel, SeekBar;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
//        backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
        body: Center(
          child: Ranger(),
        ),
      ),
    );
  }
}

class Ranger extends StatefulWidget {
  @override
  _RangerState createState() => _RangerState();
}

class _RangerState extends State<Ranger> {
//  double priceRange  = 25;
  TextEditingController _textFieldController = TextEditingController();
  String _textChanged;
  FocusNode focusNode = new FocusNode();
  double slider_value = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      slider_value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Text("buzhido"),
          ),
          FlatButton(
              onPressed:(){
                showGeneralDialog(
                    context: context,
                    pageBuilder: (context, anim1, anim2){},
                    barrierColor: Colors.black54.withOpacity(.4),
                    barrierDismissible: true,
                    barrierLabel: "",
                    transitionDuration: Duration(milliseconds: 125),
                    transitionBuilder: (context, anim1, anim2, child){
                      return Transform.scale(
                        scale: anim1.value,
                        child: Opacity(
                          opacity: anim1.value,
                          child: SliderAlertWidget(
                            giveComment: (String text){
                              setState(() {
                                _textChanged = text;
                              });
                            },
                            confirmCallback: () async {
                              Navigator.of(context).pop(_textChanged);
                            },
                            cancelCallback: () async {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      );
                    }
                );
              },
              child: Text("button")),
        ],
      ),
    );
//    return Scaffold(
//      body: Container(
//        color: Colors.white,
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: <Widget>[
//            Text("更新进度",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 17),),
//            SizedBox(height: 20),
////            Text(priceRange.toString()),
//            new Container(
//              padding: EdgeInsets.only(right: 8.0, left: 8.0,top: 20.0),
//              child: Row(
//                crossAxisAlignment: CrossAxisAlignment.center,
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  new Container(
//                      width: (MediaQuery.of(context).size.width-20)/5,
//                      alignment: Alignment.topCenter,
//                      child: Column(
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                        children: <Widget>[
//                          Container(
//                            height: 15.0,
//                            color: Colors.grey,
//                            width: 0.5,
//                          )
//                        ],
//                      )
//                  ),
//                  new Container(
//                      width: (MediaQuery.of(context).size.width-20)/5,
//                      alignment: Alignment.topCenter,
//                      child: Column(
//                        children: <Widget>[
//                          Container(
//                            height: 15.0,
//                            color: Colors.grey,
//                            width: 0.5,
//                          )
//                        ],
//                      )
//                  ),
//                  new Container(
//                      width: (MediaQuery.of(context).size.width-20)/5,
//                      alignment: Alignment.topCenter,
//                      child: Column(
//                        children: <Widget>[
//                          Container(
//                            height: 15.0,
//                            color: Colors.grey,
//                            width: 0.5,
//                          )
//                        ],
//                      )
//                  ),
//                  new Container(
//                      width: (MediaQuery.of(context).size.width-20)/5,
//                      alignment: Alignment.topCenter,
//                      child: Column(
//                        children: <Widget>[
//                          Container(
//                            height: 15.0,
//                            color: Colors.grey,
//                            width: 0.5,
//                          )
//                        ],
//                      )
//                  ),
//                  new Container(
//                      width: (MediaQuery.of(context).size.width-20)/5,
//                      alignment: Alignment.topCenter,
//                      child: Column(
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                        children: <Widget>[
//                          Container(
//                            height: 15.0,
//                            color: Colors.grey,
//                            width: 0.5,
//                          )
//                        ],
//                      )
//                  ),
//                ],
//              ),
//            ),
//
//            new Container(
//              padding: EdgeInsets.only(left: ((MediaQuery.of(context).size.width-20)/5)/2,right: ((MediaQuery.of(context).size.width-20)/5)/2),
//              width: MediaQuery.of(context).size.width,
//              alignment: Alignment.topCenter,
//              child: Row(
//                crossAxisAlignment: CrossAxisAlignment.center,
//                mainAxisSize: MainAxisSize.min,
//                textDirection: TextDirection.ltr,
//                children: <Widget>[
//                  Container(
//                    margin: EdgeInsets.all(8),
//                    width: (MediaQuery.of(context).size.width-20)/5*4,
//                    child: SeekBar(
//                      progresseight: 10,
//                      value: slider_value,
//                      min: 0,
//                      max: 100,
//                      sectionCount: 100,
//                      sectionColor: Colors.red,
//                      hideBubble: false,
//                      alwaysShowBubble: true,
//                      bubbleRadius: 14,
//                      bubbleColor: Colors.transparent,
//                      bubbleTextColor: Colors.blueAccent,
//                      bubbleTextSize: 14,
//                      bubbleMargin: 3,
//                      onValueChanged: (v) {
//                        setState(() {
//                          slider_value = v.value;
//                        });
//                        print('当前进度：${v.progress}% ，当前的取值：${v.value}%');
//                      })
//                  ),
//                ],
//              ),
//            ),
//
//            SizedBox(height: 20,),
//            new Container(
//              constraints: BoxConstraints(maxWidth: 300, minHeight: 150, maxHeight: 150),
//              color: Colors.grey[200],
//              child: Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: TextField(
//                  focusNode: focusNode,
//                  controller: _textFieldController,
//                  textAlign: TextAlign.start,
//                  textInputAction: TextInputAction.done,
//                  cursorColor: Colors.white,
//                  showCursor: true,
//                  maxLines: null,
//                  style: TextStyle(fontSize: 17,fontWeight: FontWeight.normal),
//                  cursorWidth: 2.0,
//                  autofocus: false,
//                  keyboardType: TextInputType.text,
//                  decoration: InputDecoration(
//                    filled: true,
//                    fillColor: Colors.grey[200],
//                    border: InputBorder.none,
//                    contentPadding: const EdgeInsets.all(5),
//                    hintText: "请输入进度详情",
//                    hintStyle: TextStyle(fontSize: 17,color: Colors.grey,fontWeight: FontWeight.bold),
//                  ),
//                  onChanged: (String text){
//                    setState(() {
//                      _textChanged = text;
//                    });
//                  },
//                ),
//              ),
//            ),
//
//            SizedBox(height: 15),
//            Container(
//              padding: EdgeInsets.only(left: ((MediaQuery.of(context).size.width-20)/5)/2,right: ((MediaQuery.of(context).size.width-20)/5)/2),
//              child: Row(
//                crossAxisAlignment: CrossAxisAlignment.center,
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  new FlatButton(
//                      onPressed: (){
//                        showGeneralDialog(
//                            context: context,
//                            pageBuilder: (context, anim1, anim2){},
//                            barrierColor: Colors.black54.withOpacity(.4),
//                            barrierDismissible: true,
//                            barrierLabel: "",
//                            transitionDuration: Duration(milliseconds: 125),
//                            transitionBuilder: (context, anim1, anim2, child){
//                              return Transform.scale(
//                                scale: anim1.value,
//                                child: Opacity(
//                                  opacity: anim1.value,
//                                  child: SliderAlertWidget(
//                                    title: "温馨提示",
//                                    confirm: "保存",
//                                    giveComment: (text){
//                                      setState(() {
//
//                                      });
//                                    },
//                                    confirmCallback: () async {
//                                      Navigator.of(context).pop();
//                                    },
//                                    cancelCallback: () async {
//                                      Navigator.of(context).pop();
//                                    },
//                                  ),
//                                ),
//                              );
//                            }
//                        );
//                      },
//                      child: Container(
//                        padding: EdgeInsets.fromLTRB(43, 10, 43, 10),
//                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.grey[200]),
//                        child: Text("取消",
//                          style: TextStyle(
//                              fontSize:17,
//                              fontWeight: FontWeight.normal,
//                              color: Colors.black,
//                          ),
//                        ),
//                      )
//                  ),
//
//                  Spacer(),
//
//                  new FlatButton(
//                      onPressed: _textFieldController.text.length != 0
//                      ? (){
//
//                      } : null,
//                      child: Container(
//                        padding: EdgeInsets.fromLTRB(43, 10, 43, 10),
//                        decoration: _textFieldController.text.length != 0
//                        ? BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.black54)
//                        : BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.grey[400]),
//                        child: Text("确认",
//                          style: TextStyle(
//                            fontSize:17,
//                            fontWeight: FontWeight.normal,
//                            color: Colors.white,
//                          ),
//                        ),
//                      )
//                  ),
//                ],
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
  }
}