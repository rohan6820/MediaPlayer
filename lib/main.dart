import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'online_player.dart';
import 'video_player.dart';

void main() {
  runApp(MyMain());
}

class MyMain extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text("Media Player"),
            centerTitle: true,
            bottom: TabBar(
              tabs: <Widget>[
                Tab(text: "Audio"),
                Tab(text: "Video"),
              ],
            ),
            leading: Container(
              child: Image.asset("assets/logo.jpg"),
            )),
        body: TabBarView(
          children: <Widget>[
            MyApp(),
            App(),
          ],
        ),
      ),
      length: 2,
      initialIndex: 0,
    ));
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Player(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Player extends StatefulWidget {
  @override
  _Player createState() => _Player();
}

class _Player extends State<Player> {
  bool f1 = false;
  bool f2 = false;
  bool f3 = false;
  bool f4 = false;
  bool f5 = false;
  bool stop = false;
  AudioPlayer ap1 = AudioPlayer();
  AudioPlayer ap2 = AudioPlayer();
  AudioPlayer ap3 = AudioPlayer();
  AudioPlayer ap4 = AudioPlayer();
  AudioPlayer ap5 = AudioPlayer();
  String textValue = "Sample";

  @override
  void deactivate() {
    ap1.stop();
    ap2.stop();
    ap3.stop();
    ap4.stop();
    ap5.stop();
    super.deactivate();
  }

  void songPlayer(int n, bool s, AudioCache ac, bool stop) {
    if (n == 1) {
      if (!s) {
        setState(() {
          f1 = true;
          f2 = f3 = f4 = f5 = false;
          ac.play("1.mp3");
          ap2.pause();
          ap3.pause();
          ap4.pause();
          ap5.pause();
        });
      } else if (stop) {
        setState(() {
          ap1.stop();
          f1 = false;
        });
      } else {
        setState(() {
          f1 = f2 = f3 = f4 = f5 = false;
          ap1.pause();
        });
      }
    }
    if (n == 2) {
      if (!s) {
        setState(() {
          f2 = true;
          f1 = f3 = f4 = f5 = false;
          ac.play("2.mp3");
          ap1.pause();
          ap3.pause();
          ap4.pause();
          ap5.pause();
        });
      } else if (stop) {
        setState(() {
          ap2.stop();
          f2 = false;
        });
      } else {
        setState(() {
          f1 = f2 = f3 = f4 = f5 = false;
          ap2.pause();
        });
      }
    }
    if (n == 3) {
      if (!s) {
        setState(() {
          f3 = true;
          f1 = f2 = f4 = false;
          ac.play("3.mp3");
          ap1.pause();
          ap2.pause();
          ap4.pause();
          ap5.pause();
        });
      } else if (stop) {
        setState(() {
          ap3.stop();
          f3 = false;
        });
      } else {
        setState(() {
          ap3.pause();
          f1 = f2 = f3 = f4 = f5 = false;
        });
      }
    }

    if (n == 4) {
      if (!s) {
        setState(() {
          f4 = true;
          f1 = f2 = f3 = f5 = false;
          ac.play("4.mp3");
          ap1.pause();
          ap2.pause();
          ap3.pause();
          ap5.pause();
        });
      } else if (stop) {
        setState(() {
          ap4.stop();
          f4 = false;
        });
      } else {
        setState(() {
          ap4.pause();
          f1 = f2 = f3 = f4 = f5 = false;
        });
      }
    }

    if (n == 5) {
      if (!s) {
        setState(() {
          f5 = true;
          f1 = f2 = f3 = f4 = false;
          ac.play("5.mp3");
          ap1.pause();
          ap2.pause();
          ap3.pause();
          ap5.pause();
        });
      } else if (stop) {
        setState(() {
          ap5.stop();
          f4 = false;
        });
      } else {
        setState(() {
          ap5.pause();
          f1 = f2 = f3 = f4 = f5 = false;
        });
      }
    }
  }

  dynamic player(String song, int n, bool s, AudioCache p) {
    int num = n;
    return Expanded(
      child: Center(
        child: Container(
          width: 400.0,
          height: 100.0,
          child: Card(
            color: Colors.teal,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            elevation: 30.0,
            child: Row(
              children: <Widget>[
                SizedBox(width: 2.0),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      song,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  width: 85.0,
                ),
                SizedBox(width: 45.0),
                Container(
                  width: 60,
                  height: 60,
                  child: Card(
                    child: FlatButton(
                      child: Icon(
                        Icons.fast_rewind,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        songPlayer(--num, s, p, stop);
                      },
                    ),
                    color: Colors.black26,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    elevation: 30.0,
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  child: Card(
                    child: FlatButton(
                      child: Icon(s ? Icons.pause : Icons.play_arrow),
                      onPressed: () {
                        songPlayer(num, s, p, stop);
                      },
                    ),
                    color: Colors.black26,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    elevation: 30.0,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 60,
                  height: 60,
                  child: Card(
                    child: FlatButton(
                      child: Icon(Icons.stop),
                      onPressed: () {
                        songPlayer(num, s, p, true);
                      },
                    ),
                    color: Colors.black26,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    elevation: 30.0,
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  child: Card(
                    child: FlatButton(
                      child: Icon(
                        Icons.fast_forward,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        num += 1;
                        if (num > 5) {
                          songPlayer(1, s, p, stop);
                        } else {
                          songPlayer(num, s, p, stop);
                        }
                      },
                    ),
                    color: Colors.black26,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    elevation: 30.0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    AudioCache p1 = AudioCache(fixedPlayer: ap1);
    AudioCache p2 = AudioCache(fixedPlayer: ap2);
    AudioCache p3 = AudioCache(fixedPlayer: ap3);
    AudioCache p4 = AudioCache(fixedPlayer: ap4);
    AudioCache p5 = AudioCache(fixedPlayer: ap5);
    return Scaffold(
      body: Column(
        children: <Widget>[
          player("Naruto OST", 1, f1, p1),
          SizedBox(width: 10.0),
          player("FairyTail OST", 2, f2, p2),
          SizedBox(width: 10.0),
          player("BnHA OST", 3, f3, p3),
          SizedBox(width: 10.0),
          player("DBZ OST", 4, f4, p4),
          SizedBox(width: 10.0),
          player("GioGio OSt", 5, f5, p5),
          Container(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter URL',
                hintStyle: TextStyle(
                  color: Colors.black87,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  textValue = value;
                });
              },
            ),
          ),
          Container(
            width: 200,
            height: 40,
            child: Card(
              child: FlatButton(
                child: Text("Play Audio"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return AudioPlayerNet(
                          urlLink: textValue,
                        );
                      },
                    ),
                  );
                },
              ),
              elevation: 30.0,
            ),
          ),
        ],
      ),
    );
  }
}
