import 'package:dispute_system/dispute/dispute_model.dart';
import 'package:dispute_system/theme.dart';
import 'package:flutter/material.dart';
import 'package:dispute_system/textbox.dart';

class DisputeDetails extends StatefulWidget {
  DisputeDataModel? data;
  DisputeDetails({super.key, this.data});

  @override
  State<DisputeDetails> createState() => _DisputeDetailsState();
}

class _DisputeDetailsState extends State<DisputeDetails> {
  TextEditingController porterNameController = TextEditingController();
  TextEditingController offenseController = TextEditingController();

  TextEditingController statusController = TextEditingController();
  TextEditingController pointController = TextEditingController();
  TextEditingController hallController = TextEditingController();
  TextEditingController matricController = TextEditingController();
  TextEditingController dateDisputedController = TextEditingController();
  TextEditingController dateDemeritedController = TextEditingController();

  TextEditingController levelController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: themes().whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Dispute Details',
          style: TextStyles().blackTextStyle700(),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(children: [
            disputeDetail('Date Demeritted', dateDemeritedController),
            disputeDetail('Date Disputed', dateDisputedController),
            disputeDetail('Points', pointController),
            disputeDetail("Porter's Name", porterNameController),
            disputeDetail('Matric', matricController),
            disputeDetail('Level', levelController),
            disputeDetail('Offense', offenseController),
            disputeDetail('Reason', reasonController),
            disputeDetail('Status', statusController),
            disputeDetail('Department', departmentController),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // contentPadding: EdgeInsets.only(bottom: 5),
                          content: Container(
                              height: 250,
                              color: themes().whiteColor,
                              // padding: EdgeInsets.only(bottom: 50),
                              child: Column(
                                children: [
                                  MainTextInput(
                                    labelText: 'Enter reason...',
                                    mainText: 'Reason for Escalation',
                                    maxLine: 5,
                                    controller: reasonController,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {}, child: Text('Escalate'))
                                ],
                              )),
                        );
                      });
                },
                child: const Text(
                  'Escalate',
                ))
          ]),
        ),
      ),
    ));
  }

  Widget disputeDetail(String label, TextEditingController controller) {
    return TextFormField(
      readOnly: true,
      style: TextStyles().blackTextStyle700(),
      controller: controller,
      decoration: InputDecoration(
          // focusedBorder: OutlineInputBorder(
          //     borderSide: BorderSide(
          //         color: AppColor().primaryColor)),

          labelText: label,
          labelStyle: TextStyles().greyTextStyle400().copyWith(fontSize: 18)

          // hintText: 'Folder Title'
          ),
    );
  }
}
