import 'package:donneursang/core/commons/custom_date_picker.dart';
import 'package:donneursang/core/commons/custom_dropdown.dart';
import 'package:donneursang/core/commons/custom_text_field.dart';
import 'package:donneursang/core/commons/extensions/string_extension.dart';
import 'package:donneursang/views/sign_pages/widgets/phone_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpForm extends StatefulWidget {
  final VoidCallback onEdit;
  final TextEditingController emailController;
  final TextEditingController passController;
  final TextEditingController fnameController;
  final TextEditingController phoneController;
  final TextEditingController cityController;
  final TextEditingController stateController;
  final TextEditingController bloodGroupController;
  final TextEditingController genderController;
  final bool? bloodDonor;
  final DateTime date;
  const SignUpForm(
      {super.key,
      required this.onEdit,
      required this.emailController,
      required this.passController,
      required this.fnameController,
      required this.phoneController,
      required this.cityController,
      required this.stateController,
      required this.bloodGroupController,
      required this.genderController,
      this.bloodDonor,
      required this.date});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final List<String> bloodGroups = [
    'A+',
    'B+',
    'O+',
    'AB+',
    'A-',
    'B-',
    'O-',
    'AB-'
  ];
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: SizedBox(
                  width: 96,
                  child: CustomDropdown(
                    value: "M.",
                    items: const ["M.", "Mme."],
                    onChanged: (value) {
                      widget.genderController.text == value;
                      setState(() {});
                    },
                  )),
            ),
            Expanded(
              child: CustomTextField(
                controller: widget.fnameController,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  widget.fnameController.text == value;

                  widget.onEdit();
                },
                hint: "Full Name",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Champ obligatoire";
                  } else {
                    return null;
                  }
                },
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: CustomTextField(
            keyboardType: TextInputType.emailAddress,
            controller: widget.emailController,
            onChanged: (value) {
              widget.emailController.text == value;

              widget.onEdit();
            },
            hint: "Email ID",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email ID is required';
              } else if (!value.isEmail()) {
                return 'Please enter a valid Email ID';
              } else {
                return null;
              }
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: CustomTextField(
            controller: widget.phoneController,
            onChanged: (value) {
              widget.phoneController.text == value;

              widget.onEdit();
            },
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),
              PhoneNumberFormatter(),
            ],
            hint: "6XX - XXX - XXX",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Phone no is required';
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: CustomTextField(
            controller: widget.passController,
            onChanged: (value) {
              widget.passController.text == value;

              widget.onEdit();
            },
            suffix: showPassword
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
            hint: "Password",
            validator: (value) {
              if (value == null || value.isEmpty) return 'Password is required';
              if (value.length < 6) {
                return 'Password should be of more than 16 characters';
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: CustomDropdown(
            value: bloodGroups.first,
            items: bloodGroups,
            onChanged: (value) {
              widget.bloodGroupController.text == value;
              setState(() {});
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: CustomTextField(
            controller: widget.cityController,
            onChanged: (value) {
              widget.cityController.text == value;

              widget.onEdit();
            },
            hint: "Localisation",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Champ obligatoire";
              }
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: CustomDatePicker(
              hint: "Date de naissance",
              date: widget.date,
              hasTrailing: true,
              onDateChanged: (value) {
                widget.date == value;
                setState(() {});
              }),
        )
      ],
    );
  }
}
