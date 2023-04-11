import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/domain/states/forecast.dart';
import 'package:weather_app/foundation/utils.dart';

class DateSelector extends StatefulWidget {
  const DateSelector({Key? key}) : super(key: key);

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  DateTime selectedDate = DateTime.now();
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      focusNode: focusNode,
      onPressed: () async {
        DateTime? date =
            await context.read<ForecastState>().promptDate(context);
        if (date != null) {
          setState(() {
            selectedDate = date;
          });
        }
        focusNode.unfocus();
      },
      child: Text(formatDate(DateTime.now())),
    );
  }
}
