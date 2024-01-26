import 'package:booking_calendar/booking_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sunshine_iith/providers/data_provider.dart';
import 'package:sunshine_iith/services/rtdb_database.dart';
import 'package:sunshine_iith/services/session_data.dart';

class SelectSlot extends ConsumerStatefulWidget {
  final String counsellorsName;
  const SelectSlot({super.key, required this.counsellorsName});

  @override
  ConsumerState<SelectSlot> createState() => _SelectSlotState();
}

class _SelectSlotState extends ConsumerState<SelectSlot> {
  Stream<dynamic>? getBookingStream(
      {required DateTime end, required DateTime start}) {
    return Stream.value([]);
  }

  List<DateTimeRange> converted = [];

  String formatTime(DateTime dateTime) {
    return DateFormat('hh:mm a').format(dateTime);
  }

  String formatDate(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }

  Future<dynamic> uploadBooking({required BookingService newBooking}) async {
    // await Future.delayed(const Duration(seconds: 1));
    ref.read(selectedTimeProvider.notifier).state =
        formatTime(newBooking.bookingStart);
    ref.read(selectedDateProvider.notifier).state =
        formatDate(newBooking.bookingStart);

    converted.add(DateTimeRange(
        start: newBooking.bookingStart, end: newBooking.bookingEnd));
    // print('${newBooking.toJson()} has been uploaded');
    Navigator.pop(context);
  }

  List<DateTimeRange> convertStreamResult({required dynamic streamResult}) {
    return converted;
  }

  List<DateTimeRange> pauseSlots = [
    DateTimeRange(
        start: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 13, 0, 0),
        end: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 14, 30, 0)),
    DateTimeRange(
        start: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 1, 13, 0, 0),
        end: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 1, 14, 30, 0)),
    DateTimeRange(
        start: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 2, 13, 0, 0),
        end: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 2, 14, 30, 0)),
    DateTimeRange(
        start: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 3, 13, 0, 0),
        end: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 3, 14, 30, 0)),
    DateTimeRange(
        start: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 4, 13, 0, 0),
        end: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 4, 14, 30, 0)),
    DateTimeRange(
        start: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 5, 13, 0, 0),
        end: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 5, 14, 30, 0)),
    DateTimeRange(
        start: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 6, 13, 0, 0),
        end: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 6, 14, 30, 0)),
    DateTimeRange(
        start: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 7, 13, 0, 0),
        end: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 7, 14, 30, 0)),
    DateTimeRange(
        start: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 8, 13, 0, 0),
        end: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 8, 14, 30, 0)),
  ];

  DateTime parseDateAndTime(String dateStr, String timeStr) {
    try {
      final date = DateFormat("dd/MM/yyyy").parse(dateStr);
      final time = DateFormat("hh:mm a").parse(timeStr);

      final combinedDateTime =
          DateTime(date.year, date.month, date.day, time.hour, time.minute);

      return combinedDateTime;
    } catch (e) {
      debugPrint("Error parsing date and time: $e");
      return DateTime(
          2000); // Or return a default date/time or throw an exception, depending on your use case
    }
  }

  Future<void> getBookedSlots(String date) async {
    Map<String, dynamic> result = await RealTimeDB()
        .getCounsellorsSessionsData(widget.counsellorsName, date);
    List<SessionData> data = [];
    if (result.isNotEmpty) {
      result.forEach((key, value) {
        SessionData sessionData = SessionData(
            counsellorsEmail: '',
            counsellorsPhone: '',
            date: value['date'],
            email: '',
            name: '',
            time: value['time'],
            counsellorsName: value['counsellor'],
            mode: '',
            phone: value['phone']);
        data.add(sessionData);
      });
    }

    List<DateTimeRange> dateTimeRangeList = [];

    for (SessionData sessions in data) {
      DateTime start = parseDateAndTime(sessions.date, sessions.time);
      dateTimeRangeList.add(DateTimeRange(
          start: start, end: start.add(const Duration(hours: 1))));
    }

    setState(() {
      converted.addAll(dateTimeRangeList);
    });
  }

  // getAllBookedSlots()async{
  //   print(DateTime.now());
  //   for (var i = 0; i < 8; i++) {
  //     String date = formatDate(DateTime.now().add(Duration(days: i)));
  //     await getBookedSlots(date);
  //     print(date);
  //   }
  //   setState(() {
  //     isLoading = false;
  //   });
  //   print(DateTime.now());

  // }
  Future<void> getAllBookedSlots() async {
    final List<String> datesToFetch = [];

    for (var i = 0; i < 8; i++) {
      String date = formatDate(DateTime.now().add(Duration(days: i)));
      datesToFetch.add(date);
    }

    try {
      await Future.wait(datesToFetch.map((date) => getBookedSlots(date)));
    } catch (error) {
      debugPrint('Error fetching booked slots in parallel: $error');
    }

    setState(() {
      isLoading = false;
    });
  }

  DateTime now = DateTime.now();
  final lastDay = DateTime.now().add(const Duration(days: 7));

  bool isLoading = true;

  @override
  void initState() {
    // getBookedSlots('16/10/2023');
    getAllBookedSlots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 36,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const BackButton(),
                    const SizedBox(
                      width: 24,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'Choose a slot',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            isLoading
                ? const CircularProgressIndicator(
                    color: Colors.orange,
                  )
                : Expanded(
                    child: BookingCalendar(
                      bookingService: BookingService(
                          bookingStart:
                              DateTime(now.year, now.month, now.day, 9, 0),
                          bookingEnd:
                              DateTime(now.year, now.month, now.day, 18, 0),
                          serviceName: 'Sunshine Slot Booking',
                          serviceDuration: 60),
                      getBookingStream: getBookingStream,
                      uploadBooking: uploadBooking,
                      convertStreamResultToDateTimeRanges: convertStreamResult,
                      lastDay: lastDay,
                      // loadingWidget: cCircularProgressIndicator(),
                      // uploadingWidget: CircularProgressIndicator(),
                      bookingButtonColor: Colors.orange,
                      bookingButtonText: 'CONTINUE',
                      pauseSlots: pauseSlots,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
