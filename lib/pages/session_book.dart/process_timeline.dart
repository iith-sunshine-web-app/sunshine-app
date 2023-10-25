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
          body: SingleChildScrollView(
            child: Column(
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
}
