import 'dart:convert';
import 'package:flutter_news_app/demo_news_app/model/article_model.dart';
import 'package:http/http.dart';



//This class allows us to fetch the data from http api and then return a list of articles.
class ApiService
{
  
   final endPointUrl = 
   "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=Enter Your API Key";

   
  Future<List<Article>> fetchNewsArticles({String? query}) async 
  {
   Response res = await get(Uri.parse(endPointUrl));

   if(res.statusCode == 200)
   {
     Map<String,dynamic> json = jsonDecode(res.body);
     
     List<dynamic> body = json['articles'];
     
     List<Article> articles = body.map((dynamic item) => Article.fromJson(item) ).toList();

     if(query!=null)
     {
       articles = articles.where
       (
         (element) => element.title!.toLowerCase().contains(query.toLowerCase()) 
       ).toList();
     }

     return articles;
   }
   else
   {
     throw("Can't get articles");
   }

   // Use the compute function to run parsePhotos in a separate isolate.
   //return compute(parseNewsArticles,response.body);
  }

}