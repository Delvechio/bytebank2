import 'package:bytebank2/models/contact.dart';
import 'package:bytebank2/screens/contact_form.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final List<Contact> contacts = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          final Contact contact = contacts[index];
          return _ContactItem(contact);
        },
        itemCount: contacts.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(
                builder: (context) => ContactForm(),
              ))
              .then((newContact) => debugPrint(newContact.toString()),);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;

  _ContactItem(this.contact);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        title: Text(
          contact.name,
          style: TextStyle(fontSize: 24),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}