import 'package:flutter/material.dart';

class Listbuilder extends StatefulWidget {
  const Listbuilder({super.key});

  @override
  State<Listbuilder> createState() => _CounterViewState();
}

class _CounterViewState extends State<Listbuilder> {
  TextEditingController friendlistcontroller = TextEditingController();
  List friendlist = ["Sahrish", "Salman", "Shahrukh"];

  addvalue() {
    setState(() {
      friendlist.add("value");
    });
  }

  removevalue({myparameter}) {
    setState(() {
      friendlist.removeAt(myparameter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: friendlistcontroller,
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                setState(() {
                  friendlist.add(friendlistcontroller.text);

                  friendlistcontroller.clear();
                });
              },
              child: const Text("AddValue")),
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: friendlist.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 2),
              child: ListTile(
                tileColor: Colors.blueGrey,
                title: Text(friendlist[index]),
                trailing: IconButton(
                    onPressed: () {
                      removevalue(myparameter: index);
                    },
                    icon: const Icon(Icons.delete)),
              ),
            );
          },
        ),
      ),
    );
  }
}
