import 'package:flutter/material.dart';
import 'package:theratyp/ui/pages/initial_screens/home_view/widget/masonry_layout.dart';
import 'package:theratyp/ui/pages/user_screen/drawer_view.dart';
import 'package:youtube_api/youtube_api.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

//Desde aqui llamamos a la Api de Youtube para poder hacer la query.
//He puesto el limite solo a 20 videos, pero se pueden recuperar los que quieras con la variable maxResult
//Aunque maxResoult tiene un tope. Si haces muchas llamadas la Api deja de funcionar porque tiene un limiete.

class _HomeViewState extends State<HomeView> {
  final TextEditingController searchController = TextEditingController();

  late String text;

  static String key = "AIzaSyBjw98SyzLwdZ0Qo0lD_Uh54TZape07QDk"; //Codigo de la APi

  YoutubeAPI youtube = YoutubeAPI(key, maxResults: 20);

  //Lista que almacena y que paso a la pagina que construye el video con los resutlados de la query.
  List<YouTubeVideo> videoResult = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    text = 'maria plaza carrasco'; //valor inicial que le doy al text para que la home tenga una pantalla de presentacion.
    searchController.addListener(() => searchController.text);
    callAPI(); //metodo que realiza la Api.
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  //Metodo que hace las llamada a la API.
  Future<List<YouTubeVideo>> callAPI() async {
    videoResult = await youtube.search(
      text,
      order: 'relevance',
      videoDuration: 'any',
    );
    videoResult = await youtube.nextPage();
    setState(() {});

    return videoResult;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerView(),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
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
                            callAPI();
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
          Expanded(
              child: MasonryLayout(
            context,
            listaVideo: videoResult,
          )),
        ]),
      ),
    );
  }
}
