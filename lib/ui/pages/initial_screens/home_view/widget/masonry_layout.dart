
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:youtube_api/youtube_api.dart';

class MasonryLayout extends StatefulWidget {
  const MasonryLayout (BuildContext context, {Key? key}) : super(key: key);

  @override
  State<MasonryLayout> createState() => _MasonryLayout();
}

class _MasonryLayout extends State<MasonryLayout> {

  static String key = "AIzaSyBjw98SyzLwdZ0Qo0lD_Uh54TZape07QDk";

  YoutubeAPI youtube = YoutubeAPI(key, maxResults: 100);

  List<YouTubeVideo> videoResult = [];


  Future<void> callAPI() async {
    String query = "pilates";
    videoResult = await youtube.search(
      query,
      order: 'relevance',
      videoDuration: 'any',
    );
    videoResult = await youtube.nextPage();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    callAPI();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlignedGridView.count(
      crossAxisSpacing: 6,
      mainAxisSpacing: 6,
      crossAxisCount: 2,
      //gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: videoResult.length,
      itemBuilder: (context, index){
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(videoResult[index].thumbnail.small.url ?? '',
            fit: BoxFit.cover,),
        );
      },
    );
  }
}
