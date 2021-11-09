import 'package:flutter/material.dart';
import 'package:shophouse/common/constant/colors.dart';

class PlanningCard extends StatefulWidget {
  const PlanningCard({Key? key}) : super(key: key);

  @override
  _PlanningCardState createState() => _PlanningCardState();
}

class _PlanningCardState extends State<PlanningCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        height: 180,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.20),
                spreadRadius: 0,
                blurRadius: 10,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
            color: primaryColor,
            border: Border.all(color: primaryColorBorder, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      "Midi",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontSize: 21,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    alignment: Alignment.bottomLeft,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          height: 5,
                          width: 34,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xffFFC88C),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          height: 5,
                          width: 34,
                        ),
                      ],
                    ),
                    alignment: Alignment.topRight,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        height: 120,
                        child: Image.asset(
                          "assets/images/illustrations/salad.png",
                          fit: BoxFit.fitHeight,
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      flex: 3,
                      child: Flex(
                        direction: Axis.vertical,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Salade",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      fontSize: 21,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500)),
                          Text("4 articles ne figurent pas dans votre panier.",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    color: Colors.white.withOpacity(0.6),
                                    fontWeight: FontWeight.w300,
                                  )),
                          Text("proposé par Orlane",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    color: Colors.white,
                                  ))
                        ],
                      ))
                ],
              ),
            )
          ],
        ));
  }
}
