import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quotes_bloc/quotes_bloc/quote_bloc.dart';
import 'package:quotes_bloc/quotes_bloc/quote_event.dart';
import 'package:quotes_bloc/quotes_bloc/quote_state.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  _QuoteScreenState();

  @override
  void initState() {
    blocQuotes.add(QuotesInitialEvent());
    super.initState();
  }

  final BlocQuotes blocQuotes = BlocQuotes();
  int? imageNumber=0;

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
                          AnimatedSwitcher(
                            duration: const Duration(seconds: 1),
                            child: BlurHash(
                              key: ValueKey(
                                  state.imageList![imageNumber!]['blur_hash']),
                              hash: state.imageList![imageNumber!]['blur_hash'],
                              duration: const Duration(milliseconds: 500),
                              image: state.imageList![imageNumber!]['urls']
                                  ['regular'],
                              curve: Curves.easeInOut,
                              imageFit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            color: Colors.black.withOpacity(0.6),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: SafeArea(
                                child: CarouselSlider.builder(
                                    itemCount: state.quotes.length,
                                    itemBuilder: (context, index1, index2) {
                                      return SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              state.quotes[index1].quote,
                                              style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.95),
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w600),
                                              textAlign: TextAlign.center,
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              '-${state.quotes[index1].author}-',
                                              style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.5),
                                                  fontSize: 16,
                                                  fontStyle: FontStyle.italic),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    options: CarouselOptions(
                                        scrollDirection: Axis.vertical,
                                        pageSnapping: true,
                                        initialPage: 0,
                                        enlargeCenterPage: true,
                                        onPageChanged: (index, value) {
                                          HapticFeedback.lightImpact();
                                          imageNumber = index;
                                          setState(() {});
                                        }))),
                          ),
                          Positioned(
                              top: 50,
                              right: 30,
                              child: Row(
                                children: [
                                  Text(
                                    state.imageList![imageNumber!]['user']
                                        ['username'],
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.5),
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic),
                                  ),
                                  Text(
                                    ' On ',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.5),
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic),
                                  ),
                                  Text(
                                    'Unsplash',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.5),
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic),
                                  )
                                ],
                              )),
                        ],
                      )
              );
            } else {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black.withOpacity(0.6),
                  child: const SizedBox(
                    width: 100,
                    height: 100,
                    child: SpinKitFadingCircle(color: Colors.white),
                  ));
            }
          }),
    );
  }
}
