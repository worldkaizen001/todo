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

            // tileColor:  const Color(0xffffffff),
            activeColor: Colors.deepPurple,


            // checkColor: Colors.yellow,



            title: Text(widget.title,style: GoogleFonts.quicksand(
                textStyle:  TextStyle(
                  decoration: value ? TextDecoration.lineThrough : TextDecoration.none,

                  color: const Color(0xffffffff),
                  fontSize: 17,
                  fontWeight: FontWeight.w500,

                )),
           ),
            subtitle: Text(widget.reward,style: GoogleFonts.quicksand(
                textStyle:  const TextStyle(

                  color:  Color(0xffffffff),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,

                ))),
            selected: value,

            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            value: value, onChanged:(val){
              setState((){
                value = val!;
              });
        }),
        const Divider(
          height: 4,
          color: Colors.grey,
        )
      ],
    );
  }
}
