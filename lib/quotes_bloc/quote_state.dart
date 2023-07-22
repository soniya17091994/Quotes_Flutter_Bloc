import 'package:quotes_bloc/model/quotes_data_model.dart';

class QuotesStates {}

class InitialState extends QuotesStates {}

class QuotesLoadingState extends QuotesStates {}

class QuotesLoadedState extends QuotesStates {
  final List<QuotesDataModel> quotes;
  List? imageList;
  QuotesLoadedState(
      {required this.quotes,
      required this.imageList});
}

class ImageErrorState extends QuotesStates {}
