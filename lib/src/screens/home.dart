import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:my_diary/src/models/entry.dart';
import 'package:my_diary/src/providers/entry_provider.dart';
import 'package:my_diary/src/screens/entry.dart';
import 'package:my_diary/src/screens/entry2.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final entryProvider = Provider.of<EntryProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Journal'),
      ),
      body: StreamBuilder<List<Entry>>(
          stream: entryProvider.entries,
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    trailing:
                    Icon(Icons.edit, color: Theme.of(context).accentColor),
                    title: Row(
                      children: [
                        Text(
                          snapshot.data![index].entry,
                        ),
                        Text(
                          formatDate(DateTime.parse(snapshot.data![index].date),
                              [MM, ' ', d, ', ', yyyy]),
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              EntryScreen(entry: snapshot.data![index])));
                    },
                  );
                });
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => EntryScreen2()));
        },
      ),
    );
  }
}