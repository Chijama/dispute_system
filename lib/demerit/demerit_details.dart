import 'package:dispute_system/demerit/demerit_model.dart';
import 'package:dispute_system/login/login_provider.dart';
import 'package:dispute_system/theme.dart';
import 'package:flutter/material.dart';
import 'package:dispute_system/textbox.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:developer';

import 'package:provider/provider.dart';

class DemeritDetails extends StatefulWidget {
  DemeritDataModel? data;
  DemeritDetails({super.key, this.data});

  @override
  State<DemeritDetails> createState() => _DemeritDetailsState();
}

class _DemeritDetailsState extends State<DemeritDetails> {
  late TextEditingController porterNameController;
  TextEditingController offenseController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController pointController = TextEditingController();
  TextEditingController hallController = TextEditingController();
  TextEditingController matricController = TextEditingController();
  TextEditingController dateController = TextEditingController();
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
        TextEditingController(text: widget.data!.status.toString());
    pointController =
        TextEditingController(text: widget.data!.points.toString());
    hallController = TextEditingController(text: widget.data!.hall.toString());
    matricController = TextEditingController(
        text: widget.data!.matriculationNumber.toString());
    dateController = TextEditingController(text: widget.data!.date.toString());
    levelController =
        TextEditingController(text: widget.data!.level.toString());
    departmentController =
        TextEditingController(text: widget.data!.department.toString());
    // TODO: implement initState
    print(widget.data!.department);
    super.initState();
  }

  Future dispute() async {
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
      'demeritId': widget.data!.id.toString(),
      'reason': reasonController.text
    };
    print(reasonController.text);
    var tokenState = Provider.of<LoginProvider>(context, listen: false);
    var token = tokenState.token;
    r = await post(
      Uri.parse(
          "https://sddms-backend-production.up.railway.app/api/v1/student/dispute-demerit"),
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
          'Demerit Details',
          style: TextStyles().blackTextStyle700(),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(children: [
            demeritDetail('Date Created', dateController),
            demeritDetail('Points', pointController),
            demeritDetail("Porter's Name", porterNameController),
            demeritDetail('Matric', matricController),
            demeritDetail('Level', levelController),
            demeritDetail('Offense', offenseController),
            demeritDetail('Status', statusController),
            demeritDetail('Department', departmentController),
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
                                    mainText: 'Reason for Dispute',
                                    maxLine: 5,
                                    controller: reasonController,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
    reasonController.clear();

                                        Navigator.pop(context);
                                        dispute();
                                      },
                                      child: Text('Dispute'))
                                ],
                              )),
                        );
                      });
                },
                child: const Text(
                  'Dispute',
                ))
          ]),
        ),
      ),
    ));
  }

  Widget demeritDetail(String label, TextEditingController controller) {
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
