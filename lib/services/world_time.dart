import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location;
  String time;
  String flag;
  String url;

  WorldTime({this.location,this.flag,this.url});

  Future<void> getTime() async{

    try{

      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      String dateTime= data['datetime'];
      String sign = data['utc_offset'].substring(0,1);
      bool add;
      sign == '+' ? add=true : add=false ;
      String offsetHours= data['utc_offset'].substring(1,3);
      String offsetMins= data['utc_offset'].substring(4,6);
      DateTime now = DateTime.parse(dateTime);
      if(add) {
        now = now.add(Duration(hours: int.parse(offsetHours)));
        now = now.add(Duration(minutes: int.parse(offsetMins)));
      }else{
        now = now.subtract(Duration(hours: int.parse(offsetHours)));
        now = now.subtract(Duration(minutes: int.parse(offsetMins)));
      }
      time = DateFormat.jm().format(now);

    }catch(e){
      print('error error $e');
      time = 'could not get time';
    }

  }
}