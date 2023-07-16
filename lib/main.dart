import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_bloc/ui/quote_screen.dart';
import 'package:quotes_bloc/quotes_bloc/quote_bloc.dart';

void main() {
  runApp(QuotesBloc());
}
class QuotesBloc extends StatelessWidget {
  const QuotesBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
     create: (_)=>BlocQuotes(),
     child: const MaterialApp(
      title: 'Quotes Bloc',
      debugShowCheckedModeBanner: false,
      home: QuoteScreen(),
     ),
    );
  }
}
