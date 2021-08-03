import 'package:flutter/material.dart';

class SideBarMenu extends StatefulWidget {
  final Size size;

  const SideBarMenu({Key? key, required this.size}) : super(key: key);

  @override
  _SideBarMenuState createState() => _SideBarMenuState();
}

class _SideBarMenuState extends State<SideBarMenu> {
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width * 0.2,
      height: widget.size.height,
      child: Wrap(
        children: [
          buildFirstMenu(context),
          buildSecondMenu(context),
          buildThirdMenu(context)
        ],
      ),
    );
  }

  Widget buildThirdMenu(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: IconButton(
        icon: Icon(
          Icons.settings,
          size: 28,
        ),
        onPressed: () {},
      ),
    );
  }

  Widget buildSecondMenu(BuildContext context) {
    return Container(
      height: widget.size.height * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          3,
          (index) => RotatedBox(
            quarterTurns: -1,
            child: TextButton(
              onPressed: () {
                this.index = index;
                setState(() {});
              },
              // style: TextButton.styleFrom(
              //   elevation: 0,
              //   animationDuration: const Duration(milliseconds: 600),
              //   primary:
              //       this.index == index ? Colors.black87 : Colors.grey[400],
              //   shape: BeveledRectangleBorder(),
              //   textStyle: Theme.of(context).textTheme.headline4,
              // ),
              style: ButtonStyle(
                overlayColor: MaterialStateColor.resolveWith(
                    (states) => Colors.transparent),
                foregroundColor: MaterialStateColor.resolveWith((states) =>
                    this.index == index ? Colors.black87 : Colors.grey),
                textStyle: MaterialStateProperty.resolveWith(
                    (states) => Theme.of(context).textTheme.headline4),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Bakery '),
                  SizedBox(height: 10),
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: this.index == index ? Color(0xfffda58f) : null,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFirstMenu(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: widget.size.height * 0.25,
      child: Column(
        children: [
          IconButton(
            icon: Icon(
              Icons.menu,
              size: 28,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              size: 28,
            ),
            onPressed: () {
              // print('This search');
            },
          ),
        ],
      ),
    );
  }
}
