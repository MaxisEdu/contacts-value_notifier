import 'package:flutter/material.dart';
import 'package:vanillacontacts_course/contact.dart';
import 'package:vanillacontacts_course/new_contact_view.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
      routes: {'/new-contact': (context) => const NewContactView()},
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final contactBook = ContactBook();
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: ValueListenableBuilder(
        valueListenable: contactBook,
        builder: (context, contacts, child) => ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            final contact = contacts[index];
            return Dismissible(
              key: ValueKey(contact.id),
              child: ListTile(title: Text(contact.name),),
              onDismissed: (direction) => contacts.remove(contact),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/new-contact');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
