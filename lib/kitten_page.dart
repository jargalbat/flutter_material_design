//Jargalbat@Jargalbat MacBookPro kittens % ls
//kitten0.png	kitten.jpg	kitten2.jpeg	kitten4.png
//Jargalbat@Jargalbat MacBookPro kittens % python -m SimpleHTTPServer
//Serving HTTP on 0.0.0.0 port 8000 ...

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class KittenPage extends StatelessWidget {
  const KittenPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available kittens'),
      ),
      body: ListView.builder(
        itemCount: _kittens.length,
        itemExtent: 60.0,
        itemBuilder: _listItemBuilder,
      ),
    );
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (context) => _dialogBuilder(context, _kittens[index]),
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 16.0),
        alignment: Alignment.centerLeft,
        child: Text(
          _kittens[index].name,
          style: Theme.of(context).textTheme.headline,
        ),
      ),
    );
  }

  Widget _dialogBuilder(BuildContext context, Kitten kitten) {
    ThemeData localTheme = Theme.of(context);

    return SimpleDialog(contentPadding: EdgeInsets.zero, children: <Widget>[
      Image.network(
        kitten.imageUrl,
        fit: BoxFit.fill,
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, //justify
          children: [
            Text(
              kitten.name,
              style: localTheme.textTheme.display1,
            ),
            Text(
              '${kitten.age} months old',
              style: localTheme.textTheme.subhead.copyWith(
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              kitten.description,
              style: localTheme.textTheme.body1,
            ),
            SizedBox(height: 16.0),
            // Wrap is like a row, but will wrap its children if the extend too far.
            Align(
              alignment: Alignment.centerRight,
              child: Wrap(
                children: <Widget>[
                  FlatButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('I\'M ALERGIC'),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    child: const Text('ADOPT'), //үрчилж авах
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ]);
  }
}

final String server = defaultTargetPlatform == TargetPlatform.android ? "10.0.2.2" : "localhost";

final List<Kitten> _kittens = <Kitten>[
  Kitten(
    name: 'Mittens',
    description: 'The pinnacle of cats. When Mittens sits in your lap, '
        'you feel like roaylty.',
    age: 11,
    imageUrl: 'http://$server:8000/kitten.jpg',
  ),
  Kitten(
    name: 'Fluffy',
    description: 'World\'s cutest kitten. Seriously. We did the research.',
    age: 3,
    imageUrl: 'http://$server:8000/kitten.jpg',
  ),
  Kitten(
    name: 'Scooter',
    description: 'World\'s cutest kitten. Serfiously. We did the research.',
    age: 6,
    imageUrl: 'http://$server:8000/kitten.jpg',
  ),
  Kitten(
    name: 'Steve',
    description: 'World\'s cutest kitten. Seriously. We did the research.',
    age: 9,
    imageUrl: 'http://$server:8000/kitten.jpg',
  ),
];

class Kitten {
  const Kitten({this.name, this.description, this.age, this.imageUrl});

  final String name;
  final String description;
  final int age;
  final String imageUrl;
}
