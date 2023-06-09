import 'dart:developer';

import 'package:dispute_system/demerit/demerit_details.dart';
import 'package:dispute_system/demerit/demerit_model.dart';
import 'package:dispute_system/demerit/demerit_provider.dart';
import 'package:dispute_system/login/login_provider.dart';
import 'package:dispute_system/theme.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:dispute_system/service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<DemeritDataModel>>? demeritData;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    demeritData = Services().getDemeritData(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<LoginProvider>(context, listen: false);

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hello ${state.firstName},",
                        style: TextStyles().defaultText(
                            20, FontWeight.bold, themes().secondaryColor),
                      ),
                      Text(
                        "${state.demeritPoints} points",
                        style: TextStyles()
                            .darkGreyTextStyle400()
                            .copyWith(color: Colors.blue),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Matric No: ${state.matricNo}',
                    style: TextStyles().darkGreyTextStyle400(),
                  ),
                  const SizedBox(
                    height: 10,
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
                    Text(
                      'Demerits',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles().blackTextStyle400(),
                    ),
                    Divider(
                      color: themes().tetiaryColor,
                    ),
                    Flexible(
                      child: SingleChildScrollView(
                        child: FutureBuilder<List<DemeritDataModel>>(
                          future: demeritData,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            if (snapshot.hasData) {
                              if (snapshot.data == null) {
                                return const Text("Empty");
                              }
                            }
                            var state = Provider.of<DemeritProvider>(context,
                                listen: false);
                            state.getDemerit(snapshot.data!);
                            List<dynamic>? demerit = snapshot.data;
                            return ListView.builder(
                                itemCount: snapshot.data?.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute<Widget>(
                                              builder: (BuildContext context) =>
                                                  DemeritDetails(
                                                      data: demerit![index])));
                                    },
                                    child: demeritBox(
                                        demerit?[index].date,
                                        demerit?[index].offence,
                                        demerit?[index].points,
                                        demerit?[index].status.toString()),
                                  );
                                });
                          },
                        ),
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
  const demeritBox(
    this.date,
    this.offence,
    this.points,
    this.status, {
    super.key,
  });
  final String? date;
  final String? offence;
  final int? points;
  final String? status;

  Color switchWithString(String status) {
    if (status.toLowerCase() == 'active') {
      return Colors.green;
    } else if (status.toLowerCase() == 'deleted') {
      return Colors.red;
    } else if (status.toLowerCase() == 'resolved') {
      return Colors.blue;
    } else
      return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  date.toString(),
                  overflow: TextOverflow.clip,
                  style: TextStyles().greyTextStyle400().copyWith(fontSize: 12),
                ),

                Container(
                  alignment: Alignment.center,
                  height: 31,
                  width: 65,
                  decoration: BoxDecoration(
                      color: switchWithString(status!).withOpacity(0.2),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: Text(
                    status!.replaceAll(RegExp(r'Status.'), '').toLowerCase(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles().blackTextStyle400().copyWith(
                        color: switchWithString(status!), fontSize: 12),
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
                Flexible(
                  child: Text(
                    offence!,
                    style: TextStyles().defaultText(
                        16, FontWeight.w500, themes().secondaryColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${points} points',
                  style: TextStyles()
                      .darkGreyTextStyle400()
                      .copyWith(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
