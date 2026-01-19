import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Contact {
  final String id;
  final String name;
  Contact({required this.name}) : id = Uuid().v4();
}

class ContactBook extends ValueNotifier<List<Contact>> {
  ContactBook._sharedInstance() : super([
    Contact(name: 'Foo Bar'),
    Contact(name: 'Baz Qux'),
    Contact(name: 'John Doe'),
  ]);
  static final ContactBook _shared = ContactBook._sharedInstance();
  factory ContactBook() => _shared;

  int get length => value.length;

  void add({required Contact contact}) {
    List<Contact> newList = [...value, contact];
    value = newList;
  }

  void remove({required Contact contact}) {
      final currentList = value;
      final updatedList = currentList.where((item) => item.id != contact.id).toList();
    value = updatedList;
  }

  Contact? contact({required int atIndex}) =>
      value.length > atIndex ? value[atIndex] : null;
}
