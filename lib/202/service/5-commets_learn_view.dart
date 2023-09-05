import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/service/4-commemt_model.dart';
import 'package:flutter_full_learn/202/service/post_service.dart';

class CommentsLearnView extends StatefulWidget {
  const CommentsLearnView({Key? key, this.postId}) : super(key: key);
  final int? postId;

  @override
  State<CommentsLearnView> createState() => _CommentsLearnViewState();
}

class _CommentsLearnViewState extends State<CommentsLearnView> {
  late final IPostService postService;
  bool _isLoading = false;
  List<CommentModel>? _commentsItem;
  @override
  void initState() {
    super.initState();
    postService = PostService();
    fetchItemWithId(widget.postId ?? 0);
  }

  void _chanceLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchItemWithId(int postId) async {
    _chanceLoading();
    _commentsItem = await postService.fetchRelatedCommetsWithPostId(postId);
    _chanceLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Text(_commentsItem?[index].email ?? ""),
          );
        },
        itemCount: _commentsItem?.length ?? 0,
      ),
    );
  }
}
