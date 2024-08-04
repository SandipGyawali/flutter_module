import 'package:flutter/material.dart';
import 'package:flutter_m/components/button.dart';
import 'package:flutter_m/utils/sql_helper.dart';

class LiteHome extends StatefulWidget {
  const LiteHome({super.key});

  @override
  State<LiteHome> createState() => LiteHomeState();
}

class LiteHomeState extends State<LiteHome> {
  List<Map<String, dynamic>> _journals = [];
  bool _isLoading = true;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _refreshJournals();
    print("-------->numbers of journal Items: ${_journals.length}");
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
  }

  void _refreshJournals() async {
    final data = await SqlHelper.getItems();

    setState(() {
      _journals = data;
      _isLoading = false;
    });
  }

  Future<void> _addItem() async {
    await SqlHelper.createItem(
      _titleController.text,
      _descriptionController.text,
    );
    _refreshJournals();
    print("------> journal entry: ${_journals.length}");
  }

  Future<void> _updateItem(int id) async {
    await SqlHelper.updateItem(
      id,
      _titleController.text,
      _descriptionController.text,
    );
    _refreshJournals();
  }

  Future<void> _deleteItem(int id) async {
    await SqlHelper.deleteItem(id);
    _refreshJournals();
  }

  void _showForm(int? id) async {
    if (id != null) {
      final existingJournal =
          _journals.firstWhere((element) => element["id"] == id);
      _titleController.text = existingJournal["title"];
      _descriptionController.text = existingJournal["description"];
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      constraints: const BoxConstraints.expand(),
      enableDrag: true,
      elevation: 5,
      backgroundColor: Colors.white,
      builder: (_) => Container(
        padding: const EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
          bottom: 10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 35),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(hintText: "Title"),
            ),
            const SizedBox(height: 35),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(hintText: "Description"),
            ),
            const SizedBox(height: 40),
            Button(
              label: id == null ? "Create New" : "Update",
              buttonBgColor: Colors.white,
              onPressed: () async {
                if (id == null) {
                  if (_titleController.text == "" &&
                      _descriptionController.text == "") {
                    print("--------->Item cannot be added empty");
                  } else {
                    await _addItem();
                  }
                } else {
                  await _updateItem(id);
                }

                _titleController.text = "";
                _descriptionController.text = "";
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lite"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade100,
      body: ListView.builder(
        itemCount: _journals.length,
        itemBuilder: (context, index) => Card(
          color: Colors.white,
          margin: const EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: 15,
            right: 15,
          ),
          child: ListTile(
            title: Text(_journals[index]["title"]),
            subtitle: Text(_journals[index]["description"]),
            trailing: SizedBox(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      _showForm(_journals[index]["id"]);
                    },
                    icon: const Icon(Icons.edit, color: Colors.grey),
                  ),
                  IconButton(
                    onPressed: () {
                      _deleteItem(_journals[index]["id"]);
                    },
                    icon: const Icon(Icons.delete, color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showForm(null);
          print("---->Look i clicked");
        },
        backgroundColor: Colors.white,
        clipBehavior: Clip.antiAlias,
        child: const Icon(Icons.add),
      ),
    );
  }
}
