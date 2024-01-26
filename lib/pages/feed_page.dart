import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/post_model.dart';
import 'models/story_model.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<Story> _story = [
    Story("assets/images/user_1 (2).jpeg", "Jazmin"),
    Story("assets/images/user_2 (2).jpeg", "Sylevstr"),
    Story("assets/images/user_3 (2).jpeg", "Lavina"),
    Story("assets/images/user_1 (2).jpeg", "Jazmin"),
    Story("assets/images/user_2 (2).jpeg", "Sylvester"),
    Story("assets/images/user_3 (2).jpeg", "Lavina"),
  ];
  List<Post> _posts = [
    Post(
        userImage: "assets/images/user_1 (2).jpeg",
        userName: "Brianne",
        postImage: "assets/images/feed_1 (3).jpeg",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        userImage: "assets/images/user_2 (2).jpeg",
        userName: "Henri",
        postImage: "assets/images/feed_2 (2).jpeg",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        userImage: "assets/images/user_3 (2).jpeg",
        userName: "Mariano",
        postImage: "assets/images/feed_3 (2).jpeg",
        caption: "Consequatur nihil aliquid omnis consequatur."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(),

            // #story #watchall
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Stories",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  Text(
                    "Watch All",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
            ),
            // #storyList
            Container(
              width: MediaQuery.of(context).size.width,
              height: 110,
              color: Colors.black,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: _story.map((story) {
                  return _itemsOfStory(story);
                }).toList(),
              ),
            ),

            // #post list
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, index) {
                  return _itemOfPost(_posts[index]);
                },
                itemCount: _posts.length,
                shrinkWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemsOfStory(Story story) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: CircleAvatar(
            radius: 38,
            backgroundColor: Colors.red,
            child: CircleAvatar(
              radius: 34,
              backgroundImage: AssetImage(story.storyImage),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          story.userName,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget _itemOfPost(Post post) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // #header of post
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        image: AssetImage(post.userImage),
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      post.userName,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
          FadeInImage(
            image: AssetImage(
              post.postImage,
            ),
            width: double.maxFinite,
            placeholder: const AssetImage("assets/images/placeholder.png"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                        size: 24,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.chat_bubble,
                        size: 24,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.send,
                        size: 24,
                        color: Colors.white,
                      )),
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.bookmark_border,
                    size: 24,
                    color: Colors.white,
                  )),
            ],
          ),
          // #tags
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Liked By ",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextSpan(
                    text: "Sigmund,",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  TextSpan(
                    text: " Yessenia,",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  TextSpan(
                    text: " Dayana",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  TextSpan(
                    text: " and",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: " 1263 others",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          // #caption
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: post.userName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  TextSpan(
                    text: "  ${post.caption}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          // #date
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              "Febuary 2020",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
