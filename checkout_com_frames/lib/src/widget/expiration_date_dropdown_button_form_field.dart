import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../l10n/l10n.dart';

class ExpirationMonthDropdownButtonFormField extends StatefulWidget {
  const ExpirationMonthDropdownButtonFormField(
      {Key? key, required this.fieldKey})
      : super(key: key);

  final GlobalKey<FormFieldState<int>> fieldKey;

  @override
  State<ExpirationMonthDropdownButtonFormField> createState() =>
      _ExpirationMonthDropdownButtonFormFieldState();
}

class _ExpirationMonthDropdownButtonFormFieldState
    extends State<ExpirationMonthDropdownButtonFormField> {
  int month = 1;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      key: widget.fieldKey,
      items: List.generate(
        DateTime.monthsPerYear,
        (index) => DropdownMenuItem(
          child: Text(DateFormat('MMM - MM').format(DateTime(0, index + 1))),
          value: index + 1,
        ),
      ),
      value: month,
      onChanged: (value) {
        if (value == null) {
          return;
        }

        setState(() {
          month = value;
        });
      },
    );
  }
}

class ExpirationYearDropdownButtonFormField extends StatefulWidget {
  const ExpirationYearDropdownButtonFormField(
      {Key? key, required this.fieldKey})
      : super(key: key);

  final GlobalKey<FormFieldState<int>> fieldKey;

  @override
  _ExpirationYearDropdownButtonFormFieldState createState() =>
      _ExpirationYearDropdownButtonFormFieldState();
}

class _ExpirationYearDropdownButtonFormFieldState
    extends State<ExpirationYearDropdownButtonFormField> {
  int year = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    int nowYear = DateTime.now().year;
    return DropdownButtonFormField<int>(
      key: widget.fieldKey,
      items: List.generate(
        15,
        (index) => DropdownMenuItem(
          child: Text('${nowYear + index}'),
          value: nowYear + index,
        ),
      ),
      value: year,
      onChanged: (value) {
        if (value == null) {
          return;
        }

        setState(() {
          year = value;
        });
      },
    );
  }
}

class ExpirationDateDropdownButtonFormField extends StatelessWidget {
  const ExpirationDateDropdownButtonFormField(
      {Key? key, required this.monthFieldKey, required this.yearFieldKey})
      : super(key: key);

  final GlobalKey<FormFieldState<int>> monthFieldKey;
  final GlobalKey<FormFieldState<int>> yearFieldKey;

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        isCollapsed: true,
        label: Text(CheckoutFramesLocalization.of(context).labelExpirationDate),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.only(top: 8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ExpirationMonthDropdownButtonFormField(
              fieldKey: monthFieldKey,
            ),
          ),
          Expanded(
            child: ExpirationYearDropdownButtonFormField(
              fieldKey: yearFieldKey,
            ),
          ),
        ],
      ),
    );
  }
}