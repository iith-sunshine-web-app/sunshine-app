import 'package:booking_calendar/booking_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sunshine_iith/providers/data_provider.dart';

class SelectSlot extends ConsumerStatefulWidget {
  const SelectSlot({super.key});

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
//   void generatePauseSlots() {
//     setState(() {
//       pauseSlots = List.generate(8, (i) {
//     DateTime startDateTime = DateTime(
//       DateTime.now().year,
//       DateTime.now().month,
//       DateTime.now().day + i,
//       13, 0, 0
//     );
//     DateTime endDateTime = DateTime(
//       DateTime.now().year,
//       DateTime.now().month,
//       DateTime.now().day + i,
//       3, 0, 0
//     );

//     return DateTimeRange(start: startDateTime, end: endDateTime);
//   });
//     });

// }

  DateTime now = DateTime.now();
  final lastDay = DateTime.now().add(Duration(days: 7));
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
            Expanded(
              child: BookingCalendar(
                bookingService: BookingService(
                    bookingStart: DateTime(now.year, now.month, now.day, 9, 0),
                    bookingEnd: DateTime(now.year, now.month, now.day, 18, 0),
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
