import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/11-image_learn.dart';
import 'package:kartal/kartal.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({super.key});

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> with ProductSheetMixin {
  Color _backgroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final result = showModalBottomSheet(
              context: context,
              backgroundColor: _backgroundColor,
              barrierColor: Colors.transparent,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(24))),
              builder: (context) {
                return _CustomSheet(backgroundColor: _backgroundColor);
              });
          if (result is bool) {
            setState(() {
              _backgroundColor = Colors.red;
            });
          }
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            showCustomSheet(context, ImageLearn());
          },
          child: Text('text'),
        ),
      ),
    );
  }
}

class _CustomSheet extends StatefulWidget {
  const _CustomSheet({
    required Color backgroundColor,
  });

  @override
  State<_CustomSheet> createState() => _CustomSheetState();
}

class _CustomSheetState extends State<_CustomSheet> {
  Color _backgroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: _backgroundColor,
      child: SafeArea(
        child: Padding(
          padding: context.padding.medium,
          child: SizedBox(
            width: context.sized.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 24,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 0,
                          right: 0,
                          child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                                print('closed');
                              },
                              child: const Icon(
                                Icons.close,
                                color: Colors.black,
                              ))),
                      Divider(
                        color: Colors.red,
                        thickness: 4,
                        indent: context.sized.width * 0.3,
                        endIndent: context.sized.width * 0.3,
                      ),
                    ],
                  ),
                ),
                Text('data',
                    style: context.general.textTheme.headlineLarge?.copyWith(
                      color: Colors.black,
                    )),
                Image.network(
                  'https://picsum.photos/200/300',
                  height: 200,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _backgroundColor = Colors.red;
                      });
                      Navigator.of(context).pop<bool>(true);
                    },
                    child: const Text('data'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

mixin ProductSheetMixin {
  Future showCustomSheet(BuildContext context, Widget child) async {
    return showModalBottomSheet(
        context: context,
        barrierColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
        builder: (context) {
          return CustomMainSheet(child: child);
        });
  }
}

class CustomMainSheet extends StatelessWidget {
  const CustomMainSheet({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: context.padding.medium,
        child: SizedBox(
          width: context.sized.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const _BaseSheetHeader(),
              Expanded(child: child),
            ],
          ),
        ),
      ),
    );
  }
}

class _BaseSheetHeader extends StatelessWidget {
  const _BaseSheetHeader();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    print('closed');
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ))),
          Divider(
            color: Colors.red,
            thickness: 4,
            indent: context.sized.width * 0.3,
            endIndent: context.sized.width * 0.3,
          ),
        ],
      ),
    );
  }
}
