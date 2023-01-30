import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEE1D1),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: const [
              _TopPart(),
              _BottomPart(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopPart extends StatefulWidget {
  const _TopPart({Key? key}) : super(key: key);

  @override
  State<_TopPart> createState() => _TopPartState();
}

class _TopPartState extends State<_TopPart> {
  DateTime selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    final DateTime today = DateTime.now();

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'D-Day',
            style: TextStyle(
              color: Colors.white,
              fontSize: 70.sp,
              fontFamily: 'parisienne',
            ),
          ),
          Column(
            children: [
              Text(
                '우리 처음 만난 날',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.sp,
                  fontFamily: 'sunflower',
                ),
              ),
              Text(
                '${selectedDate.year}.${selectedDate.month}.${selectedDate.day}',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp,
                  fontFamily: 'sunflower',
                ),
              ),
            ],
          ),
          IconButton(
            iconSize: 60.w,
            onPressed: () {
              showCupertinoDialog(
                barrierDismissible: true,
                context: context,
                builder: (context) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.white,
                      height: 300.h,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: selectedDate,
                        maximumDate: DateTime(
                          today.year,
                          today.month,
                          today.day,
                        ),
                        onDateTimeChanged: (DateTime date) {
                          setState(() {
                            selectedDate = date;
                          });
                        },
                      ),
                    ),
                  );
                },
              );
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
          Text(
            'D+${DateTime(
                  today.year,
                  today.month,
                  today.day,
                ).difference(selectedDate).inDays + 1}',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 45.sp,
              fontFamily: 'sunflower',
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset(
        'asset/img/middle_image.png',
      ),
    );
  }
}
