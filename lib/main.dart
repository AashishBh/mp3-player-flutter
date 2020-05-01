import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My MP3 Player',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'My Mp3 Player'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void playSong(String songName) {
    final assetsAudioPlayer = AssetsAudioPlayer();

    assetsAudioPlayer.open(
      Audio("assets/$songName.mp3"),
    );
  }

  Center listSong(String songName, String artist) {
    IconData icon = Icons.play_arrow;
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.music_note),
              title: Text('$songName'),
              subtitle: Text('$artist'),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: (Icon(icon)),
                  onPressed: () {
                    playSong(songName);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          listSong('Mellow', 'Rohit Shakya X Sajjan Raj Vaidya'),
          listSong('Maya ma', 'Sushant KC'),
          listSong('Nacha Firiri', 'Mahesh Kafle'),
          listSong('Sayad Timro Bato Ma', 'Raju Lama'),
        ],
      ),
    );
  }
}
