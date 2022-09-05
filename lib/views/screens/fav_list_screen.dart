import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/blog_model.dart';
import 'components/blog_card.dart';

class FavListScreen extends ConsumerStatefulWidget {
  FavListScreen({Key? key, required this.blogsList}) : super(key: key);

  List<BlogModel> blogsList;

  @override
  _FavListScreenState createState() => _FavListScreenState();
}

class _FavListScreenState extends ConsumerState<FavListScreen> {
  List<BlogModel> favList = [];

  searchFavorite() {
    /// Here from all blogs, sorting the favorite blogs and add them in new list
    BlogModel item;
    for (item in widget.blogsList) {
      if (item.isFavorite == 1) {
        favList.add(item);
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return favList.isNotEmpty
        ? ListView.builder(
            itemCount: favList.length,
            itemBuilder: (BuildContext context, int index) {
              return BlogCard(blogModel: favList[index]);
            },
          )
        : const Center(
            child: Text("No Favorite Blogs"),
          );
  }
}
