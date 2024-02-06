import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 16),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.7 / 1,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.12)),
            ),
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                const Icon(
                  Icons.search,
                  color: Color.fromRGBO(0, 0, 0, 0.54),
                ),
                const Gap(16),
                Expanded(
                  child: Text(
                    "Rechercher à partir des mots clés",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color.fromRGBO(0, 0, 0, 1)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.2,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: const Color.fromRGBO(0, 0, 0, 0.12))),
                  child: const Icon(
                    Icons.filter_list,
                    color: Color.fromRGBO(0, 0, 0, 0.54),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
