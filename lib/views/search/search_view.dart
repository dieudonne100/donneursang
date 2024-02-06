import 'package:donneursang/models/bloodtype_models.dart';
import 'package:donneursang/views/search/widgets/search_widget.dart';
import 'package:donneursang/views/search/widgets/searchbar.dart';
import 'package:flutter/material.dart';

import '../../core/constants/themes.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Search',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20,
              fontFamily: "Poppins"),
        ),
      ),
      body: Column(
        children: [
          const SearchBarWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: 300,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                )
              ],
              borderRadius: BorderRadius.circular(15), 
              color: kWhiteColor),
              child: Center(
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: bloodItems.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Container(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          width: 440,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  width: 1.0,
                                  color: const Color.fromRGBO(0, 0, 0, 0.06)),
                              borderRadius: BorderRadius.circular(4)),
                          child: SearchWidget(
                            bloodType: bloodItems[index],
                          )),
                    );
                  },
                  separatorBuilder: (_, __) {
                    return const SizedBox(
                      height: 12,
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
