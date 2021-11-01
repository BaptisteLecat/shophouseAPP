import 'package:flutter/material.dart';
import 'package:shophouse/Model/Family.dart';
import 'package:shophouse/common/widgets/layout/header.dart';
import 'package:shophouse/screens/family/components/familyButton.dart';
import 'package:shophouse/services/Api/repositories/family/FamilyFetcher.dart';

class FamilyPage extends StatefulWidget {
  const FamilyPage({Key? key}) : super(key: key);

  @override
  _FamilyPageState createState() => _FamilyPageState();
}

class _FamilyPageState extends State<FamilyPage> {
  late Future<Family> _familyData;

  void initState() {
    _familyData = FamilyFetcher().getFamilyOfUser();
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

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
                child: FutureBuilder(
                    future: _familyData,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        if (snapshot.hasData && snapshot.data != null) {
                          Family family = snapshot.data as Family;

                          return Column(
                            children: [
                              FamilyButton(
                                btnName: "familyCart",
                                family: family,
                              ),
                              FamilyButton(
                                  btnName: "familyPlanning", family: family),
                            ],
                          );
                        } else {
                          return Center(
                            child: Text("${snapshot.error}"),
                          );
                        }
                      }
                    }),
              ),
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
