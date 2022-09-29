
part of 'package:stacks/src/pages/boarding/onboarding_page.dart';



class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final  liquidController = LiquidController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
            children: [
              LiquidSwipe(
                liquidController: liquidController,
                enableLoop: false,
                enableSideReveal: true,
                fullTransitionValue: 202,
                pages: pages,
                slideIconWidget: const Icon(Icons.arrow_back_ios,size: 24,),
                positionSlideIcon: 0.5,
                waveType: WaveType.liquidReveal,

              ),

            ]
        ),
      ),
    );
  }
}

final pages = [

 OnBoardingWidget(image: TodoImages.defaultPic, skipTextColor: const Color(0xff555555), titleTextColor: const Color(0xff303030), color: const Color(0xffFDFDFD),skip: 'Skip',title: '“Procrastination usually results in sorrowful regret. Today’s duties put off tomorrow give us a double burden to bear; the best way is to do them in their proper time.”',next: '',),
const OnBoardingWidget(skipTextColor: const Color(0xffffffff), titleTextColor: const Color(0xffffffff),color: const Color(0xff353535),image: '',skip: 'Skip',title: 'Support Group', next: '',),
const OnBoardingWidget(skipTextColor: const Color(0xff555555), titleTextColor: const Color(0xff303030),color: const Color(0xffFDFDFD),image: '',skip: '',title: 'Conversations',next: 'Next',)];
