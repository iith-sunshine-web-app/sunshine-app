import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunshine_iith/pages/session_book.dart/select_slot.dart';
import 'package:sunshine_iith/providers/data_provider.dart';
import 'package:sunshine_iith/services/rtdb_database.dart';
import 'package:sunshine_iith/services/session_data.dart';

class AddBookedSession extends ConsumerStatefulWidget {
  // final DataModel currentCounsellorsData;
  final String counsellorsName;
  const AddBookedSession({super.key, required this.counsellorsName});

  @override
  ConsumerState<AddBookedSession> createState() => _AddBookedSessionState();
}

class _AddBookedSessionState extends ConsumerState<AddBookedSession> {
  String selectedTime = 'Select a slot';
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (ref.watch(selectedTimeProvider) != null) {
      // selectedTime = ref.watch(selectedTimeProvider)!;
      selectedTime =
          'Date: ${ref.watch(selectedDateProvider)!}\nTime: ${ref.watch(selectedTimeProvider)!}';
    }
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
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Add a booked session!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => SelectSlot(
                                counsellorsName: widget.counsellorsName,
                              )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: InputDecorator(
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.chevron_right,
                              size: 28,
                              // color: Colors.orange.withOpacity(0.6),
                            ),
                            // labelText: 'Time',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  25.0,
                                ),
                                borderSide: const BorderSide(
                                    color: Colors.orange, width: 1.5)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  25.0,
                                ),
                                borderSide: const BorderSide(
                                    color: Colors.orange, width: 1.5)),
                          ),
                          child: Text(
                            selectedTime,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.6)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                child: TextField(
                  maxLines: 5,
                  controller: textEditingController,
                  decoration: InputDecoration(
                    hintText: 'Write Description (Optional)',
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
                height: 40,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 21, 101, 192),
                    elevation: 2,
                  ),
                  onPressed: selectedTime == 'Select a slot'
                      ? null
                      : () async {
                          FocusScope.of(context).unfocus();

                          SessionData data = SessionData(
                              // isSir: widget.counsellor.position == 'sir',
                              counsellorsEmail: '',
                              counsellorsPhone: '',
                              date: ref.read(selectedDateProvider)!,
                              email: '',
                              name: '',
                              time: ref.read(selectedTimeProvider)!,
                              counsellorsName: widget.counsellorsName,
                              mode: 'widget.mode',
                              phone:
                                  textEditingController.text.toString().trim());

                          RealTimeDB().addSessionData(data);
                          Navigator.pop(context);

                          ref.read(bookedSessionProvider.notifier).addData(data.date, data);

                          ref.read(selectedTimeProvider.notifier).state = null;
                          ref.read(selectedDateProvider.notifier).state = null;

                        },
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Text(
                      'Add',
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
