import 'package:donneursang/core/commons/custom_button.dart';
import 'package:donneursang/core/commons/custom_text_field.dart';
import 'package:donneursang/core/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class AddCampaigm extends StatefulWidget {
  const AddCampaigm({super.key});

  @override
  State<AddCampaigm> createState() => _AddCampaigmState();
}

class _AddCampaigmState extends State<AddCampaigm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Campaign"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  const Gap(16),
                  CustomTextField(
                    onChanged: (value) {
                      setState(() {});
                    },
                    keyboardType: TextInputType.text,
                    hintStyle: const TextStyle(fontWeight: FontWeight.w200),
                    suffix: IconButton(
                        icon: const Icon(
                          Icons.drive_file_rename_outline,
                          color: Colors.red,
                        ),
                        onPressed: () {}),
                    hint: "Campaign name",
                    validator: (value) {
                      if (value == null) {
                        return 'Specify Your Campaign name';
                      }
                      return null;
                    },
                  ),
                  const Gap(16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Upload image: "),
                      const Gap(16),
                      Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: kPrimaryColor.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(8)),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.add_a_photo_outlined)),
                      ),
                    ],
                  ),
                  const Gap(16),
                  CustomTextField(
                    onChanged: (value) {
                      setState(() {});
                    },
                    keyboardType: TextInputType.text,
                    hintStyle: const TextStyle(fontWeight: FontWeight.w200),
                    suffix: IconButton(
                      icon: const Icon(
                        Icons.location_on,
                        color: Colors.red,
                      ),
                      onPressed: () {},
                    ),
                    hint: "Campaign Location",
                    validator: (value) {
                      if (value == null) {
                        return 'Specify Your Campaign Location';
                      }
                      return null;
                    },
                  ),
                  const Gap(16),
                  // Padding(
                  //   padding: const EdgeInsets.only(top:8.0),
                  //   child: TextFormField(
                  //     keyboardType: TextInputType.numberWithOptions(),
                  //     validator: (value) {
                  //       if (value == null) {
                  //         return 'Blood Amount is Required';
                  //       }
                  //       return null;
                  //     },
                  //     decoration: InputDecoration(
                  //         fillColor: Colors.grey,
                  //         hintText: "Blood Amount (in Unit)",
                  //         border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(10.0),
                  //         )
                  //     ),
                  //     controller: amountController,
                  //   ),
                  // ),
                  CustomTextField(
                    onChanged: (value) {
                      setState(() {});
                    },
                    keyboardType: const TextInputType.numberWithOptions(),
                    hintStyle: const TextStyle(fontWeight: FontWeight.w200),
                    suffix: IconButton(
                      icon: const Icon(
                        Icons.phone,
                        color: Colors.red,
                      ),
                      onPressed: () {},
                    ),
                    hint: "Phone Number",
                    validator: (value) {
                      if (value == null || value.length != 10) {
                        return 'Provide 10 Digit Number';
                      }
                      return null;
                    },
                  ),
                  const Gap(16),
                  CustomTextField(
                    onChanged: (value) {
                      setState(() {});
                    },
                    keyboardType: const TextInputType.numberWithOptions(),
                    hintStyle: const TextStyle(fontWeight: FontWeight.w200),
                    suffix: IconButton(
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.red,
                        ),
                        onPressed: () {}),
                    hint: "Blood Groups",
                    validator: (value) {
                      if (value == null) {
                        return 'Please Specify providing blood groups with comma';
                      }
                      return null;
                    },
                  ),
                  const Gap(16),
                  CustomTextField(
                    onChanged: (value) {
                      setState(() {});
                    },
                    keyboardType: const TextInputType.numberWithOptions(),
                    hintStyle: const TextStyle(fontWeight: FontWeight.w200),
                    suffix: IconButton(
                        icon: const Icon(
                          Icons.calendar_month,
                          color: Colors.red,
                        ),
                        onPressed: () {}),
                    hint: "Campaign Date",
                    validator: (value) {
                      if (value == null) {
                        return 'Please Provide Campaign Date';
                      }
                      return null;
                    },
                  ),
                  const Gap(44),
                  CustomButton(
                    text: "Add Campaign",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                  ),
                ],
              ),
            )));
  }
}
