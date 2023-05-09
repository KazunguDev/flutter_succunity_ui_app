import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class StaticBooks {
  static const String cdn = "https://cdn.syncfusion.com/";
  static const String path =
      "content/images/downloads/ebook/ebook-cover/";
  static const List<String> covers = [
    "visual-studio-for-mac-succinctly-v1.png",
    "angular-testing-succinctly.png",
    "azure-devops-succinctly.png",
    "asp-net-core-3-1-succinctly.png",
    "angulardart_succinctly.png"
  ];
  static const List<String> titles = [
    "Visual Studio for Mac Succinctly",
    "Angular Testing Succinctly",
    "Azure DevOps Succinctly",
    "ASP.NET Core 3.1 Succinctly",
    "AngularDart Succinctly"
  ];
}
class Succinctly extends StatelessWidget {
  final String book;
  final String title;
  Succinctly({
    required this.book,
    required this.title,
  });
  PopupMenuItem<String> bookItem(item) {
    return PopupMenuItem<String>(
      child: Text(item),
      value: item,
    );
  }
  List<PopupMenuItem<String>> listBooks() {
    return StaticBooks.titles.map((String item) {
      return bookItem(item);
    }).toList();
  }
  List<Widget> popupMenuButton(BuildContext context) {
    return <Widget>[
      PopupMenuButton(
        icon: Icon(Icons.book),
        itemBuilder: (context) {
          return listBooks();
        },
        onSelected: (value) => showBook(context, value),
      ),
    ];
  }
  void showBook(BuildContext context, dynamic  mItem) {
    dynamic title;
    dynamic cover;
    if (mItem == StaticBooks.titles[0]) {
      cover = StaticBooks.covers[0];
      title = StaticBooks.titles[0];
    } else if (mItem == StaticBooks.titles[1]) {
      cover = StaticBooks.covers[1];
      title = StaticBooks.titles[1];
    } else if (mItem == StaticBooks.titles[2]) {
      cover = StaticBooks.covers[2];
      title = StaticBooks.titles[2];
    } else if (mItem == StaticBooks.titles[3]) {
      cover = StaticBooks.covers[3];
      title = StaticBooks.titles[3];
    } else if (mItem == StaticBooks.titles[4]) {
      cover = StaticBooks.covers[4];
      title = StaticBooks.titles[4];
    }
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Succinctly(

              book: cover,
              title: title,
            )));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: popupMenuButton(context),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(StaticBooks.cdn +
                StaticBooks.path + book),
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.book_online),
        onPressed: () {
          print('Awesome book!');
        },
      ),
    );
  }
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Succinctly(
        book: StaticBooks.covers[0],
          title: StaticBooks.titles[0],
        ),
      theme: ThemeData(
        primaryColor: Colors.indigo,
        accentColor: Colors.amber,
        textTheme: TextTheme(
          bodyText2: TextStyle(
              fontSize: 26, fontStyle: FontStyle.italic),
        ),
        brightness: Brightness.dark,
      ),
    );
  }
}