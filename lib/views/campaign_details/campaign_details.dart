import 'package:flutter/material.dart';
import 'package:share_it/share_it.dart';

class CampaignDetails extends StatefulWidget {
  final String name;
  final String phoneNumber;
  final String image;
  final String bloodNeededDate;
  final String bloodGroup;
  final String location;

  const CampaignDetails(
      {super.key,
      required this.name,
      required this.bloodGroup,
      required this.phoneNumber,
      required this.image,
      required this.location,
      required this.bloodNeededDate});

  @override
  State<CampaignDetails> createState() => _CampaignDetailsState();
}

class _CampaignDetailsState extends State<CampaignDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: Text(widget.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              child: Image.network(
                widget.image,
                fit: BoxFit.cover,
                height: 220,
                width: double.infinity,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  widget.name.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20),
                  child: MaterialButton(
                    color: Colors.red,
                    onPressed: () {
                      ShareIt.text(
                          content:
                              "I'm sharing you a blood Campaign ${widget.name} in ${widget.location} on ${widget.bloodNeededDate}. \nThe availabe blood groups are ${widget.bloodGroup} \nThe mobile number of Campaign manager is ${widget.phoneNumber}.\n*Make sure you do not have any type of disease",
                          androidSheetTitle: "Nice Service");
                    },
                    child: const Text(
                      "Share this Campaign",
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Row(
              children: [
                const Text(
                  "Date: ",
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  widget.bloodNeededDate,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                const Text(
                  "Location of Campaign: ",
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  widget.location,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                const Text(
                  "Phone No: ",
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  widget.phoneNumber,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Row(
              children: [
                const Text(
                  "Blood Groups: ",
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  widget.bloodGroup,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "*make sure you do not have any type of disease: ",
              style: TextStyle(
                  fontSize: 15, color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
