import 'package:flutter/material.dart';
import 'package:video_player_demo/video_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: SafeArea(
          child: MyHomePage()
        )
      )
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(child: Text("Correct duration video: animation.MP4"), onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => VideoWidget(videoLocalPath: "assets/animation.mp4",),
          ),
        ),),
        SizedBox(height: 24,),
        // I download this video from musk's post: https://twitter.com/elonmusk/status/1732860921905549506
        ElevatedButton(child: Text("Wrong duration video: MuskVideo.MP4"), onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => VideoWidget(videoLocalPath: "assets/MuskVideo.mp4",),
          ),
        ),),
      ],
    );
  }

}
