import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Song> _songs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // this is iterable
    initPlayer();
  }

  void initPlayer() async {
    var songs = await MusicFinder.allSongs();
    // i converted into list
    songs = new List.from(songs);
    setState(() {
      _songs = songs;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget home() {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("Music App"),
        ),
        body: new ListView.builder(
          itemCount: _songs.length,
          itemBuilder: (context, int index) {
            return new ListTile(
              leading: new CircleAvatar(
                child: new Text(_songs[index].title[0]),
              ),
              title: new Text(_songs[index].title),
            );
          },
        ),
      );
    }

    return new MaterialApp(
      home: home(),
    );
  }
}
