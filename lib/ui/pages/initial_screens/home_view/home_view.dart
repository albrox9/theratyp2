import 'package:flutter/material.dart';
import 'package:theratyp/ui/pages/initial_screens/home_view/widget/masonry_layout.dart';
import 'package:theratyp/ui/pages/user_screen/drawer_view.dart';
import 'package:youtube_api/youtube_api.dart';

class HomeView extends StatefulWidget {

  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();

}

class _HomeViewState extends State<HomeView> {



  final TextEditingController searchController = TextEditingController();

  late String text;

  static String key = "AIzaSyBjw98SyzLwdZ0Qo0lD_Uh54TZape07QDk";

  YoutubeAPI youtube = YoutubeAPI(key, maxResults: 3);


  List<YouTubeVideo> videoResult = [];


  //late String consulta;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    text = searchController.text;
    searchController.addListener(() => searchController.text);
    //callAPI();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<List<YouTubeVideo>> callAPI() async {

    videoResult = await youtube.search(
      text,
      order: 'relevance',
      videoDuration: 'any',
    );
    videoResult = await youtube.nextPage();
    setState(() {

    });

    return videoResult;
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerView(),
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Column(children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30))),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    text: 'Find Your ',
                    style: TextStyle(color: Colors.black54, fontSize: 23),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Tip',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: Colors.green)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade50,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    controller: searchController,
                    //keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        color: Colors.black54,
                        onPressed: () {
                            setState(() {
                              text = searchController.text;
                              //callAPI();
                            });
                        },
                      ),
                      hintText: text,
                      hintStyle:
                          const TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Expanded(child: MasonryLayout(context,listaVideo: videoResult,)),
        ]),
      ),
    );
  }
}
