import 'package:flutter/material.dart';
import 'package:webblog/model_content.dart';

class DetailContent extends StatelessWidget {
  const DetailContent({Key? key, required this.dataContent}) : super(key: key);
  final DataContent dataContent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Blog'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dataContent.title!,
              style: Theme.of(context).textTheme.headline6,
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              dataContent.body!,
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
      ),
    );
  }
}
