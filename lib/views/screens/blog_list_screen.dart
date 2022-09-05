import 'package:bootcamp_app/controller/blog/blogs_list_controller.dart';
import 'package:bootcamp_app/controller/blog/state/blog_state.dart';
import 'package:bootcamp_app/model/blog_model.dart';
import 'package:bootcamp_app/views/screens/components/blog_card.dart';
import 'package:bootcamp_app/views/screens/create_update_blog_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlogsListScreen extends ConsumerStatefulWidget {
  BlogsListScreen({Key? key}) : super(key: key);

  // List<BlogModel> blogsList;

  @override
  _BlogsListScreenState createState() => _BlogsListScreenState();
}

class _BlogsListScreenState extends ConsumerState<BlogsListScreen> {
  @override
  Widget build(BuildContext context) {
    final blogsListState = ref.watch(blogsListProvider);
    List<BlogModel> blogsList =
        blogsListState is BlogsListSuccessState ? blogsListState.blogsList : [];

    return blogsListState is BlogsListSuccessState
        ? ListView.builder(
            itemCount: blogsList.length,
            itemBuilder: (BuildContext context, int index) {
              return BlogCard(blogModel: blogsList[index]);
            },
          )
        : const Center(child: CircularProgressIndicator());
  }
}
