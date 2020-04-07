import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  @override
  Widget build(BuildContext context) {

   data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
   String location = data['location'].replaceAll(' ','');
   //print(location);
    return Scaffold(
      backgroundColor:Colors.indigo[50],
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$location.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
              child: Card(
                color: Colors.black26,
                margin: EdgeInsets.fromLTRB(10,0,10,290),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton.icon(
                      color: Colors.blueGrey[50],
                        onPressed: () async{
                         dynamic result = await Navigator.pushNamed(context, '/location');
                         setState(() {
                           data = {
                             'time': result['time'],
                             'location': result['location'],
                             'flag': result['flag'],
                           };
                         });
                        },
                        icon: Icon(
                            Icons.edit_location,
                          color: Colors.indigo[800],
                          size: 25.0,
                        ),
                        label: Text(
                            'Edit Location',
                          style: TextStyle(
                            color: Colors.indigo[800],
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          data['location'],
                          style: TextStyle(
                            fontSize: 30.0,
                            letterSpacing: 2.0,
                            color: Colors.lightBlue[50],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      data['time'],
                      style: TextStyle(
                        fontSize: 68.0,
                        color: Colors.lightBlue[50],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ) ),
    );
  }
}
