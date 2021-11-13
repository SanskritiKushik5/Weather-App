import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'city': result['city'],
                        'temp': result['temp'],
                        'minTemp': result['minTemp'],
                        'maxTemp': result['maxTemp'],
                        'desc': result['desc'],
                        'icon': result['icon']
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[500],
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ),
                const SizedBox(height: 100.0),
                Text(
                data['icon'],
                style: TextStyle(
                  fontFamily: 'MaterialIcons',
                  color: Colors.grey[200],
                  fontSize: 50.0,
                ),
              ),

                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['city'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.grey[300],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20.0),
                Text(
                  '${data['temp']} \u2103',
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.grey[300],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '${data['desc']}',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.grey[500],
                  ),
                ),
                const SizedBox(height: 140),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: [
                          Text(
                            '${data['minTemp']} \u2103',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.grey[300],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'MIN-TEMP',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '${data['maxTemp']} \u2103',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.grey[300],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'MAX-TEMP',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
