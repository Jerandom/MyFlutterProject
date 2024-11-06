class ImageState{
  final List<String> imageID;
  final List<String> imageUrl;
  final List<String> imageAuthor;
  final int pageIndex;
  final int pageLimit;

  const ImageState({
    required this.imageID,
    required this.imageUrl,
    required this.imageAuthor,
    this.pageIndex = 0,
    this.pageLimit = 3,
  });

  factory ImageState.fromJson(Map<String, dynamic> json) => ImageState(
    imageID: List<String>.from(json['id'] as List<dynamic>),
    imageUrl: List<String>.from(json['url'] as List<dynamic>),
    imageAuthor: List<String>.from(json['author'] as List<dynamic>),
  );

  // A convenient method to create initial state
  factory ImageState.initial() => const ImageState(
    imageID: [],
    imageUrl: [],
    imageAuthor: [],
  );

  // Method to create a copy of the state with some fields replaced
  ImageState copyWith({
    List<String>? setImageID,
    List<String>? setImageUrl,
    List<String>? setImageAuthor,
    int? setPageIndex,
    int? setPageLimit,
  }) => ImageState(
    imageID: setImageID?? imageID,
    imageUrl: setImageUrl?? imageUrl,
    imageAuthor: setImageAuthor?? imageAuthor,
    pageIndex: setPageIndex?? pageIndex,
    pageLimit: setPageLimit?? pageLimit,
  );
}