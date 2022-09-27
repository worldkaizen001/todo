part of " ../onboarding_page.dart";



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

OnBoardingWidget(image: TodoImages.defaultPic, skipTextColor: const Color(0xff555555),subTitleTextColor: const Color(0xff303030).withOpacity(0.8), titleTextColor: const Color(0xff303030), color: const Color(0xffFDFDFD),skip: 'Skip',title: 'A place to Vent', subTitle: 'Share how you feel with people who can relate.',next: '',),
OnBoardingWidget(skipTextColor: const Color(0xffffffff),subTitleTextColor:const Color(0xffffffff).withOpacity(0.8), titleTextColor: const Color(0xffffffff),color: const Color(0xff353535),image: '',skip: 'Skip',title: 'Support Group', subTitle: 'Join various circles to be part of a particular relatable people.',next: '',),
OnBoardingWidget(skipTextColor: const Color(0xff555555),subTitleTextColor: const Color(0xff303030).withOpacity(0.8), titleTextColor: const Color(0xff303030),color: const Color(0xffFDFDFD),image: '',skip: '',title: 'Conversations', subTitle: 'Join & Create spaces to vent with friends and encourage each other',next: 'Next',)];
