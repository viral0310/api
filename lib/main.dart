import 'package:flutter/material.dart';

import 'helpores/api_helper_class.dart';
import 'models/post.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("http_pck,singletonclass"),
        centerTitle: true,
      ),
      body: /*FutureBuilder(
        future: APIHelper.apiHelper.fetchSinglePostData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            Post? data = snapshot.data;
            return Card(
              elevation: 3,
              margin: EdgeInsets.all(8),
              child: ListTile(
                title: Text("${data!.title}"),
                leading: Text("${data!.userId}"),
                subtitle: Text("${data!.body}"),
                trailing: Text("${data!.id}"),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),*/

          FutureBuilder(
        future: APIHelper.apiHelper.fetchMultiplePostData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<Post>? data = snapshot.data as List<Post>?;
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, i) {
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(data[i].title),
                    leading: Text("${data[i].userId}"),
                    subtitle: Text(data[i].body),
                    trailing: Text("${data[i].id}"),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
