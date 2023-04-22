import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Icon(Icons.arrow_back,
                    color: Colors.black.withOpacity(0.5),size: 50),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(50)),
              ),
              Container(
                //padding: EdgeInsets.only(top: 5),
                height: 50,
                child: Column(
                  children: [
                    Container(
                      child: Text("Maria Torrez",style: TextStyle(fontSize: 25)),
                    ),
                    Container(
                      child: Text("Ingeniero en sistema",style: TextStyle(fontSize: 16)),
                    ),
                  ],
                )
              ),
              Container(
                child: Icon(Icons.more_horiz,
                    color: Colors.black.withOpacity(0.5),size: 50),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(50)),
              )
            ],
          ),
          height: 75,
        ),

        SizedBox(height: 20),
        CircleAvatar(
          backgroundColor: Colors.black54,
          radius: 50,
          child: Icon(
            Icons.person,
            color: Colors.white,
            size: 100,
          ),
        ),


                SizedBox(height: 50),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Color(0xFF9D5871),
              elevation: 15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
              child: Container(
                child: Padding(
                  padding:  EdgeInsets.only(top: 80, bottom: 80, left: 50, right: 50),
                  child: Text(
                    'Setac-03',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFFE4EAEF),
                      fontSize: 18,
                    ),
                  ),
                ),
                width: 180,
                decoration: BoxDecoration(),
              ),
            ),
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Color(0xFFC5BCE8),
              elevation: 15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
              child: Container(
                child: Padding(
                  padding:  EdgeInsets.only(top: 80, bottom: 80, left: 50, right: 50),
                  child: Text(
                    'Ingles-01',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                     color: Color(0xFF3B3C3F),
                      fontSize: 18,
                    ),
                  ),
                ),
                width: 180,
                decoration: BoxDecoration(),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Color(0xFFC5BCE8),
              elevation: 15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
              child: Container(
                child: Padding(
                    padding:  EdgeInsets.only(top: 80, bottom: 80, left: 50, right: 50),
                  child: Text(
                    'Mate-01',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                     color: Color(0xFF3B3C3F),
                      fontSize: 18,
                    ),
                  ),
                ),
                width: 180,
                decoration: BoxDecoration(),
              ),
            ),
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
               color: Color(0xFF9D5871),
              elevation: 15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
              child: Container(
                child: Padding(
                    padding:  EdgeInsets.only(top: 80, bottom: 80, left: 50, right: 50),
                  child: Text(
                    'DWeb-02',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                     color: Color(0xFFE4EAEF),
                      fontSize: 18,
                    ),
                  ),
                ),
                width: 180,
                decoration: BoxDecoration(),
              ),
            ),
          ],
        ),




      ],
    );
  }
}
