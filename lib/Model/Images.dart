class imageset {
  final String image0;
  final String image1;
  final String image2;
  final String image3;

  imageset(
      {required this.image0,
      required this.image1,
      required this.image2,
      required this.image3});

  factory imageset.fromJson(Map<String, dynamic> json) {
    return imageset(
        image0: json['file0'],
        image1: json['file1'],
        image2: json['file2'],
        image3: json['file3']);
  }
}

