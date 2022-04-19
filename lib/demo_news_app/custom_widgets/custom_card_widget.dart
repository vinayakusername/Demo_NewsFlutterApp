import 'package:flutter/material.dart';
import 'package:flutter_news_app/demo_news_app/model/article_model.dart';
import 'package:flutter_news_app/demo_news_app/screens/article_details_screen.dart';

Widget buildCustomCardWidget(Article article,BuildContext context)
{
    return InkWell
    (
       onTap: ()
     {
       Navigator.of(context).push
       (
         MaterialPageRoute
         (
           builder: (context)=>ArticlePage(article: article)
         )
       );
     },
     child: Card
     (
        elevation: 6.0,
        shape: RoundedRectangleBorder
              (
                borderRadius: BorderRadius.circular(10)
              ),
        
        child:SingleChildScrollView
        (
          scrollDirection: Axis.horizontal,
          child:Padding
          ( 
            padding: EdgeInsets.all(12.0),
            child:Row
                (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: 
                  [
                    Column
                      (
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: 
                        [
                          Row
                          (
                            children: 
                            [
                              Text(article.publishedAt!,textAlign: TextAlign.right,),
                              
                              SizedBox(width: 6.0,),
                              
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
                            ],
                          ),
                          
                          SizedBox(height: 10,),
                          
                          Container
                          (
                            width: 250,
                            height: 80,
                            child: Text
                             (
                              article.title!,
                              style: TextStyle
                              (
                                fontSize: 15
                              ),
                             ),
                          ),
                          
                        ],
                      ),
                    Padding
                    (
                      padding: const EdgeInsets.all(15.0),
                      child: ClipRRect
                      (
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network
                        (
                          article.urlToImage!,
                          width: 80,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                   
                  ],
                ),
        ),
        ),
     ),
    );
}