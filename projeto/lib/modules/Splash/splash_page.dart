import 'package:flutter/material.dart';
import 'package:leitor_cbarra/routes/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )
    ..repeat(reverse: false)
    ..forward();

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInExpo,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) =>
        {Navigator.pushReplacementNamed(context, AppRoutes.authCheck)});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFFF23827), Color(0xFF071C59)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _animation,
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Image.asset(
                    "assets/images/logo.png",
                  )),
            ),
            AnimatedOpacity(
                opacity: _animation.isCompleted ? 1.0 : 0.0,
                duration: const Duration(seconds: 2),
                child: Text(
                  'Estoque de materiais',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
