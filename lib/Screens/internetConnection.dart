import 'package:flutter/material.dart';

import '../providers/connectivityProvider.dart';

class ConnectionScreen extends StatefulWidget {
  final Widget child;

  ConnectionScreen({required this.child});

  @override
  _ConnectionScreenState createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen> {
  bool _isConnected = false;

  @override
  void initState() {
    super.initState();
    checkInternetConnection();
  }

  Future<void> checkInternetConnection() async {
    bool isConnected = await isInternetConnected();
    setState(() {
      _isConnected = isConnected;
    });
  }

  void retry() {
    checkInternetConnection();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isConnected) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.signal_wifi_off,
                size: 50,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'No Internet Connection',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(102, 187, 106, 1)),
                onPressed: retry,
                child: Text('Retry'),
              ),
            ],
          ),
        ),
      );
    } else {
      return widget.child;
    }
  }
}
