import 'package:dispute_system/dispute/dispute_model.dart';
import 'package:dispute_system/theme.dart';
import 'package:flutter/material.dart';
import 'package:dispute_system/textbox.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:dispute_system/login/login_provider.dart';

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
  void initState() {
    porterNameController =
        TextEditingController(text: widget.data!.porterName.toString());
    offenseController =
        TextEditingController(text: widget.data!.offence.toString());
    statusController =
        TextEditingController(text: widget.data!.resolutionStatus.toString());
    pointController =
        TextEditingController(text: widget.data!.points.toString());
    hallController = TextEditingController(text: widget.data!.hall.toString());
    matricController = TextEditingController(
        text: widget.data!.matriculationNumber.toString());
    dateDisputedController =
        TextEditingController(text: widget.data!.dateDisputed.toString());
    dateDemeritedController =
        TextEditingController(text: widget.data!.dateAwarded.toString());
    reasonController =
        TextEditingController(text: widget.data!.reason.toString());

    levelController =
        TextEditingController(text: widget.data!.level.toString());
    departmentController =
        TextEditingController(text: widget.data!.department.toString());
    // TODO: implement initState
    print(widget.data!.department);
    super.initState();
  }

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
      'disputeId': widget.data!.disputeId.toString(),
    };

    var tokenState = Provider.of<LoginProvider>(context, listen: false);
    var token = tokenState.token;
    r = await post(
      Uri.parse(
          "https://sddms-backend-production.up.railway.app/api/v1/student/escalate-dispute"),
      body: body,
      headers: {
        "Authorization": "Bearer $token",
        // 'Content-type': 'application/json',
        "Accept": "application/json",
      },
    );

    // if (r.statusCode.toString().startsWith('2')) {
    //   print('good');
    // }

    Navigator.pop(context);
    String messsage = json.decode(r.body.toString())['message'].toString();
    final snackBar = SnackBar(
      content: Text(messsage),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    print(json.decode(r.body.toString())['message'].toString());
  }

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
                  escalate();
                },
                child: const Text(
                  'Escalate',
                ))
          ]),
        ),
      ),
    ));
  }

  Widget disputeDetail(
    String label,
    TextEditingController controller,
  ) {
    return MainTextInput(
      mainText: label,
      controller: controller,
      readOnly: true,
      isFilled: true,
    );
  }
}
