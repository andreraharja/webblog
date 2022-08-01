import 'package:flutter/material.dart';
import 'api_content.dart';
import 'list_content.dart';
import 'model_content.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeContent> createState() => _HomeContentPageState();
}

class _HomeContentPageState extends State<HomeContent> {
  List<DataContent> lsDataContent = [];
  List<DataContent> lsBackupContent = [];
  TextEditingController searchText = TextEditingController();
  bool isLoading = true;

  @override
  void initState() {
    initData();
    super.initState();
  }

  Future<void> initData() async {
    lsDataContent = await getDataContent();
    lsBackupContent.addAll(lsDataContent);
    setState(() {
      isLoading = false;
    });
  }

  void filterResult(String query) {
    setState(() {
      isLoading = true;
    });
    List<DataContent> dummySearchList = [];
    dummySearchList.addAll(lsBackupContent);
    if (query.isNotEmpty) {
      List<DataContent> dummyListData = [];
      for (var item in dummySearchList) {
        if (item.title!.toUpperCase().contains(query.toUpperCase())) {
          dummyListData.add(item);
        }
      }
      lsDataContent.clear();
      lsDataContent.addAll(dummyListData);
      setState(() {
        isLoading = false;
      });
      return;
    } else {
      lsDataContent.clear();
      lsDataContent.addAll(lsBackupContent);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
                onChanged: (value) {
                  filterResult(value);
                },
                controller: searchText,
                decoration: const InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))))),
            const SizedBox(
              height: 10,
            ),
            isLoading
                ? const CircularProgressIndicator()
                : ListContent(lsDataContent: lsDataContent)
          ],
        ),
      ),
    );
  }
}
