class Video {
  final String? id;
  final String? kind;
  final String? title;
  final String? thubnaiUrl;
  final String? channelUrl;
  final String? url;

  Video({
    this.id,
    this.kind,
    this.title,
    this.thubnaiUrl,
    this.channelUrl,
    this.url,
  });

  factory Video.fromMap(Map<String, dynamic> map) {
    return Video(
        id: map['id'],
        kind: map["kind"],
        title: map['title'],
        thubnaiUrl: map['default']['medium']['high'],
        channelUrl: map['channelTitle'],
        url: map["url"],
    );
  }
}
