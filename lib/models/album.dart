class Albums {
  List<Album> album;
  bool ok;

  Albums({required this.album, required this.ok});

  factory Albums.fromJson(Map<String, dynamic> json) {
    return Albums(
      album: json['album'],
      ok: json['ok'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ok'] = this.ok;
    if (this.album != null) {
      data['celulares'] = this.album.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({required this.userId, required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}
