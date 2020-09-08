import 'package:flutter/material.dart';
import 'package:flutter_seekbar/flutter_seekbar.dart' show ProgressValue, SectionTextModel, SeekBar;

class SliderAlertWidget extends Dialog{
  VoidCallback confirmCallback;
  VoidCallback cancelCallback;
  Function(String) giveComment;

  SliderAlertWidget({this.cancelCallback,this.confirmCallback,this.giveComment});

  @override
  Widget build(BuildContext context) {
    TextEditingController _textFieldController = TextEditingController();
    FocusNode focusNode = new FocusNode();
    double slider_value = 0;

    return Material(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
     child: Center(
       child: Container(
         margin: EdgeInsets.only(left: 15,right: 15, top: 100, bottom: 200),
         decoration: BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.circular(10),
           border: Border.all(color: Colors.black54, width: 1)
         ),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: <Widget>[
             SizedBox(height: 15),
             Text("更新进度",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 22),),
             SizedBox(height: 20),
//            Text(priceRange.toString()),
             new Container(
               padding: EdgeInsets.only(right: 8.0, left: 8.0,top: 20.0),
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   new Container(
                       width: (MediaQuery.of(context).size.width-60)/5,
                       alignment: Alignment.topCenter,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: <Widget>[
                           Container(
                             height: 15.0,
                             color: Colors.grey,
                             width: 0.5,
                           )
                         ],
                       )
                   ),
                   new Container(
                       width: (MediaQuery.of(context).size.width-60)/5,
                       alignment: Alignment.topCenter,
                       child: Column(
                         children: <Widget>[
                           Container(
                             height: 15.0,
                             color: Colors.grey,
                             width: 0.5,
                           )
                         ],
                       )
                   ),
                   new Container(
                       width: (MediaQuery.of(context).size.width-60)/5,
                       alignment: Alignment.topCenter,
                       child: Column(
                         children: <Widget>[
                           Container(
                             height: 15.0,
                             color: Colors.grey,
                             width: 0.5,
                           )
                         ],
                       )
                   ),
                   new Container(
                       width: (MediaQuery.of(context).size.width-60)/5,
                       alignment: Alignment.topCenter,
                       child: Column(
                         children: <Widget>[
                           Container(
                             height: 15.0,
                             color: Colors.grey,
                             width: 0.5,
                           )
                         ],
                       )
                   ),
                   new Container(
                       width: (MediaQuery.of(context).size.width-60)/5,
                       alignment: Alignment.topCenter,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: <Widget>[
                           Container(
                             height: 15.0,
                             color: Colors.grey,
                             width: 0.5,
                           )
                         ],
                       )
                   ),
                 ],
               ),
             ),

             new Container(
               padding: EdgeInsets.only(left: ((MediaQuery.of(context).size.width-60)/5)/2,right: ((MediaQuery.of(context).size.width-60)/5)/2),
               width: MediaQuery.of(context).size.width,
               alignment: Alignment.topCenter,
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisSize: MainAxisSize.min,
                 textDirection: TextDirection.ltr,
                 children: <Widget>[
                   Container(
                       margin: EdgeInsets.all(8),
                       width: (MediaQuery.of(context).size.width-60)/5*4,
                       child: SeekBar(
                           progresseight: 15,
                           value: slider_value,
                           min: 0,
                           max: 100,
                           sectionCount: 100,
                           sectionColor: Colors.red,
                           hideBubble: false,
                           alwaysShowBubble: true,
                           bubbleRadius: 14,
                           progressColor: Colors.indigo,
                           backgroundColor: Colors.grey[100],
                           isRound: false,
                           indicatorRadius: 7.5,
                           bubbleColor: Colors.transparent,
                           bubbleTextColor: Colors.blueAccent,
                           bubbleTextSize: 14,
                           bubbleMargin: 3,
                           onValueChanged: (v) {
//                           setState(() {
                             slider_value = v.value;
//                           });
//                             print('当前进度：${v.progress}% ，当前的取值：${v.value}%');
                           })
                   ),
                 ],
               ),
             ),

             SizedBox(height: 20,),
             new Container(
               constraints: BoxConstraints(maxWidth: 300, minHeight: 150, maxHeight: 150),
               color: Colors.grey[200],
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: TextField(
                   focusNode: focusNode,
                   controller: _textFieldController,
                   textAlign: TextAlign.start,
                   textInputAction: TextInputAction.done,
                   cursorColor: Colors.white,
                   showCursor: true,
                   maxLines: null,
                   style: TextStyle(fontSize: 17,fontWeight: FontWeight.normal),
                   cursorWidth: 2.0,
                   autofocus: false,
                   keyboardType: TextInputType.text,
                   decoration: InputDecoration(
                     filled: true,
                     fillColor: Colors.grey[200],
                     border: InputBorder.none,
                     contentPadding: const EdgeInsets.all(5),
                     hintText: "请输入进度详情",
                     hintStyle: TextStyle(fontSize: 17,color: Colors.grey,fontWeight: FontWeight.bold),
                   ),
                   onChanged: (String text){
                     giveComment(text);
                   },
                 ),
               ),
             ),

             SizedBox(height: 15),
             Container(
               padding: EdgeInsets.only(left: ((MediaQuery.of(context).size.width-40)/5)/4,right: ((MediaQuery.of(context).size.width-40)/5)/4),
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   new FlatButton(
                       onPressed: (){
                         Navigator.pop(context);
                         cancelCallback();
                       },
                       child: Container(
                         padding: EdgeInsets.fromLTRB(43, 10, 43, 10),
                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.grey[200]),
                         child: Text("取消",
                           style: TextStyle(
                             fontSize:17,
                             fontWeight: FontWeight.normal,
                             color: Colors.black,
                           ),
                         ),
                       )
                   ),

                   Spacer(),

                   new FlatButton(
                       onPressed: _textFieldController.text.length != 0
                           ? (){
                         Navigator.pop(context);
                         confirmCallback();
                       } : null,
                       child: Container(
                         padding: EdgeInsets.fromLTRB(43, 10, 43, 10),
                         decoration: _textFieldController.text.length != 0
                             ? BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.black54)
                             : BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.grey[400]),
                         child: Text("确认",
                           style: TextStyle(
                             fontSize:17,
                             fontWeight: FontWeight.normal,
                             color: Colors.white,
                           ),
                         ),
                       )
                   ),
                 ],
               ),
             ),
           ],
         ),
       ),
     ),
   );
  }
}