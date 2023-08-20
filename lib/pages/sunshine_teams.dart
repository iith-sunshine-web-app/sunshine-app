import 'package:flutter/material.dart';

class TeamPage extends StatelessWidget {
  TeamPage({super.key});

  var arrListItem = ['FACULTY IN-CHARGE' , 'COUNSELLORS' , 'FACULTY REPRESENTATIVES' , 'STUDENT HEADS'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sunshine Team',
          style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.1,
            ),
          ),
          backgroundColor: Colors.orange[300],
      ),
      body: ListView(
        children: [
          Image.asset('assets/images/sunshine_3.jpg'),

          //first item
          InkWell(
            onTap: (){},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 10.0,),
                Container(
                  height: 150.0,
                  color: const Color.fromARGB(255,255, 223, 119),
                  child: Center(
                    child: Text(
                      arrListItem[0],
                      style: const TextStyle(
                        fontSize: 16.0,
                        letterSpacing: 0.025,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5.0,),
              ],
            ),
          ),

          //second item
          InkWell(
            onTap: (){},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 5.0,),
                Container(
                  height: 150.0,
                  color: const Color.fromARGB(255, 252, 207, 62),
                  child: Center(
                    child: Text(
                      arrListItem[1],
                      style: const TextStyle(
                        fontSize: 16.0,
                        letterSpacing: 0.025,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5.0,),
              ],
            ),
          ),

          //third item
          InkWell(
            onTap: (){},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 5.0,),
                Container(
                  height: 150.0,
                  color: const Color.fromARGB(255,251, 177, 36),
                  child: Center(
                    child: Text(
                      arrListItem[2],
                      style: const TextStyle(
                        fontSize: 16.0,
                        letterSpacing: 0.025,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5.0,),
              ],
            ),
          ),

          //fourth item
          InkWell(
            onTap: (){},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 5.0,),
                Container(
                  height: 150.0,
                  color: const Color.fromARGB(255,253, 154, 36),
                  child: Center(
                    child: Text(
                      arrListItem[3],
                      style: const TextStyle(
                        fontSize: 16.0,
                        letterSpacing: 0.025,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5.0,),
              ],
            ),
          ),
        
        ],
      )
      
    );
  }
}