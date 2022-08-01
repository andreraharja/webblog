import 'package:flutter/material.dart';
import 'package:webblog/detail_content.dart';

import 'model_content.dart';

class ListContent extends StatelessWidget {
  const ListContent({
    Key? key,
    required this.lsDataContent,
  }) : super(key: key);

  final List<DataContent> lsDataContent;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
      itemCount: lsDataContent.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(lsDataContent[index].title!),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailContent(
                          dataContent: lsDataContent[index],
                        )));
          },
          leading: const Icon(Icons.newspaper),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          thickness: 2,
        );
      },
    ));
  }
}
