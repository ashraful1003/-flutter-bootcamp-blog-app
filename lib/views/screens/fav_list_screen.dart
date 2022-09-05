import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controller/blog/blogs_list_controller.dart';
import '../../controller/blog/state/blog_state.dart';
import '../../model/blog_model.dart';
import 'components/blog_card.dart';

class FavListScreen extends ConsumerStatefulWidget {
  FavListScreen({Key? key}) : super(key: key);

  @override
  _FavListScreenState createState() => _FavListScreenState();
}

class _FavListScreenState extends ConsumerState<FavListScreen> {
  List<BlogModel> favList = [];

  searchFavorite(List<BlogModel> blogsList) {
    /// Here from all blogs, sorting the favorite blogs and add them in new list
    BlogModel item;
    favList = [];
    for (item in blogsList) {
      if (item.isFavorite == 1) {
        favList.add(item);
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final blogsListState = ref.watch(blogsListProvider);
    List<BlogModel> blogsList =
        blogsListState is BlogsListSuccessState ? blogsListState.blogsList : [];
    searchFavorite(blogsList);

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
