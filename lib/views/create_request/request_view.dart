import 'package:donneursang/views/sign_pages/widgets/phone_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

import '../../core/commons/button.dart';
import '../../core/commons/text_field_input.dart';
import '../../core/constants/themes.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({Key? key}) : super(key: key);

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Create Request',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20,
              fontFamily: "Poppins"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:16),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(130),
              TextFieldInput(
                iconData: Icons.location_on_outlined,
                coloricons: kPrimaryColor,
                fontWeight: FontWeight.w400,
                color: Colors.black26,
                hint: 'city',
                validator: (value) {
                  if (value == "") {
                    return "veuillez remplir ce champ";
                  } else {
                    return null;
                  }
                },
              ),
              const Gap(15),
              TextFieldInput(
                iconData: Icons.location_city_outlined,
                coloricons: kPrimaryColor,
                fontWeight: FontWeight.w400,
                color: Colors.black26,
                hint: 'Hospital',
                validator: (value) {
                  if (value == "") {
                    return "veuillez remplir ce champ";
                  } else {
                    return null;
                  }
                },
              ),
              const Gap(15),
              TextFieldInput(
                iconData: Icons.bloodtype_outlined,
                coloricons: kPrimaryColor,
                fontWeight: FontWeight.w400,
                color: Colors.black26,
                hint: 'Blood Type',
                validator: (value) {
                  if (value == "") {
                    return "veuillez remplir ce champ";
                  } else {
                    return null;
                  }
                },
              ),
              const Gap(15),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                  PhoneNumberFormatter(),
                ],
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  labelStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                  labelText: '6XX - XXX - XXX',
                  prefixIcon: const Icon(Icons.phone, color: kPrimaryColor),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.black12,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: kPrimaryColor,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: kPrimaryColor,
                      )),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: kPrimaryColor,
                      )),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const Gap(15),
              TextFieldInput(
                iconData: Icons.note_add_outlined,
                coloricons: kPrimaryColor,
                fontWeight: FontWeight.w400,
                color: Colors.black26,
                hint: 'Add a note',
                validator: (value) {
                  if (value == "") {
                    return "veuillez remplir ce champ";
                  } else {
                    return null;
                  }
                },
              ),
              const Gap(120),
              InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          surfaceTintColor: kWhiteColor,
                          contentPadding: const EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset(
                                  "assets/images/alertdialog.png",
                                  height: 200,
                                  width: 200,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 20),
                                child: Text(
                                  "Blood is successfully requested.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: "Dosis",
                                      fontSize: 12,
                                      color: kBlackColor.withOpacity(0.77),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Ok',
                                  style: TextStyle(
                                      fontFamily: "Dosis",
                                      fontSize: 14,
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: button(
                    backgroundColor: kPrimaryColor,
                    colorText: kWhiteColor,
                    title: "Save",
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
