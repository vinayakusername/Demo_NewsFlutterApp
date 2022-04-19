import 'package:flutter/material.dart';
import 'package:flutter_news_app/demo_news_app/custom_widgets/custom_card_widget.dart';
import 'package:flutter_news_app/demo_news_app/model/article_model.dart';
import 'package:flutter_news_app/demo_news_app/services/api_services.dart';

class SearchNews extends SearchDelegate
{
 
  
  ApiService client = ApiService();

  @override
  List<Widget>? buildActions(BuildContext context) 
  {
    return 
    [
      IconButton
      (
        onPressed:()
        {
          query = "";
        }, 
        icon:Icon(Icons.close)
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) 
  {
    return IconButton
    (
      onPressed:()
      {
        Navigator.of(context).pop();
      }, 
      icon: Icon(Icons.arrow_back)
    );
  }

  @override
  Widget buildResults(BuildContext context) 
  {
   return FutureBuilder
      (
        future: client.fetchNewsArticles(query: query),
        builder:(BuildContext context,AsyncSnapshot<List<Article>> snapshot)
        {
          if(snapshot.hasData)
          {
            List<Article> articles = snapshot.data!;
            return ListView.builder
            (
              itemCount: articles.length,
              itemBuilder: (context,index)
              {
                return buildCustomCardWidget(articles[index], context);
              }
            );
           
          }
          return Center
          (
            child: CircularProgressIndicator(),
          );
        }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) 
  {
     return Center
     (
       child: Text
       (
         'Search news here and get results !!!',
         style: TextStyle
         (
           fontWeight: FontWeight.bold,
           fontSize: 20
         ),
       )
     );
  }
  
}