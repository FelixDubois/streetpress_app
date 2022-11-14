import 'package:flutter/material.dart';
import 'package:streetpress/themes/color.dart';

class MoneyPage extends StatefulWidget {
  const MoneyPage({super.key});

  @override
  State<MoneyPage> createState() => _MoneyPageState();
}

class _MoneyPageState extends State<MoneyPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: StreetPressColors.yellow,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: const [
              Title(),
              Description(),
              Donate(),
              ExternalLink(),
            ],
          ),
        ),
      ),
    );
  }
}

class ExternalLink extends StatelessWidget {
  const ExternalLink({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        "VOIR COMMENT STREETPRESS DÉPENSE VOS DONS",
        style: TextStyle(
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

class Donate extends StatelessWidget {
  const Donate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Container(
            height: 80,
            color: StreetPressColors.blue,
            child: const Center(
              child: Text(
                "REGARDER UNE PUB\nDE 30 SECONDES",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: StreetPressColors.yellow,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: 80,
            color: StreetPressColors.blue,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Text(
                    "FAIRE UN DON",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: StreetPressColors.yellow,
                      fontSize: 20,
                    ),
                  ),
                  Image.asset(
                    "assets/images/CB.png",
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: RichText(
        text: const TextSpan(
          style: TextStyle(color: StreetPressColors.black, fontSize: 45),
          children: <TextSpan>[
            TextSpan(text: 'TU VEUX SOUTENIR LE JOURNALISME'),
            TextSpan(
                text: ' LIBRE', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: ' ET'),
            TextSpan(
                text: ' INDÉPENDANT',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: ' ?'),
          ],
        ),
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
      child: RichText(
        textAlign: TextAlign.start,
        text: const TextSpan(
          style: TextStyle(
              color: StreetPressColors.black, fontSize: 14, height: 1.5),
          children: <TextSpan>[
            TextSpan(
                text: '90%', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: " des médias privés sont aux mains d'"),
            TextSpan(
                text: 'une dizaine de milliardaires',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(
                text: '. Ce n’est pas le cas de StreetPress. C’est un gage d’'),
            TextSpan(
                text: 'indépendance',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: ' pour notre média.'),
            TextSpan(
                text: ' Nous sommes libres',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(
                text:
                    ' de proposer un journalisme qui dérange.\nStreetPress ne peut pas compter sur la fortune d’un Bolloré pour boucler ses fins de mois.'),
            TextSpan(
                text: ' On ne peut compter que sur vous.',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
