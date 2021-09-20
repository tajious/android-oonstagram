import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:oonstagram/models/Post.dart';
import 'package:oonstagram/models/User.dart';


class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {

  List<User> _userStories = [
    for (int i = 1; i < 10; i++)
      User(
        username: 'seyyed_$i',
        profilePicture: '$i.jpeg',
      )
  ];

  List<Post> _userPosts = [
    for (int i = 1; i < 10; i++)
      Post(
        user: User(
          username: 'seyyed_$i',
          profilePicture: '$i.jpeg',
        ),
        image: '$i.jpeg',
        caption: "This be a caption from seyyed $i",
      )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFEEEEEEE),
        brightness: Brightness.light,
        centerTitle: true,
        title: Text(
          "Oonstagram",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Feather.camera,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Feather.tv, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesome.send_o,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Stories",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Watch All",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ))
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 90,
              margin: EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: _userStories.map((user) {
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70),
                              border: Border.all(
                                  width: 3,
                                  color: Colors.pink[800])
                          ),
                          child: Container(
                            padding: EdgeInsets.all(2),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(70),
                              child: FadeInImage(
                                image: NetworkImage(
                                    'assets/stories/${user.profilePicture}'),
                                placeholder: AssetImage(
                                  'assets/placeholder.png',
                                ),
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(user.username),
                      ],
                    );
                  }).toList()),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _userPosts.length,
              itemBuilder: (ctx, i) {
                return Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: FadeInImage(
                                      image: AssetImage(
                                        'assets/stories/${_userPosts[i].user.profilePicture}',
                                      ),
                                      placeholder: AssetImage(
                                        'assets/placeholder.png',
                                      ),
                                      width: 40,
                                      height: 40,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    _userPosts[i].user.username,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(SimpleLineIcons.options),
                              )
                            ],
                          ),
                        ),
                        FadeInImage(
                          width: MediaQuery.of(context).size.width,
                          image: AssetImage(
                              'assets/stories/${_userPosts[i].image}'),
                          placeholder: AssetImage(
                            'assets/placeholder.png',
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(FontAwesome.heart_o)
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(FontAwesome.comment_o)
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(FontAwesome.send_o)
                                ),
                              ],
                            ),

                            IconButton(
                                onPressed: () {},
                                icon: Icon(FontAwesome.bookmark_o)
                            )
                          ],
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                          child: RichText(
                              softWrap: true,
                              overflow: TextOverflow.visible,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: "Liked By",
                                      style: TextStyle(
                                        color: Colors.black,
                                      )
                                  ),
                                  TextSpan(
                                    text: " seyyed_${i + 1}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  TextSpan(
                                    text: " seyyed_${i + 2 * 2}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  TextSpan(
                                      text: " and",
                                      style: TextStyle(
                                        color: Colors.black,
                                      )
                                  ),
                                  TextSpan(
                                    text: " 324 others",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                          child: RichText(
                              softWrap: true,
                              overflow: TextOverflow.visible,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: _userPosts[i].user.username,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black
                                    ),
                                  ),
                                  TextSpan(
                                      text: " ${_userPosts[i].caption}",
                                      style: TextStyle(
                                        color: Colors.black,
                                      )
                                  ),
                                ],
                              )
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 14),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "February 2020",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        )
                      ],
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
