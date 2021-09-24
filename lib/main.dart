import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'class.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<User> _users = [
  User(id: 3, userName: 'leomessi'),
  User(id: 1, userName: 'djokernole'),
  User(id: 2, userName: 'maxverstappen1'),
  User(id: 4, userName: 'dancarter_'),
  User(id: 6, userName: 'usainbolt'),
  User(id: 5, userName: 'michealphelps'),
];
List<Post> _posts = [
  Post(userid: 1, id: 1, userLiked: 1, likes: 300, comments: 45),
  Post(userid: 2, id: 2, userLiked: 2, likes: 250, comments: 20),
  Post(userid: 3, id: 3, userLiked: 3, likes: 314, comments: 15),
  Post(userid: 4, id: 4, userLiked: 4, likes: 178, comments: 23),
  Post(userid: 5, id: 5, userLiked: 5, likes: 111, comments: 66),
  Post(userid: 6, id: 6, userLiked: 6, likes: 1567, comments: 34),
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(38, 38, 38, 1),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Color.fromRGBO(38, 38, 38, 0),
        title: Text(
          'INSTAGRAM',
          style: GoogleFonts.grandHotel(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(
                CupertinoIcons.heart,
              ),
              onPressed: () {}),
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.facebookMessenger,
            ),
            onPressed: (() {}),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            height: 110,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Row(
                  children: [
                    Row(children: _users.map((e) => UserAvatar(e)).toList())
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView(
                children: _posts.map((e) => Userpost(post: e)).toList()),
          ),
          new Divider(
            color: Colors.grey,
          ),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color.fromRGBO(38, 38, 38, 0),
          primaryColor: Colors.red,
          textTheme: Theme.of(context).textTheme.copyWith(
                caption: new TextStyle(color: Colors.yellow),
              ),
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Icons.home_filled,
                color: Colors.white,
                size: 30,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Icons.search_sharp,
                color: Colors.white,
                size: 30,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Icons.add_box_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Icons.person_outline_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserAvatar extends StatelessWidget {
  final User user;

  UserAvatar(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Column(
        children: [
          CircleAvatar(
            radius: 36,
            backgroundColor: Colors.red.shade200,
            child: CircleAvatar(
              radius: 34,
              backgroundColor: Colors.purpleAccent,
              child: CircleAvatar(
                radius: 33,
                backgroundImage: AssetImage('images/user${this.user.id}.jpg'),
              ),
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            '${this.user.userName}',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class Userpost extends StatelessWidget {
  final Post post;

  Userpost({required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 24),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage:
                    AssetImage('images/user${this.post.userid}.jpg'),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '${_users.where((element) => element.id == this.post.userid).first.userName}',
                style: TextStyle(color: Colors.white),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert_rounded,
                  color: Colors.white,
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/instagram${this.post.id}.jpg'),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(15),
            ),
            height: 300,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.heart_fill,
                  color: Colors.red,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.chat_bubble_text,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.send_outlined,
                  color: Colors.white,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.bookmark_border,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 12,
                backgroundImage:
                    AssetImage('images/user${this.post.userLiked}.jpg'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Text(
                  'Liked by dan_dias and',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                '${this.post.likes} others',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                child: Text(
                  'View all ${this.post.comments} comments ',
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
