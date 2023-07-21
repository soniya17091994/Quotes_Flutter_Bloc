import 'package:quotes_bloc/model/image_data_model.dart';
import 'package:quotes_bloc/model/quotes_data_model.dart';

class QuotesStates {}

class InitialState extends QuotesStates {}

class QuotesLoadingState extends QuotesStates {}

class QuotesLoadedState extends QuotesStates {
  final List<QuotesDataModel> quotes;
  QuotesLoadedState({required this.quotes});
}

class ImageLoadingState extends QuotesStates {}

class ImageLoadedState extends QuotesStates {
  List<ImageDataModel> images;
  ImageLoadedState({required this.images});
}

class ImageErrorState extends QuotesStates {}
