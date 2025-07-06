import 'package:flutter/material.dart';

class Searchbar extends StatefulWidget{
  const Searchbar({super.key});

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar>{

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (BuildContext context, SearchController controller){
        return SearchBar(
          controller: controller,
          padding: const WidgetStatePropertyAll<EdgeInsets>(EdgeInsets.all(12)),
          onTap: (){
            controller.openView();
          },
          onChanged: (value){
            controller.openView();
          },
          leading: const Icon(Icons.search),
          trailing: [
            TextButton(onPressed: ()=>{}, child: Icon(Icons.person_add_alt_1,size: 25,)),
          ],
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller){
        return List<ListTile>.generate(5, (int index){
          final String item = 'item $index';
          return ListTile(
            title: Text(item),
            onTap: (){
              setState(() {
                controller.closeView(item);
              });
            },
          );
        });
      },
      );
  }
}