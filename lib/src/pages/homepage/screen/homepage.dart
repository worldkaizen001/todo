part of '../homepage_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  String formatTime (Duration duration){
    String twoDigits (int n) => n.toString().padLeft(2,'0');

    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if(duration.inHours > 0) hours,minutes,seconds
    ].join(':');
  }

  final  timeOfDay = TimeOfDay.now();



  late Box<TodoModel> todoBox;

  @override
  void initState(){
    
    todoBox = Hive.box<TodoModel>('box');
    initialization();
    super.initState();
  }




  void initialization() async {
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }





  @override
  Widget build(BuildContext context) {

    // TodoModel todoModel = box.get('');


    return Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff141414),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
        child: const Icon(Iconsax.add,size: 30,),
          onPressed: (){
            showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: const Color(0xff141414),
                shape: const RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(20))),
                context: context,
                builder: (context) {
                  return const AddTodoWidget();
                });
      }),
      appBar: AppBar(
        toolbarHeight: 80,
        leadingWidth: 95,

        leading: Center(
          child: Text('Stacks',style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                color: Color(0xffffffff),
                fontSize: 25,
                fontWeight: FontWeight.w500,

              )),),
        ),

        backgroundColor: Colors.deepPurple,


        // actions: [
        //   Text(timeOfDay.toString()),
        // ],
      ),
      body: Column(
        children: [
         SizedBox(
            height: 500,
            child: ValueListenableBuilder(

              valueListenable: todoBox.listenable(),
              builder: (BuildContext context, Box<TodoModel> todos, Widget? child) {

                List<int> keys = todos.keys.cast<int>().toList();

                return todoBox.isEmpty? const EmptyState(): ListView.builder(
                    itemCount: box.length,

                    // itemCount: db.todoModelList.length,
                    itemBuilder: (context,index){
                      // var data = box.values[index];
                      // var data = db.todoModelList[index];
                      final int key = keys[index];
                      final TodoModel? todo = todos.get(key);
                      return Slidable(

                          key: const ValueKey(0),
                          endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              dismissible: DismissiblePane(onDismissed: () {
                                setState((){
                                  todoBox.deleteAt(index);


                                  // db.todoModelList.removeAt(index);
                                  // db.updateDatabase();
                                });


                              }),
                              children: [
                                SlidableAction(

                                  onPressed: (v){
                                    todoBox.deleteAt(index);
                                  },
                                  backgroundColor: const Color(0xFFFE4A49),
                                  foregroundColor: Colors.white,
                                  icon: Iconsax.trash,
                                  label: 'Delete',

                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ]),

                          child: TodoWidget(title: todo!.title,reward: todo.reward,));
                    });
              },

            ),
          )
        ]
      )
    );
  }
}


class AddTodoWidget extends StatefulWidget {

  const AddTodoWidget({Key? key}) : super(key: key);

  @override
  State<AddTodoWidget> createState() => _AddTodoWidgetState();
}

class _AddTodoWidgetState extends State<AddTodoWidget> {
  final formGlobalKey = GlobalKey<FormState>();
  final TextEditingController  titleController = TextEditingController();
  final TextEditingController  rewardController = TextEditingController();
  late Box<TodoModel> todoBox;

  // TodoDataBase db = TodoDataBase();

  @override
  void initState(){
    todoBox = Hive.box<TodoModel>('box');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(



      margin: const EdgeInsets.only(left: 23, right: 23, top: 25, bottom: 10),
      padding:
      EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: const BoxDecoration(


          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          color:  Color(0xff141414),),
      child: Form(
        key: formGlobalKey ,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title',
                  style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 17,
                        fontWeight: FontWeight.w500,

                      )),
                ),
                TextFormField(
                  style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,

                      )),
                  controller: titleController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please enter title';
                    }
                    return null;

                  },
                  maxLines: 1,

                  onChanged: (val) {

                  },

                  decoration:  InputDecoration(
                      hintStyle: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                            color: Color(0xff555555),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,

                          )),



                      hintText: 'What do you want vent about'),

                ),
                const SizedBox(
                  height: 17,
                ),
                Text(
                  'Reward',
                  style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 17,
                        fontWeight: FontWeight.w500,

                      )),
                ),
                TextFormField(
                  style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,

                      )),
                  controller: rewardController,
                  maxLines: 1,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please enter description';
                    }
                    return null;

                  },
                  onChanged: (val) {

                  },
                  decoration:  InputDecoration(
                      hintStyle: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                            color: Color(0xff555555),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,

                          )),


                      hintText: 'Share more details about space'),
                ),
                const SizedBox(
                  height: 35,
                ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
                child: SizedBox(
                  height: 37,
                  width: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple,


                    ),
                      onPressed: (){
                        if(formGlobalKey.currentState!.validate()){
                          todoBox.add(TodoModel(title: titleController.text.trim(), reward: rewardController.text.trim()));

                          setState((){});
                          Navigator.pop(context);
                          titleController.clear();
                          rewardController.clear();

                        }
                      }, child:  Text('Add Todo',style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,

                      )),)),
                ))
          ],
        ),
      ),
    );
  }
}



class EmptyState extends StatelessWidget {
  const EmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('New Empty',style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                color: Color(0xffffffff),
                fontSize: 17,
                fontWeight: FontWeight.w500,

              )),),
          Center(child: Image.asset(TodoImages.defaultPic,height: ScreenSize.height(context) * 0.5,width: ScreenSize.width(context) * 0.5,))
        ],
      ),
    );
  }
}

