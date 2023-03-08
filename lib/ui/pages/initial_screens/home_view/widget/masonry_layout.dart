import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:theratyp/data/data_holder.dart';
import 'package:theratyp/ui/pages/initial_screens/home_view/widget/video_player.dart';
import 'package:youtube_api/youtube_api.dart';

//Este Widget construye las presentaciones de los videos de Youtube.

class MasonryLayout extends StatelessWidget {

  final List<YouTubeVideo> listaVideo;

  const MasonryLayout(BuildContext context,
      {super.key, required this.listaVideo});

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
      return AlignedGridView.count(
        crossAxisSpacing: 6,
        mainAxisSpacing: 6,
        crossAxisCount: 2,
        //gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: listaVideo.length,
        itemBuilder: (context, index) {
        return InkWell(
          onTap: (){
            DataHolder().videoUrlYoutube = listaVideo[index].url.toString();
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  VideoPlayer(),),
            );
            print(listaVideo[index].url.toString());
            },
          child: ClipRRect(
            //clipper: ,
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              listaVideo[index].thumbnail.small.url ?? '',
              //Muestra la imagen de inicio de los videos.
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
