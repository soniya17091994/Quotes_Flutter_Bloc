class QuotesDataModel {
  final String quote;
  final String author;

  QuotesDataModel({required this.quote, required this.author});
}

class ImageDataModel {
  List? imageList;
  int imageNumber = 0;
  ImageDataModel({required this.imageList,required this.imageNumber});
}
