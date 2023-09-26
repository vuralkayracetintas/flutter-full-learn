import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class AlertLearn extends StatelessWidget {
  @override
  AlertLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Alert Learn',
        ),
        automaticallyImplyLeading: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return const _ImageZoomDialog();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () => const _ImageZoomDialog(),
                child: const Text('Show Image Dialog'))
          ],
        ),
      ),
    );
  }
}

class UpdataDialog extends AlertDialog {
  UpdataDialog({Key? key, required BuildContext context})
      : super(
          key: key,
          title: const Text('Version Update!'),
          actions: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('update'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            )
          ],
        );
}

class _ImageZoomDialog extends StatelessWidget {
  const _ImageZoomDialog();

  @override
  Widget build(BuildContext context) {
    const String _imageUrl = 'https://picsum.photos/200';
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: InteractiveViewer(
        child: Image.network(
          _imageUrl,
          fit: BoxFit.cover,
          height: context.sized.width,
        ),
      ),
    );
  }
}
