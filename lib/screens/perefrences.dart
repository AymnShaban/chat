import 'package:flutter/material.dart';

class PreferencesScreen extends StatelessWidget {
  const PreferencesScreen({super.key});
  static String id = "PreferencesScreen";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        leading: const Icon(Icons.keyboard_backspace,size: 30,),
        title: const Text("Preferences"),
        centerTitle: true,
      ),
      body:  Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      'assets/images/J.jpg',
                      width: 170.0,
                      height: 110.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(width: 15,),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Grand Canyon",style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),),
                        const SizedBox(height: 6,),
                        const Row(
                          children: [

                            Icon(Icons.adb_outlined,color: Colors.blueGrey,size: 17,),
                            Text("aymn",style: TextStyle(
                                color: Colors.blueGrey
                            ),),

                          ],
                        ),
                        const SizedBox(height: 6,),
                        const Row(
                          children: [
                            Text("\$90",style: TextStyle(
                                color: Colors.cyan
                            ),),
                            SizedBox(width: 5,),
                            Text("aymn",style: TextStyle(
                                color: Colors.blueGrey
                            ),),
                          ],
                        ),
                        const SizedBox(height: 6,),
                        Container(

                          decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(34),

                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15,left: 15),
                            child: const Text("book now",style: TextStyle(
                                color: Colors.white
                            ),),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 29,),
                  Padding(
                    padding: const EdgeInsets.only(top: 9),
                    child: Row(

                      children: [
                        Icon(Icons.star,color: Colors.yellow,size: 16,),
                        Text("4.5",style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 11
                        ),)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
