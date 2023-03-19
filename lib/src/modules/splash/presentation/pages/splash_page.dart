import 'package:flutter/material.dart';
import 'package:paje/src/modules/auth/presentation/pages/login_page.dart';
import 'package:paje/src/core/const/paje_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      Future.delayed(Duration(seconds: 3)).then(
        (value) => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => LoginPage(),
          ),
        ),
      );
    });

    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.fastOutSlowIn,
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.forward();
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: PajeColors.primary,
          ),
          child: ScaleTransition(
            scale: animation,
            child: Column(
              children: [
                Flexible(
                  flex: 5,
                  fit: FlexFit.tight,
                  child: Hero(
                    tag: 'PajeFull_w',
                    child: Image.asset('assets/images/PajeFull_w.png'),
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Hero(
                    tag: 'TRF5_w',
                    child: Image.asset('assets/images/TRF5_w.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
