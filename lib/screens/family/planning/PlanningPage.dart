import 'package:flutter/material.dart';
import 'package:shophouse/Model/Cart.dart';
import 'package:shophouse/Model/Family.dart';
import 'package:shophouse/Model/Product.dart' as product;
import 'package:shophouse/common/constant/colors.dart';
import 'package:shophouse/common/widgets/layout/Calendar.dart';
import 'package:shophouse/screens/cart/cart/components/ListProduct.dart';
import 'package:shophouse/services/Api/repositories/cart/CartFetcher.dart';
import 'package:shophouse/services/Api/repositories/family/FamilyFetcher.dart';

class PlanningPage extends StatefulWidget {
  final Family family;
  const PlanningPage({Key? key, required this.family}) : super(key: key);

  @override
  _PlanningPageState createState() => _PlanningPageState();
}

class _PlanningPageState extends State<PlanningPage> {
  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Calendar()],
          ),
        ));
  }
}
