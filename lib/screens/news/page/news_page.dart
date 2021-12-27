import 'package:fitness_flutter/data/article_model.dart';
import 'package:fitness_flutter/screens/news/bloc/news_bloc.dart';
import 'package:fitness_flutter/screens/news/bloc/news_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bloc News')),
      body: BlocBuilder<NewsBloc, NewsStates>(
        builder: (BuildContext context, NewsStates state) {
          if (state is NewsLoadingState) {
            //print('LOG: NewsLoadingState');
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NewsLoadedState) {
            //print('LOG: NewsLoadedState');
            List<ArticleModel> _articleList = [];
            _articleList = state.articleList;
            return ListView.builder(
                itemCount: _articleList.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 1,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                              height: 120,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        _articleList[index].urlToImage ??
                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSojwMMYZgtiupM4Vzdb5iBeE4b0Mamf3AgrxQJR19Xa4oIWV5xun9a02Ggyh4bZAurP_c&usqp=CAU",
                                      ),
                                      fit: BoxFit.cover))),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  _articleList[index].title ??
                                      'No Title Available',
                                  style: const TextStyle(fontSize: 15)),
                              const SizedBox(height: 10),
                              Text(
                                  'News Date: ${_articleList[index].publishedAt!.substring(0, 10)}',
                                  style: const TextStyle(fontSize: 12)),
                            ],
                          ),
                        ),
                        const SizedBox(width: 5),
                      ],
                    ),
                  );
                });
          } else if (state is NewsErrorState) {
            //print('LOG: NewsErrorState');
            String error = state.errorMessage;

            return Center(child: Text(error));
          } else {
            //print('LOG: Else State');
            return const Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.red,
            ));
          }
        },
      ),
    );
  }
}
