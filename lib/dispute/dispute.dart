import 'package:dispute_system/dispute/dispute_details.dart';
import 'package:dispute_system/theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:developer';

class DisputeWidget extends StatefulWidget {
  const DisputeWidget({super.key});

  @override
  State<DisputeWidget> createState() => _DisputeWidgetState();
}

class _DisputeWidgetState extends State<DisputeWidget> {
  final TextEditingController reasonController = TextEditingController();

  Future escalate() async {
    showDialog(
        context: context,
        builder: (context) => SizedBox(
              height: 40,
              width: 40,
              child: AlertDialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  CircularProgressIndicator(
                      color: Theme.of(context).primaryColor)
                ],
                actionsAlignment: MainAxisAlignment.center,
              ),
            ));
    Response r;
    Map<String, dynamic> body = {
     // 'demeritId':demeritId,
      'reason': reasonController.text
    };
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: themes().whiteColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: themes().appBarColor,
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Disputes",
                        style: TextStyles().defaultText(
                            20, FontWeight.bold, themes().secondaryColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   'Disputes',
                    //   overflow: TextOverflow.ellipsis,
                    //   style: TextStyles().blackTextStyle400(),
                    // ),
                    // Divider(
                    //   color: themes().tetiaryColor,
                    // ),
                    Flexible(
                      child: SingleChildScrollView(
                        child: ListView.builder(
                            itemCount: 9,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return const demeritBox();
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class demeritBox extends StatelessWidget {
  const demeritBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute<Widget>(
                builder: (BuildContext context) => const DisputeDetails()));
      },
      child: Card(
        elevation: 4,
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '2-10-2022',
                    style:
                        TextStyles().greyTextStyle400().copyWith(fontSize: 12),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 31,
                    width: 65,
                    decoration: BoxDecoration(
                        color: themes().yellowColor.withOpacity(0.2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15))),
                    child: Text(
                      'pending',
                      style: TextStyles()
                          .blackTextStyle400()
                          .copyWith(color: themes().yellowColor, fontSize: 12),
                    ),
                  ),
                  // Text(
                  //   'ACTIVE',
                  //   style: TextStyles().blackTextStyle400().copyWith(
                  //       fontWeight: FontWeight.w500,
                  //       color: Colors.green),
                  // )
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Chicken',
                    style: TextStyles().defaultText(
                        16, FontWeight.w500, themes().secondaryColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '20 points',
                    style: TextStyles()
                        .darkGreyTextStyle400()
                        .copyWith(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
