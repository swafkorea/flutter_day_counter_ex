import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static final now = DateTime.now();
  DateTime selectedDate = DateTime(now.year, now.month, now.day);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: double.infinity, // MediaQuery.of(..) 대신 이런 방법도 가능.
          child: Column(
            children: [
              _TopPart(
                selectedDate: selectedDate,
                onDateChanged: onSelectedDateChanged,
              ),
              const _BottomPart(),
            ],
          ),
        ),
      ),
    );
  }

  /// 날짜 선택되었을때 동작 callback
  void onSelectedDateChanged(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Image.asset('assets/images/middle_image.png'),
    );
  }
}

class _TopPart extends StatelessWidget {
  static final now = DateTime.now();
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateChanged;

  const _TopPart({
    Key? key,
    required this.selectedDate,
    required this.onDateChanged,
  }) : super(key: key);

  /// 날짜 수를 카운트 하는 getter
  /// 오늘날짜인 경우는 'D Day' 로 표시하도록 리턴함.
  String get days {
    final diff = DateTime(now.year, now.month, now.day).difference(selectedDate).inDays;
    return diff == 0 ? ' Day' : diff.toString();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'U&I',
            style: textTheme.headline1,
          ),
          Column(
            children: [
              Text(
                '우리 처음 만날 날',
                style: textTheme.bodyText1,
              ),
              Text(
                DateFormat('yyyy.MM.dd').format(selectedDate),
                style: textTheme.bodyText2,
              ),
            ],
          ),
          IconButton(
            iconSize: 60,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.white,
                    height: 300,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      minimumDate: DateTime(now.year, now.month, now.day),
                      initialDateTime: selectedDate,
                      onDateTimeChanged: onDateChanged,
                    ),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.favorite, color: Colors.red),
          ),
          Text(
            'D$days', // 날짜수는 day라는 getter에서 받아옴
            style: textTheme.headline2,
          )
        ],
      ),
    );
  }
}
