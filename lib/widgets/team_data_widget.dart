import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_share_plus/open.dart';

class DataShowingWidget extends StatelessWidget {

  final String name,email,phone,position,imageLink;
  final bool facRep;

  const DataShowingWidget({super.key, this.facRep = false ,required this.name,required this.email,required this.phone,required this.position,required this.imageLink,});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Center(
          child: SizedBox(
            // height: 480,
            // width: 390,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Card(
                elevation: 1.6,
                shadowColor: Colors.green[200] ,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: const Color.fromARGB(255, 242, 186, 73),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    child: Card(
                      elevation: 20,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.0),
                          color:  Colors.white,
                        ),
                        child: Column(
                          children: [
                              const SizedBox(height: 30.0,),

                            
                            Container(
                              margin: const EdgeInsets.all(20),
                              child: CircleAvatar(
                                // child: Image.network(imageLink),
                                radius: 120,
                                backgroundImage: NetworkImage(imageLink),
                              ),
                            ),
            
                              const SizedBox(height : 25.0),
            
                              Text(
                                name,
                                textAlign: TextAlign.center,
                                style:  GoogleFonts.firaSansCondensed(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),

                              const SizedBox(height: 5.0,),
                              
            
                              Text(
                                position,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 242, 186, 73),
                                ),
                              ),
            
                              const SizedBox(height: 30.0,),
            
                              Padding(
                                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                                child: 
                                
                                facRep ? 
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: (){
                                        Open.mail(toAddress: email);
                                      },
                                      icon: Icon(
                                        CupertinoIcons.mail,
                                        size: 45,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ],
                                )
                                    
                                : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: (){
                                        Open.mail(toAddress: email);
                                      },
                                      icon: Icon(
                                        CupertinoIcons.mail,
                                        size: 45,
                                        color: Colors.grey[700],
                                      ),
                                    ),
            
                                  IconButton(
                                      onPressed: (){
                                        Open.phone(phoneNumber: "+91-$phone");
                                      },
                                      icon: Icon(
                                        CupertinoIcons.phone,
                                        size: 45,
                                        color: Colors.grey[700],
                                      ),
                                    ),
            
                                    IconButton(
                                      onPressed: (){
                                        Open.whatsApp(whatsAppNumber: "91$phone" , text: "Hello $name, ");
                                      },
                                      icon: FaIcon(
                                        FontAwesomeIcons.whatsapp,
                                        size: 45,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height : 35.0),
                            ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ); 
  }
}