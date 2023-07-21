import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:quotes_bloc/quotes_bloc/quote_bloc.dart';
import 'package:quotes_bloc/quotes_bloc/quote_event.dart';
import 'package:quotes_bloc/quotes_bloc/quote_state.dart';
import 'package:quotes_bloc/ui/ui_screen.dart';
//import 'package:flutter_blurhash/flutter_blurhash.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  @override
  void initState() {
    blocQuotes.add(QuotesInitialEvent());
    blocQuotes.add(GetImages());
    super.initState();
  }

  final BlocQuotes blocQuotes = BlocQuotes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BlocQuotes, QuotesStates>(
          bloc: blocQuotes,
          builder: (context, state) {
            if (state is QuotesLoadingState) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            } else if (state is QuotesLoadedState) {
              return Scaffold(
                body: Stack(
                  children: [
                    Container(
                      color: Colors.black,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: SafeArea(
                          child: CarouselSlider.builder(
                              itemCount: state.quotes.length,
                              itemBuilder: (context, index1, index2) {
                                return UI_Screen(
                                    blocQuotes: blocQuotes,
                                    quotesDataModel: state.quotes[index1]);
                              },
                              options: CarouselOptions(
                                  scrollDirection: Axis.vertical,
                                  pageSnapping: true,
                                  initialPage: 0,
                                  enlargeCenterPage: true,
                                  onPageChanged: (index, value) {
                                    HapticFeedback.lightImpact();
                                  }))),
                    ),
                  ],
                ),
              );
            }
            else if(state is ImageLoadedState){
              return Scaffold(body: 
              AnimatedSwitcher(
                   duration:const Duration(seconds: 1),
                   child: BlurHash(
                     key: ValueKey(state.images),
                     hash: state.images.toString(),
                     duration: const Duration(milliseconds: 500),
                     image: state.images.toString(),
                     curve: Curves.easeInOut,
                     imageFit: BoxFit.cover,
                   ),
                 ),);
            }
            return SizedBox();
          }),
    );
  }
}
