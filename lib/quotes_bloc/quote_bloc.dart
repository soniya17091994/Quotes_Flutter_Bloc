import 'dart:async';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_bloc/data/quotes.dart';
import 'package:quotes_bloc/data/repository.dart';
import 'package:quotes_bloc/quotes_bloc/quote_event.dart';
import 'package:quotes_bloc/quotes_bloc/quote_state.dart';

import '../model/quotes_data_model.dart';

class BlocQuotes extends Bloc<QuoteEvent, QuotesStates> {
  BlocQuotes() : super(InitialState()) {
    on<QuotesInitialEvent>(quotesInitialEvent);
    on<GetImages>(getImages);
  }

  FutureOr<void> quotesInitialEvent(
      QuotesInitialEvent event, Emitter<QuotesStates> emit) async {
    emit(QuotesLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    emit(QuotesLoadedState(
        quotes: QuotesData.quotesList
            .map((e) => QuotesDataModel(
                  quote: e['quote'],
                  author: e['author'],
                ))
            .toList()));
  }

  Future<void> getImages(GetImages event, Emitter<QuotesStates> emit) async {
    emit(ImageLoadingState());
    ImageRepository imageRepository = ImageRepository();
    final imageResponse = await imageRepository.getImages();
    if (imageResponse.statusCode == 200) {
      final imageResponseJson = imageResponse.body;
      final decodedJson = jsonDecode(imageResponseJson);
      final imageList = decodedJson['results'];
      emit(ImageLoadedState(images: imageList));
    } else {
      emit(ImageErrorState());
    }
  }
}