
import 'package:flutter/material.dart';
import 'package:flutter_news_app/demo_news_app/custom_widgets/custom_card_widget.dart';
import 'package:flutter_news_app/demo_news_app/model/article_model.dart';
import 'package:flutter_news_app/demo_news_app/screens/landing_screen.dart';
import 'package:flutter_news_app/demo_news_app/screens/search_item.dart';
import 'package:flutter_news_app/demo_news_app/services/api_services.dart';

class HomePage extends StatefulWidget 
{
  const HomePage({ Key? key }) : super(key: key);
  
 
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> 
{
  ApiService client = ApiService();


  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      
      appBar: AppBar
      (
         flexibleSpace: SafeArea
         (
            child: Padding
            (
              padding: const EdgeInsets.all(8.0),
                child: Row
                (
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: 
                      [
                        IconButton
                        (
                          onPressed:()
                          {
                            showSearch(context: context, delegate: SearchNews());
                          }, 
                          icon:Icon
                          (
                            Icons.search,
                            color: Colors.white,
                            size: 30,
                          )
                        ),
                        SizedBox(width: 10,),
                        Text
                        (
                          'Search in feed',
                          style: TextStyle
                          (
                            fontSize: 20,
                            color: Colors.white
                          ),
                        ),
                      ],
                ),
            ),
            ),
            actions: 
            [
              TextButton
                        (
                          
                          onPressed: ()
                          {
                            
                            //perform logout function
                            print('I am logout');
                            Navigator.of(context).pushReplacement
                            (
                              MaterialPageRoute
                              (
                                builder:(context) => LandingScreen()
                                
                              )
                            );
                          }, 
                          child: Text
                          (
                            'Logout',
                            style: TextStyle
                            (
                              color: Colors.white,
                              fontSize: 16
                            ),
                          ),
                          style: TextButton.styleFrom
                          (
                            alignment: Alignment.centerRight
                          ),
                        )
            ],
          ),
     
      body: FutureBuilder
      (
        future: client.fetchNewsArticles(),
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
                //return customCardWidget(articles[index],context);
                //return customListTile(articles[index],context);
                
              }
            );
            //return Center(child:Text('Sucess!') ,);
          }
          return Center
          (
            child: CircularProgressIndicator(),
          );
        }
      ),
    );
  }
}