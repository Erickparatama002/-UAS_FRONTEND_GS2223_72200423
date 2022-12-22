import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uas_frontend_72200423/mahasiswa/mahasiswa_get.dart';

import 'Mahasiswa_add1.dart';

class Mahasiswa_get extends StatefulWidget {
  const Mahasiswa_get({super.key});

  @override
  State<Mahasiswa_get> createState() => _Mahasiswa_getState();
}

class _Mahasiswa_getState extends State<Mahasiswa_get> {
  List _get = [];

  @override
  void initState() {
    super.initState();
    _getDataMhs();
  }

  Future _getDataMhs() async {
    try {
      final response = await http.get(
          Uri.parse('https://jsonplaceholder.typicode.com/comments'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          _get = data;
        });
      }
    } catch (e) {}
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
        },
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Colors.blue,
        // child: Container(height: 50.0),
      ),
      body: RefreshIndicator(
        onRefresh: _getDataMhs,
         child: ListView.builder(
              itemCount: _get.length,
              itemBuilder: (context, index  ) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    title: Text(_get[index]['postId'].toString() + " - " + _get[index]['id'].toString()),
                    subtitle: Text(_get[index]['name'].toString() + " - " + _get[index]['email'].toString()),

                    trailing: PopupMenuButton(
                      icon: Icon(Icons.more_vert),
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                              value: 'edit',
                              child: Text('Edit'),
                        ),
                          PopupMenuItem(
                            value: 'delete',
                            child: Text('Delete'),
                            onTap: () async {
                            },
                          ),
                        ];
                      },
                    ),
                  ),
                );
              }
         ),
      ),
    );
  }
}