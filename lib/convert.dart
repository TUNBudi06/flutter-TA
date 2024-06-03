///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';

class transfer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 4,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff3a57e8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: Text(
          "Transfer",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 17,
            color: Color(0xffffffff),
          ),
        ),
        leading: Icon(
          Icons.arrow_back,
          color: Color(0xffffffff),
          size: 34,
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.account_circle_outlined,
                      color: Color(0xff212435),
                      size: 45,
                    ),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        controller: TextEditingController(),
                        obscureText: false,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xff000000),
                        ),
                        decoration: InputDecoration(
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                BorderSide(color: Color(0xff000000), width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                BorderSide(color: Color(0xff000000), width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                BorderSide(color: Color(0xff000000), width: 1),
                          ),
                          hintText: "Hint Text",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xff000000),
                          ),
                          filled: true,
                          fillColor: Color(0xfff2f2f3),
                          isDense: false,
                          contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.attach_money,
                      color: Color(0xff212435),
                      size: 45,
                    ),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        controller: TextEditingController(),
                        obscureText: false,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xff000000),
                        ),
                        decoration: InputDecoration(
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                BorderSide(color: Color(0xff000000), width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                BorderSide(color: Color(0xff000000), width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide:
                                BorderSide(color: Color(0xff000000), width: 1),
                          ),
                          hintText: "Hint Text",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xff000000),
                          ),
                          filled: true,
                          fillColor: Color(0xfff2f2f3),
                          isDense: false,
                          contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.credit_card,
                      color: Color(0xff212435),
                      size: 45,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        "Text",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: MaterialButton(
                  onPressed: () {},
                  color: Color(0xff0062ff),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Color(0xff0046da), width: 1),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    "kirim",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  textColor: Color(0xffffffff),
                  height: 40,
                  minWidth: 140,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
