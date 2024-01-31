import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:open_share_plus/open.dart';
import 'package:sunshine_iith/providers/data_provider.dart';
import 'package:sunshine_iith/services/data_model.dart';
import 'package:sunshine_iith/services/session_data.dart';

class ConfirmSlot extends ConsumerStatefulWidget {
  final DataModel counsellor;
  final String mode;
  const ConfirmSlot({super.key, required this.counsellor, required this.mode});

  @override
  ConsumerState<ConfirmSlot> createState() => _ConfirmSlotState();
}

enum Communication { whatsapp, mail }

class _ConfirmSlotState extends ConsumerState<ConfirmSlot> {
  TextEditingController textEditingController = TextEditingController();

  void slotBook(String? number) {}
  String uid = "";
  Communication? _valueCommunication = Communication.whatsapp;

  @override
  void initState() {
    setState(() {
      uid = FirebaseAuth.instance.currentUser!.uid;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? selectedDate = ref.read(selectedDateProvider);
    String? selectedTime = ref.read(selectedTimeProvider);

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Theme(
          data: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 244, 197, 54),
                primary: const Color.fromARGB(255, 21, 101, 192)),
            useMaterial3: true,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(150),
                ),
                height: 6,
                width: 60,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                  'Review your filled data:',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(11.0),
                            child: Text(
                              'Selected Counsellor:',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(11.0),
                            child: Text(
                              'Selected Mode:',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(11.0),
                            child: Text(
                              'Selected Date:',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(11.0),
                            child: Text(
                              'Selected Time:',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8.5, 0, 8.5),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                widget.counsellor.name,
                                // maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.orange),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8.5, 0, 8.5),
                            child: Text(
                              widget.mode,
                              style: const TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.orange),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8.5, 0, 8.5),
                            child: Text(
                              selectedDate ?? '',
                              style: const TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.orange),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8.5, 0, 8.5),
                            child: Text(
                              selectedTime ?? '',
                              style: const TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.orange),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Select your prefered mode of communication',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.2),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
                child: ListTile(
                  title: const Text(
                    'Whatsapp',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.2),
                  ),
                  leading: Radio(
                    value: Communication.whatsapp,
                    groupValue: _valueCommunication,
                    onChanged: (value) => setState(() {
                      _valueCommunication = value;
                    }),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: ListTile(
                  title: const Text('Mail',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.2)),
                  leading: Radio(
                    value: Communication.mail,
                    groupValue: _valueCommunication,
                    onChanged: (value) => setState(() {
                      _valueCommunication = value;
                    }),
                  ),
                ),
              ),

              const SizedBox(
                height: 24,
              ),
              // Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 21, 101, 192),
                    elevation: 2,
                  ),
                  onPressed: () async {
                    FocusScope.of(context).unfocus();

                    String userName =
                        FirebaseAuth.instance.currentUser!.displayName!;
                    String email = FirebaseAuth.instance.currentUser!.email!;

                    SessionData data = SessionData(
                        isSir: widget.counsellor.position == 'sir',
                        counsellorsEmail: widget.counsellor.email,
                        counsellorsPhone: widget.counsellor.phone,
                        date: ref.read(selectedDateProvider)!,
                        email: email,
                        name: userName,
                        time: ref.read(selectedTimeProvider)!,
                        counsellorsName: widget.counsellor.name,
                        mode: widget.mode.toLowerCase(),
                        phone: textEditingController.text.toString().trim());

                    bookSlot(data);

                    await Future.delayed(const Duration(milliseconds: 200));

                    if (mounted) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    }

                    ref.read(selectedTimeProvider.notifier).state = null;
                    ref.read(selectedDateProvider.notifier).state = null;
                  },
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Text(
                      'BOOK',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.5,
                          letterSpacing: 1.2),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void bookSlot(SessionData data) {
    String what = 'madam';
    if (data.isSir) {
      what = 'sir';
    }

    final weekday = getWeekdayName(data.date);

    String massage =
        'Hi $what, I am ${data.name}. I was wondering if I could meet you for an ${data.mode} session on $weekday, ${data.date} at ${data.time}. ';

    if (_valueCommunication == Communication.whatsapp) {
      Open.whatsApp(
          whatsAppNumber: '91${data.counsellorsPhone}', text: massage);
    } else {
      Open.mail(
        toAddress: data.counsellorsEmail,
        subject: 'Regarding Slot for a Session',
        body: massage,
      );
    }
  }

  String getWeekdayName(String dateString) {
    try {
      final inputFormat = DateFormat('dd/MM/yyyy');

      final date = inputFormat.parse(dateString);

      final outputFormat = DateFormat('EEEE');

      final weekdayName = outputFormat.format(date);

      return weekdayName;
    } catch (e) {
      debugPrint("Error while converting date to weekdays : $e");
      throw "Invalid Date";
    }
  }
}
