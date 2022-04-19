import 'package:flutter/material.dart';
import 'package:flutter_news_app/demo_news_app/model/article_model.dart';

class ArticlePage extends StatelessWidget 
{
  final Article article;
  const ArticlePage({ Key? key, required this.article }) : super(key: key);

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text(article.title!),
      ),
      body: Padding
      (
        padding: EdgeInsets.all(8.0),
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: 
          [
             Container
            (
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration
              (
                image: DecorationImage
                (
                  image:NetworkImage(article.urlToImage!),
                  fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.circular(12.0)
              ),
            ),
            SizedBox(height: 8.0,),
            Container
            (
              decoration: BoxDecoration
              (
                color: Colors.red,
                borderRadius: BorderRadius.circular(30.0)
              ),
              child: Padding
              (
                padding: const EdgeInsets.all(8.0),
                child: Text
                (
                  article.source!.name!,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 8.0,),
            Text
            (
              'Description',
              style: TextStyle
              (
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),
            SizedBox(height: 8.0,),
            Text
            (
              article.description!,
              style: TextStyle
              (
                fontWeight: FontWeight.normal,
                fontSize: 16.0
              ),
            ),
            SizedBox(height: 8.0,),
            SizedBox(height: 8.0,),
            Text
            (
              'Content',
              style: TextStyle
              (
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),
            Text
            (
              article.content!,
              style: TextStyle
              (
                fontWeight: FontWeight.normal,
                fontSize: 16.0
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}