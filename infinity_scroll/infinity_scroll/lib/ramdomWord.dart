import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() {
    return _RandomWordState();
  }
}

class _RandomWordState extends State<RandomWords> {
  final _sugestions = <WordPair>[];
  final _saved = <WordPair>{};
  final _biggerFont = const TextStyle(fontSize: 18);
  void _pushedSave() {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) {
      final tiles = _saved.map((pair) => ListTile(
            title: Text(
              pair.asPascalCase,
              style: _biggerFont,
            ),
          ));
      final divided = tiles.isNotEmpty
          ? ListTile.divideTiles(context: context, tiles: tiles).toList()
          : <Widget>[];

      return Scaffold(
        appBar: AppBar(
          title: const Text('Sugestions saved'),
        ),
        body: ListView(
          children: divided,
        ),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerador de nomes inicial'),
        actions: [
          IconButton(
            onPressed: _pushedSave,
            icon: Icon(Icons.list),
            tooltip: 'Saved Sugestion',
          )
        ],
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (context, i) {
            if (i.isOdd) return const Divider();
            final index = i ~/ 2;
            if (index >= _sugestions.length) {
              _sugestions.addAll(generateWordPairs().take(10));
            }
            final alreadySaved = _saved.contains(_sugestions[index]);
            return ListTile(
              title: Text(
                _sugestions[index].asPascalCase,
                style: _biggerFont,
              ),
              trailing: Icon(
                alreadySaved ? Icons.favorite : Icons.favorite_border,
                color: alreadySaved ? Colors.red : null,
                semanticLabel: alreadySaved ? 'Remove from Saved' : 'Save',
              ),
              onTap: () {
                setState(() {
                  if (alreadySaved) {
                    _saved.remove(_sugestions[index]);
                  } else {
                    _saved.add(_sugestions[index]);
                  }
                });
              },
            );
          }),
    );
  }
}
