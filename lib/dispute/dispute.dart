import 'package:dispute_system/dispute/dispute_details.dart';
import 'package:dispute_system/dispute/dispute_model.dart';
import 'package:dispute_system/service.dart';
import 'package:flutter/services.dart';
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
  Future<List<DisputeDataModel>>? disputeData;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    disputeData = Services().getDisputeData(context);
    setState(() {});
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
                        child: FutureBuilder<List<DisputeDataModel>>(
                          future: disputeData,
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
                            List<dynamic>? dispute = snapshot.data;
                            log(snapshot.data.toString());
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
                                                  DisputeDetails(
                                                      data: dispute![index])));
                                      },
                                      child: disputeBox(
                                          dispute?[index].dateDisputed,
                                          dispute?[index].offence,
                                          dispute?[index].points,
                                          dispute?[index]
                                              .resolutionStatus
                                              .toString()));
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

class disputeBox extends StatelessWidget {
  const disputeBox(
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

                Text(
                  status!,
                  overflow: TextOverflow.ellipsis,
                  style:
                      TextStyles().blackTextStyle400().copyWith(fontSize: 12),
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
              height: 20,
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
