
import 'package:flutter/material.dart';

class AppLoaders extends StatefulWidget {

  final double height;
  final double width;
  final double radius;
  final bool reverse;

  const AppLoaders({
    required this.height,
    required this.width,
    required this.radius,
    this.reverse = false,
  });

  @override
  _AppLoadersState createState() => _AppLoadersState();
}

class _AppLoadersState extends State<AppLoaders>  with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<Color?> _color;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    )..repeat(reverse: true);

    if(widget.reverse){
      _color = ColorTween(
        begin: Colors.grey.withOpacity(0.1),
        end: Colors.grey.withOpacity(0.3),
      ).animate(animationController);
    }
    else{
      _color = ColorTween(
        begin: Colors.grey.withOpacity(0.3),
        end: Colors.grey.withOpacity(0.1),
      ).animate(animationController);
    }
  }

  @override
  void dispose(){
    animationController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _color,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
            color: _color.value!,
          ),
        );
      },
    );
  }
}