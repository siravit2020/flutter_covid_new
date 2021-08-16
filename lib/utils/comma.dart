import 'package:flutter/material.dart';

String comma(String msg){
  return msg.replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
}
