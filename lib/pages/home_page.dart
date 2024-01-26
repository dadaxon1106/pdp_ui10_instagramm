import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdp_ui10_instagramm/pages/feed_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pages = const [
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
  ];
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title:const Text("Instagram",style: TextStyle(color:Colors.white,fontSize:18),),
        centerTitle: true,
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.camera_alt,color: Colors.white,)),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(CupertinoIcons.chat_bubble_fill,size: 24,color: Colors.white,),
          ),
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.send,size: 24,color: Colors.white,),
          ),
        ],
      ),
      body: pages[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentPage,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        onTap: (i){
          setState(() {
            _currentPage=i;
          });
        },
        items: const[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: "Upload",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Likes",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
