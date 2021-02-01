
import 'dart:ui';

import 'package:flutter/cupertino.dart';

import 'main.dart';

class Livre {
  String title;
  String author;
  int year;
  Image cover;
  String pitch;

  Livre (String title, String author, int year, Image cover, String pitch){
    this.title = title;
    this.year = year;
    this.cover = cover;
    this.pitch = pitch;
    this.author = author;
  }

}
Livre getLivre(String s){
  Livre result;
  for (int i = 0; i < Bib_init.length; i++){
    if (Bib_init[i].title == s){
      result = Bib_init[i];
    }
  }
  return result;
}