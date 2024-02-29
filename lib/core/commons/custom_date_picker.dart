import 'package:donneursang/core/commons/extensions/date_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';

class CustomDatePicker extends StatelessWidget {
  final String? hint;
  final DateTime? date;
  final Function(DateTime) onDateChanged;
  final bool hasTrailing;
  const CustomDatePicker({
    Key? key,
    this.hint,
    this.date,
    this.hasTrailing = false,
    required this.onDateChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var datePick = await showRoundedDatePicker(
          context: context,
          initialDate: date ?? DateTime.now(),
          firstDate: DateTime(1950),
          lastDate: DateTime.now(),
          borderRadius: 16,
          styleDatePicker: MaterialRoundedDatePickerStyle(
              paddingDatePicker: const EdgeInsets.only(top: 16)),
          theme: ThemeData(
            primaryColor: const Color(0xff04544D),
          ),
        );

        if (datePick != null) {
          onDateChanged(datePick);
        }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black26)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              date == null ? (hint ?? "") : date!.toStringDate(),
              style: TextStyle(color: date == null ? Colors.black54 : null),
            ),
            Visibility(
                visible: hasTrailing,
                child: const Icon(
                  Icons.calendar_month,
                  color: Colors.grey,
                ))
          ],
        ),
      ),
    );
  }
}
