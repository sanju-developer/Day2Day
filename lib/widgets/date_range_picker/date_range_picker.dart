import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:flutter/material.dart';

class DateRangePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        accentColor: Colors.green,
        primaryColor: Theme.of(context).primaryColor,
        buttonTheme: ButtonThemeData(
            highlightColor: Colors.green,
            buttonColor: Colors.green,
            textTheme: ButtonTextTheme.primary),
      ),
      child: Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.do_not_disturb),
          color: Colors.red,
          onPressed: () async {
            final List<DateTime> picked = await DateRagePicker.showDatePicker(
                context: context,
                initialFirstDate: new DateTime.now(),
                initialLastDate:
                    (new DateTime.now()).add(new Duration(days: 7)),
                firstDate: new DateTime(2015),
                lastDate: new DateTime(DateTime.now().year + 2));
            if (picked != null && picked.length == 2) {
              print(picked);
            }
          },
        ),
      ),
    );
  }
}
