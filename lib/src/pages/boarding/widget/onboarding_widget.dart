part of 'package:stacks/src/pages/boarding/onboarding_page.dart';

class OnBoardingWidget extends StatelessWidget {
  final String? skip;
  final String image;
  final String title;

  final String next;
  final Color titleTextColor;
  final Color skipTextColor;

  final Color color;

  const OnBoardingWidget({required this.skipTextColor,required this.titleTextColor,required this.color,required this.image,required this.title,this.skip,required this.next,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.only(top: 40,left: 25,right: 25),
      width: double.infinity,
      height: double.infinity,

      color: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const HomePage();
            }));
          }, child: Text('$skip',style: GoogleFonts.quicksand(
              textStyle:  TextStyle(
                color: skipTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,

              )),)),

          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Center(child: Image.asset(image)),
          ),
          const SizedBox(height: 80),
          Text(title,style: GoogleFonts.quicksand(
              textStyle:  TextStyle(
                color: titleTextColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,

              )),),
          const SizedBox(height: 10),

          const SizedBox(
            height: 90,
          ),
          Align(
            alignment: Alignment.topRight,
            child: TextButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return const HomePage();
              }));
            }, child:  Text(next,style: GoogleFonts.quicksand(
                textStyle: TextStyle(
                  color: const Color(0xff303030).withOpacity(0.95),
                  fontSize: 22,
                  fontWeight: FontWeight.w500,

                )),),),
          )



        ],
      ),
    );
  }
}