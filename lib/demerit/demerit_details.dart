import 'package:dispute_system/theme.dart';
import 'package:flutter/material.dart';
import 'package:dispute_system/textbox.dart';

class DemeritDetails extends StatefulWidget {
  const DemeritDetails({super.key});

  @override
  State<DemeritDetails> createState() => _DemeritDetailsState();
}

class _DemeritDetailsState extends State<DemeritDetails> {
  TextEditingController porterNameController = TextEditingController();
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
                                      onPressed: () {}, child: Text('Dispute'))
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
