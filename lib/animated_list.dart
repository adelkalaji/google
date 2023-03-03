import 'package:flutter/material.dart';

class AnimatedListScreen extends StatelessWidget {
  const AnimatedListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final items = [];
    final GlobalKey<AnimatedListState> key = GlobalKey();
    // ignore: no_leading_underscores_for_local_identifiers
    void _addItem() {
      items.insert(0, "Item ${items.length + 1}");
      key.currentState!.insertItem(0, duration: const Duration(seconds: 1));
    }

    // ignore: no_leading_underscores_for_local_identifiers
    void _removeItem(int index) {
      key.currentState!.removeItem(index, (_, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: const Card(
            margin: EdgeInsets.all(10),
            color: Colors.purple,
            child: ListTile(
              title: Text(
                'Deleted',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        );
      }, duration: const Duration(milliseconds: 300));
      items.remove(index);
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          elevation: 0.0,
          title: const Text('Animated List'),
          centerTitle: true,
          leading: Container(),
        ),
        body: Column(
          children: [
            const SizedBox(height: 10),
            IconButton(onPressed: _addItem, icon: const Icon(Icons.add)),
            Expanded(
                child: AnimatedList(
                    padding: const EdgeInsets.all(10),
                    key: key,
                    initialItemCount: 0,
                    itemBuilder: (context, index, animation) {
                      return SizeTransition(
                        key: UniqueKey(),
                        sizeFactor: animation,
                        child: Card(
                          margin :const EdgeInsets.all(10),
                          color: Colors.purple,
                          child: ListTile(title: Text(items[index],
                          style:const TextStyle(fontSize: 24) ,
                          ),
                          trailing: IconButton(icon: const Icon(Icons.delete),onPressed: (){_removeItem(index);},),),
                        ),
                      );
                    }))
          ],
        ));
  }
}
