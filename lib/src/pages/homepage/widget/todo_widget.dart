part of '../homepage_page.dart';

class TodoWidget extends StatefulWidget {
  final String title;
  final String reward;
  const TodoWidget({required this.title,required this.reward,Key? key}) : super(key: key);

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
   bool value = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(

            tileColor: Colors.grey,
            activeColor: Colors.red,
            checkColor: Colors.deepPurple,
            selectedTileColor: Colors.teal,

            title: Text(widget.title,style: TextStyle(
              decoration: value ? TextDecoration.lineThrough : TextDecoration.none,

            ),),
            subtitle: Text(widget.reward),
            selected: value,

            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            value: value, onChanged:(val){
              setState((){
                value = val!;
              });
        }),
        SizedBox(
          height: 3,
        )
      ],
    );
  }
}
