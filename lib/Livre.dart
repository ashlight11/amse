
import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Livre {
  String title;
  int year;
  Image cover;
  String pitch;

  Livre (String title, int year, Image cover, String pitch){
    this.title = title;
    this.year = year;
    this.cover = cover;
    this.pitch = pitch;
  }

}