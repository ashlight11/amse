import 'dart:ui';

import 'package:flutter/cupertino.dart';

import 'main.dart';

class Livre {
  String title;
  String author;
  int year;
  Image cover;
  String pitch;
  bool read;

  Livre(String title, String author, int year, Image cover, String pitch) {
    this.title = title;
    this.year = year;
    this.cover = cover;
    this.pitch = pitch;
    this.author = author;
    this.read = false;
  }

  void lire() {
    this.read = !this.read;
  }

  bool dejaLu() {
    return this.read;
  }
}

Livre getLivre(String s) {
  Livre result;
  for (int i = 0; i < Bib_init.length; i++) {
    if (Bib_init[i].title == s) {
      result = Bib_init[i];
    }
  }
  return result;
}

Set<String> getDejaLus() {
  var result = <String>{};
  for (int i = 0; i < Bib_init.length; i++) {
    if (Bib_init[i].read) {
      result.add(Bib_init[i].title);
    }
  }
  return result;
}
