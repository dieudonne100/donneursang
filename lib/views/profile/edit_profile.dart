import 'package:donneursang/core/commons/custom_button.dart';
import 'package:donneursang/core/commons/custom_text_field.dart';
import 'package:donneursang/core/commons/loading.dart';
import 'package:donneursang/core/constants/themes.dart';
import 'package:donneursang/views/profile/thank_you.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  bool isUpdating = false;

  TextEditingController displayNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  @override
  void initState() {
    // widget.currentUser.displayName == null
    //     ? const CircularProgressIndicator()
    //     : displayNameController.text = widget.currentUser.displayName;
    // addressController.text = widget.currentUser.location;
    // bloodGroupController.text = widget.currentUser.bloodGroup;
    // phoneNumberController.text = widget.currentUser.phoneNumber;
    // genderController.text = widget.currentUser.gender;
    // dobController.text = widget.currentUser.dateOfBirth;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final donorRef = Firestore.instance.collection('donor');

    getUserLocation() async {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.lowest);
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark placemark = placemarks[0];
      String completeAddress = '${placemark.subLocality},${placemark.locality}';
      addressController.text = completeAddress;
    }

    setSearchParam(String locationSearch) {
      List<String> locationSearchList = [];
      String temp = "";
      for (int i = 0; i < locationSearch.length; i++) {
        temp = temp + locationSearch[i];
        locationSearchList.add(temp);
      }
      return locationSearchList;
    }

    // updateDonorDetail() async {
    //   donorRef.document(widget.currentUser.id).updateData({
    //     "location": addressController.text,
    //     "locationSearch": setSearchParam(addressController.text),
    //     "bloodGroup": bloodGroupController.text,
    //     "phoneNumber": phoneNumberController.text,
    //     "gender": genderController.text,
    //     "dateOfBirth": dobController.text,
    //   });
    // }

    handleDonorUpdate() async {
      setState(() {
        isUpdating = true;
      });

      // await updateDonorDetail();◊

      setState(() {
        isUpdating = false;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const ThankYou()));
      });
    }

    pickDate() async {
      DateTime? date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 60),
        lastDate: DateTime.now(),
      );

      setState(() {
        dobController.text = "${date?.year}-${date?.month}-${date?.day}";
      });
    }

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30))),
          title: const Text("Profile Page"),
          automaticallyImplyLeading: true,
        ),
        body: Builder(builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: isUpdating
                  ? circularLoading()
                  : ListView(
                      children: <Widget>[
                        const Center(
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/emptyprofil.png"),
                            radius: 60.0,
                          ),
                        ),
                        const Gap(16),
                        CustomTextField(
                          keyboardType: TextInputType.text,
                          hintStyle:
                              const TextStyle(fontWeight: FontWeight.w200),
                          preffix: IconButton(
                              icon: const Icon(
                                Icons.person,
                                color: Colors.red,
                              ),
                              onPressed: getUserLocation),
                          hint: "Neh Olive",
                        ),
                        const Gap(16),
                        CustomTextField(
                          keyboardType: TextInputType.text,
                          hintStyle:
                              const TextStyle(fontWeight: FontWeight.w200),
                          preffix: IconButton(
                              icon: const Icon(
                                Icons.location_on,
                                color: Colors.red,
                              ),
                              onPressed: getUserLocation),
                          hint: "Douala Cameroun",
                        ),
                        const Gap(16),
                        CustomTextField(
                          keyboardType: TextInputType.text,
                          hintStyle:
                              const TextStyle(fontWeight: FontWeight.w200),
                          preffix: IconButton(
                              icon: const Icon(
                                Icons.phone,
                                color: Colors.red,
                              ),
                              onPressed: () {}),
                          hint: "675150288",
                        ),
                        const Gap(16),
                        Row(
                          children: <Widget>[
                            Flexible(
                                child: CustomTextField(
                              keyboardType: TextInputType.text,
                              hintStyle:
                                  const TextStyle(fontWeight: FontWeight.w200),
                              preffix: IconButton(
                                  icon: const Icon(
                                    Icons.bloodtype,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {}),
                              readOnly: true,
                              hint: "O+",
                            )),
                            const Gap(6),
                            Flexible(
                                child: CustomTextField(
                              keyboardType: TextInputType.text,
                              hintStyle:
                                  const TextStyle(fontWeight: FontWeight.w200),
                              preffix: IconButton(
                                  icon: const Icon(
                                    Icons.person,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {}),
                              readOnly: true,
                              hint: "Female",
                            )
                                //
                                ),
                          ],
                        ),
                        const Gap(16),
                        CustomTextField(
                          keyboardType: TextInputType.text,
                          hintStyle:
                              const TextStyle(fontWeight: FontWeight.w200),
                          preffix: IconButton(
                              icon: const Icon(
                                Icons.person_2_outlined,
                                color: Colors.red,
                              ),
                              onPressed: () {}),
                          hint: "31-05-20004",
                        ),
                        const Gap(44),
                        CustomButton(
                          text: "I am Ready to Donate",
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
                              handleDonorUpdate();
                            }
                          },
                        ),
                      ],
                    ),
            ),
          );
        }));
  }
}
