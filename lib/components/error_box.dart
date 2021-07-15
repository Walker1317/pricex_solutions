import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {
  ErrorBox({this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    if (message == null) return Container();
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.red,
      ),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.error_outline,
            color: Colors.white,
            size: 40,
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Text(
              "Oops! $message. Por favor, tente novamente.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
