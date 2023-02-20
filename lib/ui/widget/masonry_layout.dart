
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MasonryLayout extends StatefulWidget {
  const MasonryLayout (BuildContext context, {Key? key}) : super(key: key);

  @override
  State<MasonryLayout> createState() => _State();
}

class _State extends State<MasonryLayout> {
  @override
  Widget build(BuildContext context) {
    return AlignedGridView.count(
      crossAxisSpacing: 6,
      mainAxisSpacing: 6,
      crossAxisCount: 2,
      //gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: 100,
        itemBuilder: (context, index){
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network("https://source.unsplash.com/random?sig=$index",
            fit: BoxFit.cover,),
          );
        },
    );
  }
}
