import 'package:bootcamp_app/controller/blog/blogs_list_controller.dart';
import 'package:bootcamp_app/controller/blog/state/blog_state.dart';
import 'package:bootcamp_app/model/blog_model.dart';
import 'package:bootcamp_app/views/screens/components/blog_card.dart';
import 'package:bootcamp_app/views/screens/create_update_blog_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlogsListScreen extends ConsumerStatefulWidget {
  BlogsListScreen({Key? key, required this.blogsList}) : super(key: key);

  List<BlogModel> blogsList;

  @override
  _BlogsListScreenState createState() => _BlogsListScreenState();
}

class _BlogsListScreenState extends ConsumerState<BlogsListScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.blogsList.length,
      itemBuilder: (BuildContext context, int index) {
        return BlogCard(blogModel: widget.blogsList[index]);
      },
    );
  }
}
