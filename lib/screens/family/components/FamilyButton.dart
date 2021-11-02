import 'package:flutter/material.dart';
import 'package:nice_buttons/nice_buttons.dart';
import 'package:shophouse/Model/Family.dart';
import 'package:shophouse/common/constant/colors.dart';
import 'package:shophouse/screens/family/cart/CartPage.dart';

class FamilyButton extends StatefulWidget {
  final String btnName;
  final Family family;
  const FamilyButton({Key? key, required this.btnName, required this.family})
      : super(key: key);

  @override
  _FamilyButtonState createState() => _FamilyButtonState();
}

class _FamilyButtonState extends State<FamilyButton> {
  Widget _generateFamilyCartBtn() {
    return Padding(
      padding: EdgeInsets.all(14),
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        clipBehavior: Clip.none,
        children: [
          NiceButtons(
            height: 160,
            startColor: secondaryColor,
            endColor: secondaryColorBrighter,
            borderRadius: 12,
            borderThickness: 0,
            stretch: true,
            gradientOrientation: GradientOrientation.Horizontal,
            onTap: (value) {
              Navigator.of(context).push(new PageRouteBuilder(
                  opaque: true,
                  transitionDuration: const Duration(milliseconds: 500),
                  pageBuilder: (BuildContext context, _, __) {
                    return CartPage(family: widget.family);
                  },
                  transitionsBuilder:
                      (_, Animation<double> animation, __, Widget child) {
                    return SlideTransition(
                      child: child,
                      position: Tween<Offset>(
                        begin: const Offset(2, 0),
                        end: Offset.zero,
                      ).animate(animation),
                    );
                  }));
            },
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Panier de Famille",
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white)),
                        Text("Que manque t’il dans le frigo aujourd’hui?",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    color: Colors.white.withOpacity(0.6),
                                    fontSize: 14)),
                        Text("14 articles au total",
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                    fontSize: 15))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              top: -14,
              child: Container(
                height: 145,
                child: Image.asset(
                    "assets/images/illustrations/shopping-cart-family.png"),
              ))
        ],
      ),
    );
  }

  Widget _generateFamilyPlanningBtn() {
    return Padding(
      padding: EdgeInsets.all(14),
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        clipBehavior: Clip.none,
        children: [
          NiceButtons(
            height: 160,
            startColor: primaryColor,
            endColor: primaryColorDarker1,
            borderRadius: 12,
            borderThickness: 0,
            stretch: true,
            gradientOrientation: GradientOrientation.Horizontal,
            onTap: (value) {},
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Planning des repas",
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white)),
                        Text("Plannifiez et votez pour vos repas préférées.",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    color: Colors.white.withOpacity(0.6),
                                    fontSize: 14)),
                        Text("Vous n’avez pas finis de voter !",
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                    fontSize: 15))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              top: -14,
              child: Container(
                height: 145,
                child: Image.asset("assets/images/illustrations/clock.png"),
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (widget.btnName == "familyCart")
        ? _generateFamilyCartBtn()
        : _generateFamilyPlanningBtn();
  }
}
