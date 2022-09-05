import 'package:bootcamp_app/model/blog_model.dart';
import 'package:bootcamp_app/views/screens/blog_list_screen.dart';
import 'package:bootcamp_app/views/screens/fav_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controller/blog/blogs_list_controller.dart';
import '../../controller/blog/state/blog_state.dart';
import 'create_update_blog_screen.dart';

class BlogScreen extends ConsumerStatefulWidget {
  BlogScreen({
    Key? key,
    // required this.blogsList,
    // required this.blogsListState,
  }) : super(key: key);

  // List<BlogModel>? blogsList;
  // dynamic blogsListState;

  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends ConsumerState<BlogScreen> {
  int _selectedIndex = 0;

  List<Widget> widgetOptions = [
    BlogsListScreen(),
    FavListScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Blog App')),
      body: widgetOptions.elementAt(_selectedIndex),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => const CreateUpdateBlogScreen()));
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorite'),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blue,
          iconSize: 20,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
