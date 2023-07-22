import 'package:flutter/material.dart';
import 'package:quotes_bloc/model/quotes_data_model.dart';
import 'package:quotes_bloc/quotes_bloc/quote_bloc.dart';

class UI_Screen extends StatefulWidget {
  final BlocQuotes blocQuotes;
  final QuotesDataModel quotesDataModel;
  const UI_Screen(
      {super.key, required this.blocQuotes, required this.quotesDataModel});

  @override
  State<UI_Screen> createState() => _UI_ScreenState();
}

class _UI_ScreenState extends State<UI_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.quotesDataModel.quote,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.95),
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '-${widget.quotesDataModel.author}-',
              style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 16,
                  fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            
          ],
        ),
      ),
    );
  }
}
