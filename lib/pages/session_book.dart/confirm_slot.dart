import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunshine_iith/providers/data_provider.dart';
import 'package:sunshine_iith/services/data_model.dart';
import 'package:sunshine_iith/services/rtdb_database.dart';
import 'package:sunshine_iith/services/session_data.dart';

class ConfirmSlot extends ConsumerStatefulWidget {
  final DataModel counsellor;
  final String mode;
  const ConfirmSlot({super.key, required this.counsellor, required this.mode});

  @override
  ConsumerState<ConfirmSlot> createState() => _ConfirmSlotState();
}

class _ConfirmSlotState extends ConsumerState<ConfirmSlot> {
  TextEditingController textEditingController = TextEditingController();

  void slotBook(String? number) {}
  String uid = "";

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
                      padding: EdgeInsets.only(left: 40),
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
                      padding: const EdgeInsets.only(right: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.5),
                            child: Text(
                              widget.counsellor.name,
                              style: const TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.orange),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.5),
                            child: Text(
                              widget.mode,
                              style: const TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.orange),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.5),
                            child: Text(
                              selectedDate ?? '',
                              style: const TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.orange),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.5),
                            child: Text(
                              selectedTime ?? '' ,
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
                height: 44,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                child: TextField(
                  controller: textEditingController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: 'Enter Phone Number (Optional)',
                    // labelText: 'Phone Number',
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: Colors.orange,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          const BorderSide(color: Colors.orange, width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          const BorderSide(color: Colors.orange, width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          const BorderSide(color: Colors.orange, width: 1.5),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 48,
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
                        date: ref.read(selectedDateProvider)!,
                        email: email,
                        name: userName,
                        time: ref.read(selectedTimeProvider)!,
                        counsellorsName: widget.counsellor.name,
                        mode: widget.mode,
                        phone: textEditingController.text.toString().trim());

                    RealTimeDB().addSessionData(data, uid);

                    await Future.delayed(const Duration(milliseconds: 500));

                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.orange,
                        content: Text(
                          'Your session has been booked',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                    ref.read(selectedTimeProvider.notifier).state = null;
                    ref.read(selectedDateProvider.notifier).state = null;
                  },
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Text(
                      'Book',
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
}
