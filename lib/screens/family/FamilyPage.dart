import 'package:flutter/material.dart';
import 'package:nice_buttons/nice_buttons.dart';
import 'package:shophouse/common/constant/colors.dart';
import 'package:shophouse/common/widgets/layout/header.dart';
import 'package:shophouse/screens/family/components/familyButton.dart';

class FamilyPage extends StatefulWidget {
  const FamilyPage({Key? key}) : super(key: key);

  @override
  _FamilyPageState createState() => _FamilyPageState();
}

class _FamilyPageState extends State<FamilyPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: <Widget>[
              Flexible(
                fit: FlexFit.loose,
                child: const Header(
                    title: "Famille",
                    content:
                        "Remplissez votre panier et planifier vos repas : en famille !"),
              ),
              Expanded(
                  //fit: FlexFit.loose,
                  flex: 4,
                  child: Column(
                    children: [
                      FamilyButton(btnName: "familyCart"),
                      FamilyButton(btnName: "familyPlanning"),
                    ],
                  )),
              Expanded(
                flex: 2,
                child: Container(),
              )
            ],
          ),
        );
      },
    );
  }
}
