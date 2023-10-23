import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunshine_iith/pages/session_book.dart/confirm_slot.dart';
import 'package:sunshine_iith/pages/session_book.dart/select_slot.dart';
import 'package:sunshine_iith/providers/data_provider.dart';
import 'package:sunshine_iith/services/data_model.dart';

class ProcessTimeline extends ConsumerStatefulWidget {
  const ProcessTimeline({super.key});

  @override
  ConsumerState<ProcessTimeline> createState() => _ProcessTimelineState();
}

enum Counsellors { counsellor1, counsellor2, counsellor3 }

enum Mode { online, offline }

// enum Communication { whatsapp, mail }

class _ProcessTimelineState extends ConsumerState<ProcessTimeline> {
  int currStep = 0;
  String selectedTime = 'Choose a slot';


  var sirOrMadam = ['sir', 'madam'];

  String date = '';
  // DateTime _date = DateTime.now();
  String time = '';
  // TimeOfDay _time = TimeOfDay.now();
  bool timeFunctionCall = false;

  List<DataModel> counsellorsData = [
    DataModel(
        name: 'Maria Morris',
        email: 'maria.morris@admin.iith.ac.in',
        phone: '8331036081',
        position: 'no need',
        image: 'no need'),
    DataModel(
        name: 'Yukti Rastogi',
        email: 'yukti.rastogi@admin.iith.ac.in',
        phone: '8331036080',
        position: 'no need',
        image: 'no need'),
    DataModel(
        name: 'D. Phani Bhushan',
        email: 'phani.bhushan@admin.iith.ac.in',
        phone: '8331036082',
        position: 'sir',
        image: 'no need'),
  ];

  Counsellors? _valueCounsellors = Counsellors.counsellor1;
  Mode? _valueMode = Mode.offline;
  // Communication? _valueCommunication = Communication.whatsapp;

  @override
  void initState() {
    // date = currDate(DateTime.now());
    super.initState();
  }

  onStepContinue() {
    // datePicker();
    if (currStep < 3) {
      setState(() {
        currStep++;
      });
    } else {
      //   if (_valueCommunication == Communication.whatsapp) {
      //     requestSlot(true);
      //   } else {
      //     requestSlot(false);
      //   }
      // String s = sirOrMadam.elementAt(1);
      int index = 0;

      if (_valueCounsellors == Counsellors.counsellor2) {
        index = 1;
      } else if (_valueCounsellors == Counsellors.counsellor3) {
        // s = sirOrMadam.elementAt(0);
        index = 2;
      }
      String mode = 'Online';

      if (_valueMode == Mode.offline) {
        mode = 'Offline';
      }

      showModalBottomSheet(
        
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(36.0),
            ),
          ),
          backgroundColor: Colors.white,
          isScrollControlled: true,
          context: context,
          builder: (ctx) {
            return ConfirmSlot(
              counsellor: counsellorsData.elementAt(index),
              mode: mode,
            );
          });

      // Navigator.push(context, MaterialPageRoute(builder: (ctx)=> ConfirmSlot(counsellor: counsellorsData.elementAt(index),mode: mode,)));
    }
  }

  onStepCancel() {
    if (currStep > 0) {
      setState(() {
        currStep--;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    if (ref.watch(selectedTimeProvider) != null) {
      // selectedTime = ref.watch(selectedTimeProvider)!;
      selectedTime =
          'Date: ${ref.watch(selectedDateProvider)!}\nTime: ${ref.watch(selectedTimeProvider)!}';
    }
    // if (!timeFunctionCall) {
    //   time = currTime(TimeOfDay.now());
    // }

    return Theme(
      data: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 244, 197, 54),
            primary: const Color.fromARGB(255, 21, 101, 192)),
        useMaterial3: true,
      ),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: Text(
                  'Book Slot Now',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
                ),
              ),
              Stepper(
                  currentStep: currStep,
                  onStepContinue: onStepContinue,
                  onStepCancel: onStepCancel,
                  controlsBuilder: controls,
                  steps: [
                    Step(
                      state: currStep > 0
                          ? StepState.complete
                          : StepState.disabled,
                      isActive: currStep >= 0,
                      title: Text(
                        'Select a counsellor for the session',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: currStep >= 0 ? Colors.orange : Colors.grey),
                      ),
                      content: Column(
                        children: [
                          RadioListTile<Counsellors>(
                            contentPadding: const EdgeInsets.all(0.0),
                            title: Text(
                              counsellorsData.elementAt(0).name,
                            ),
                            value: Counsellors.counsellor1,
                            groupValue: _valueCounsellors,
                            onChanged: (value) => setState(() {
                              _valueCounsellors = value;
                            }),
                          ),
                          RadioListTile<Counsellors>(
                            contentPadding: const EdgeInsets.all(0.0),
                            title: Text(
                              counsellorsData.elementAt(1).name,
                            ),
                            value: Counsellors.counsellor2,
                            groupValue: _valueCounsellors,
                            onChanged: (value) => setState(() {
                              _valueCounsellors = value;
                            }),
                          ),
                          RadioListTile<Counsellors>(
                            contentPadding: const EdgeInsets.all(0.0),
                            title: Text(
                              counsellorsData.elementAt(2).name,
                            ),
                            value: Counsellors.counsellor3,
                            groupValue: _valueCounsellors,
                            onChanged: (value) => setState(() {
                              _valueCounsellors = value;
                            }),
                          ),
                        ],
                      ),
                    ),
                    Step(
                      state: currStep > 1
                          ? StepState.complete
                          : StepState.disabled,
                      isActive: currStep >= 1,
                      title: Text(
                        'Select the mode of session',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: currStep >= 1 ? Colors.orange : Colors.grey),
                      ),
                      content: Column(
                        children: [
                          RadioListTile<Mode>(
                            contentPadding: const EdgeInsets.all(0.0),
                            title: const Text(
                              'Online',
                            ),
                            value: Mode.online,
                            groupValue: _valueMode,
                            onChanged: (value) => setState(() {
                              _valueMode = value;
                            }),
                          ),
                          RadioListTile<Mode>(
                            contentPadding: const EdgeInsets.all(0.0),
                            title: const Text(
                              "Offline",
                            ),
                            value: Mode.offline,
                            groupValue: _valueMode,
                            onChanged: (value) => setState(() {
                              _valueMode = value;
                            }),
                          ),
                        ],
                      ),
                    ),
                    Step(
                      state: currStep > 2
                          ? StepState.complete
                          : StepState.disabled,
                      isActive: currStep >= 2,
                      title: Text(
                        'Choose a slot for the session',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: currStep >= 2 ? Colors.orange : Colors.grey),
                      ),
                      content: Column(
                        children: [
                          // Row(
                          //   children: [
                          //     InkWell(
                          //       splashColor: Colors.transparent,
                          //       highlightColor: Colors.transparent,
                          //       onTap: () {
                          //         datePicker();
                          //       },
                          //       child: Padding(
                          //         padding: const EdgeInsets.fromLTRB(
                          //             10, 10, 0, 10),
                          //         child: SizedBox(
                          //           width: 170,
                          //           child: InputDecorator(
                          //             decoration: InputDecoration(
                          //               suffixIcon: const Icon(
                          //                   Icons.calendar_today_outlined),
                          //               labelText: 'Date',
                          //               border: OutlineInputBorder(
                          //                 borderRadius:
                          //                     BorderRadius.circular(5),
                          //               ),
                          //             ),
                          //             child: Text(
                          //               date,
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          Row(
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  int index = 0;

                                  if (_valueCounsellors ==
                                      Counsellors.counsellor2) {
                                    index = 1;
                                  } else if (_valueCounsellors ==
                                      Counsellors.counsellor3) {
                                    // s = sirOrMadam.elementAt(0);
                                    index = 2;
                                  }
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) => SelectSlot(
                                            counsellorsName: counsellorsData
                                                .elementAt(index)
                                                .name,
                                          )));
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 0, 10),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.75,
                                    child: InputDecorator(
                                      decoration: InputDecoration(
                                        suffixIcon: const Icon(
                                          Icons.chevron_right,
                                          size: 28,
                                        ),
                                        // labelText: 'Time',
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              15.0,
                                            ),
                                            borderSide: const BorderSide(
                                                // color: Colors.orange,
                                                width: 1.5)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              15.0,
                                            ),
                                            borderSide: const BorderSide(
                                                // color: Colors.orange,
                                                width: 1.5)),
                                      ),
                                      child: Text(
                                        selectedTime,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Step(
                    //   state: currStep > 3
                    //       ? StepState.complete
                    //       : StepState.disabled,
                    //   isActive: currStep >= 3,
                    //   title: const Text(
                    //       'Select your prefered mode of communication'),
                    //   content: Column(
                    //     children: [
                    //       RadioListTile<Communication>(
                    //         contentPadding: const EdgeInsets.all(0.0),
                    //         title: const Text(
                    //           'Whatsapp',
                    //         ),
                    //         value: Communication.whatsapp,
                    //         groupValue: _valueCommunication,
                    //         onChanged: (value) => setState(() {
                    //           _valueCommunication = value;
                    //         }),
                    //       ),
                    //       RadioListTile<Communication>(
                    //         contentPadding: const EdgeInsets.all(0.0),
                    //         title: const Text(
                    //           "Mail",
                    //         ),
                    //         value: Communication.mail,
                    //         groupValue: _valueCommunication,
                    //         onChanged: (value) => setState(() {
                    //           _valueCommunication = value;
                    //         }),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Step(
                        state: currStep > 3
                            ? StepState.complete
                            : StepState.disabled,
                        isActive: currStep >= 3,
                        title: Text(
                          'Review and book your slot',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color:
                                  currStep >= 3 ? Colors.orange : Colors.grey),
                        ),
                        content: const Text(
                          'Check your filled data and book your slot with our counsellors!',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ))
                  ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget controls(context, details) {
    String str = 'NEXT';
    if (currStep >= 3) str = 'REVIEW';

    return Row(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 21, 101, 192),
            elevation: 2,
          ),
          onPressed: (selectedTime=='Choose a slot' &&currStep==2) ? null:
          details.onStepContinue,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Text(
              str,
              style: const TextStyle(
                  color: Colors.white, fontSize: 14.5, letterSpacing: 1.2),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        OutlinedButton(
          onPressed: currStep <= 0 ? null : details.onStepCancel,
          child: const Text(
            'BACK',
            style: TextStyle(fontSize: 14.5, letterSpacing: 1.2),
          ),
        )
      ],
    );
  }

  // void datePicker() async {
  //   DateTime selectDate = _date;
  //   if (selectDate.hour > 21) {
  //     selectDate = selectDate.add(const Duration(hours: 3));
  //   }
  //   DateTime currDateTime = DateTime.now();
  //   await showDatePicker(
  //     builder: (context, child) => Theme(
  //       data: ThemeData(
  //         colorScheme: ColorScheme.fromSeed(
  //             seedColor: const Color.fromARGB(255, 244, 197, 54),
  //             primary: const Color.fromARGB(255, 244, 197, 54)),
  //         useMaterial3: true,
  //       ),
  //       child: child!,
  //     ),
  //     context: context,
  //     initialDate: selectDate,
  //     firstDate: currDateTime,
  //     lastDate: currDateTime.add(const Duration(days: 7)),
  //     initialEntryMode: DatePickerEntryMode.calendarOnly,
  //   ).then((value) {
  //     setState(() {
  //       _date = value!;
  //       date = currDate(value);
  //     });
  //   });
  // }

  // String currDate(DateTime currDateTime) {
  //   int hour = currDateTime.hour;
  //   if (hour > 21) {
  //     currDateTime = currDateTime.add(const Duration(hours: 3));
  //   }
  //   return (currDateTime.day.toString() +
  //       '/' +
  //       currDateTime.month.toString() +
  //       '/' +
  //       currDateTime.year.toString());
  // }

  // void timePicker() async {
  //   timeFunctionCall = true;

  //   TimeOfDay selectedTime = _time;
  //   if (selectedTime.hour > 21) {
  //     selectedTime = const TimeOfDay(hour: 9, minute: 00);
  //   }

  //   final TimeOfDay? pickedTime = await showTimePicker(
  //     builder: (context, child) => Theme(
  //       data: ThemeData(
  //         colorScheme: ColorScheme.fromSeed(
  //             seedColor: const Color.fromARGB(255, 244, 197, 54),
  //             primary: const Color.fromARGB(255, 244, 197, 54)),
  //         useMaterial3: true,
  //       ),
  //       child: child!,
  //     ),
  //     context: context,
  //     initialTime: selectedTime,
  //     initialEntryMode: TimePickerEntryMode.dialOnly,
  //   );

  //   setState(() {
  //     _time = pickedTime!;
  //     time = _time.format(context);
  //   });
  // }

  // String currTime(TimeOfDay time) {
  //   int hour = time.hour;
  //   if (hour > 21) {
  //     time = const TimeOfDay(hour: 9, minute: 00);
  //   } else {
  //     time = TimeOfDay(hour: hour + 1, minute: 00);
  //   }
  //   _time = time;

  //   return time.format(context);
  // }

//   void requestSlot(bool isWhatsapp) {
//     int ke = 0;
//     String s = sirOrMadam.elementAt(1);

//     if (_valueCounsellors == Counsellors.counsellor2) {
//       ke = 1;
//     } else if (_valueCounsellors == Counsellors.counsellor3) {
//       s = sirOrMadam.elementAt(0);
//       ke = 2;
//     }

//     String name = FirebaseAuth.instance.currentUser!.displayName!;
//     String mode = 'Online';

//     if (_valueMode == Mode.offline) {
//       mode = 'Offline';
//     }

//     String day = "";
//     int index = _date.weekday;

//     if (index == 1) {
//       day = 'Monday';
//     } else if (index == 2) {
//       day = 'Tuesday';
//     } else if (index == 3) {
//       day = 'Wednesday';
//     } else if (index == 4) {
//       day = 'Thursday';
//     } else if (index == 5) {
//       day = 'Friday';
//     } else if (index == 6) {
//       day = 'Saturday';
//     } else if (index == 7) {
//       day = 'Sunday';
//     }

//     String massage =
//         'Hi $s, I am $name. I was wondering if I could meet you for an $mode session on $day ${ref.watch(selectedDateProvider)} at ${ref.watch(selectedTimeProvider)}. ';

//     if (isWhatsapp) {
//       Open.whatsApp(
//           whatsAppNumber: '91${counsellorsData.elementAt(ke).phone}',
//           text: massage);
//     } else {
//       Open.mail(
//         toAddress: counsellorsData.elementAt(ke).email,
//         subject: 'Regarding Slot for a Session',
//         body: massage,
//       );
//     }
//   }
}
