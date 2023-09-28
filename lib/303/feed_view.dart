import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/service/1-post_model.dart';
import 'package:flutter_full_learn/202/service/post_service.dart';

class FeedView extends StatefulWidget {
  const FeedView({super.key});

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView>
    with AutomaticKeepAliveClientMixin {
  final IPostService _postService = PostService();
  late final Future<List<PostModel>?> _postItems;
  @override
  void initState() {
    super.initState();

    _postItems = _postService.fetchPostItemsAdvance();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {});
          },
        ),
        body: FutureBuilder(
          future: _postItems,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Placeholder();

              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());

              case ConnectionState.active:
                return const Center(child: CircularProgressIndicator());

              case ConnectionState.done:
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(snapshot.data?[index].body ?? ''),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text('No data'));
                }
            }
          },
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
