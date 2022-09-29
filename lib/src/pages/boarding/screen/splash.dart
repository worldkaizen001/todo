part of 'package:stacks/src/pages/boarding/onboarding_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void> navigate ()async{
    await Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> OnBoardingScreen()));
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,

      body: Column(
        children: [
          Center(
            child: Text('Stacks',style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 30,
                  fontWeight: FontWeight.w500,

                )),),
          ),

        ],
      ),
    );
  }
}
