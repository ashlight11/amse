import 'package:flutter/material.dart';
import 'home_widget.dart';
import 'package:tp1/Livre.dart';

// Création de tous les livres

Livre alaska = new Livre(
    "Qui es-tu Alaska?",
    "John Green",
    2014,
    Image.asset('assets/alaska.jpg'),
    "Miles Halter a seize ans et n'a pas l'impression d'avoir vécu. Assoiffé d'expériences, il décide de quitter le petit cocon familial pour partir loin, en Alabama au pensionnat de Culver Creek. Ce sera le lieu de tous les possibles, du Grand Peut Etre. Et de toutes les premières fois. C'est là aussi, qu'il rencontre Alaska. La troublante, l'insaisissable et insoumise, drôle, intelligente et follement sexy, Alaska Young. Qui es-tu Alaska? est LE roman de l'adolescence: les amitiés fortes, l'amour, la transgression, la soif de connaissance et la fondamentale quête de sens. ");
Livre aliene = new Livre (
    "Qui est aliéné?",
    "Maurice Clavel",
    1970,
    Image.asset('assets/aliene.jpg'),
    "L'aliénation... Est-ce une réalité ?... Est-ce une mode de notre langage ?... Un slogan ? Ceux qui en parlent, lorsqu'ils sont des doctrinaires, leur doctrine leur permet-elle seulement de la concevoir ? Comment savoir qu'on est étranger à soi-même ? Et ceux qui la ressentent, n'est-ce pas déjà qu'ils commencent à s'en délivrer ? QUI est aliéné ? QUI se délivre ? QUI nous délivre ? Que faut-il que soit l'homme, ou que soit devenu l'homme, pour que ces questions se posent ?LA MORT DE L'HOMME, si récente, n'est-elle pas déjà du passé ?... Mais, s'il est vrai qu'il ressuscite, comment? Et qu'y fait Dieu, s'il existe? Et qu'en faire ? Peut-être devine-t-on mieux, après la lecture de cet essai, le sens des révolutions occidentales contemporaines, celles qui s'amorcent ou s'annoncent dans la jeunesse."
);
Livre bojangles = new Livre (
    "En attendant Bojangles",
    "Olivier Bourdeaut",
    2017,
    Image.asset('assets/bojangles.jpeg'),
    "Sous le regard émerveillé de leur fils, ils dansent sur «Mr. Bojangles» de Nina Simone. Leur amour est magique, vertigineux, une fête perpétuelle. Chez eux, il n’y a de place que pour le plaisir, la fantaisie et les amis. Celle qui donne le ton, qui mène le bal, c’est la mère, feu follet imprévisible et extravagant. C’est elle qui a adopté le quatrième membre de la famille, Mlle Superfétatoire, un grand oiseau exotique qui déambule dans l’appartement. C’est elle qui n’a de cesse de les entraîner dans un tourbillon de poésie et de chimères. Un jour, pourtant, elle va trop loin. Et père et fils feront tout pour éviter l’inéluctable, pour que la fête continue, coûte que coûte. L’amour fou n’a jamais si bien porté son nom."
);
Livre etoiles = new Livre (
  "Nos étoiles contraires",
  "John Green",
  2013,
  Image.asset('assets/etoiles.jpeg'),
  "Hazel, 16 ans, est atteinte d'un cancer. Son dernier traitement semble avoir arrêté l'évolution de la maladie, mais elle se sait condamnée. Bien qu'elle s'y ennuie passablement, elle intègre un groupe de soutien, fréquenté par d'autres jeunes malades. C'est là qu'elle rencontre Augustus, un garçon en rémission, qui partage son humour et son goût de la littérature. Entre les deux adolescents, l'attirance est immédiate.",
);
Livre exctinction = new Livre(
    "La 6e Exctinction",
    "Elizabeth Kolbert",
    2015,
    Image.asset('assets/exctinction.jpg'),
    "Depuis l'apparition de la vie sur Terre, il y a eu cinq extinctions massives d'espèces. Aujourd'hui, les scientifiques estiment que notre planète est en train de vivre la sixième, la plus dévastatrice depuis la disparition des dinosaures. Tous les jours, sous nos yeux, parfois même dans notre jardin, des espèces s'éteignent. Mais cette fois, c'est l'homme, et l'homme seul, qui en est la cause. Pour prendre toute la mesure du moment critique que nous sommes en train de traverser, Elizabeth Kolbert se livre à une enquête passionnante sur la grande histoire de la vie terrestre, en remontant aux découvertes de Cuvier et Darwin, et le péril imminent qui la guette."
);
Livre fille = new Livre(
    "La fille de papier",
    "Guillaume Musso",
    2010,
    Image.asset('assets/fille.jpg'),
    "Tom Boyd, un écrivain célèbre en panne d¹inspiration, voit surgir dans sa vie l’héroïne de ses romans. Elle est jolie, elle est désespérée, elle va mourir s’il s’arrête d’écrire. Impossible ? Et pourtant !"
);

// bibliothèque initiale

List<Livre> Bib_init = [alaska, aliene, bojangles, etoiles, exctinction, fille];
List<String> Bib_titres = [alaska.title, aliene.title, bojangles.title, etoiles.title, exctinction. title, fille.title];

void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomePage(),
    );
  }
}
