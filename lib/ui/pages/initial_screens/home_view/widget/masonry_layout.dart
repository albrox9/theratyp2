import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:youtube_api/youtube_api.dart';

class MasonryLayout extends StatelessWidget {

  final List<YouTubeVideo> listaVideo;

  const MasonryLayout(BuildContext context,
      {super.key, required this.listaVideo});



  @override
  Widget build(BuildContext context) {
    List<String> favoritos = [];
    // TODO: implement build
    return InkWell(
      onLongPress: (){print("toque");},
      child: AlignedGridView.count(
        crossAxisSpacing: 6,
        mainAxisSpacing: 6,
        crossAxisCount: 2,
        //gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: listaVideo.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            //clipper: ,
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              listaVideo[index].thumbnail.small.url ?? '',
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
