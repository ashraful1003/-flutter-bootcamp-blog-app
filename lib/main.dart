import 'package:bootcamp_app/controller/blog/blogs_list_controller.dart';
import 'package:bootcamp_app/views/screens/blog_list_screen.dart';
import 'package:bootcamp_app/views/screens/blog_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controller/blog/state/blog_state.dart';
import 'model/blog_model.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    ref.read(blogsListProvider.notifier).fetchBlogsList();
  }

  @override
  Widget build(BuildContext context) {
    final blogsListState = ref.watch(blogsListProvider);
    List<BlogModel> blogsList =
    blogsListState is BlogsListSuccessState ? blogsListState.blogsList : [];

    return MaterialApp(
      title: 'Blog Project for Bootcamp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: const BlogsListScreen(),
      home: BlogScreen(blogsList: blogsList,blogsListState: blogsListState,),
    );
  }
}
