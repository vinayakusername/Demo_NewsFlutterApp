import 'package:flutter/material.dart';
import 'package:flutter_news_app/demo_news_app/screens/login_screen.dart';
import 'package:flutter_news_app/demo_news_app/screens/sign_up_screen.dart';

class LandingScreen extends StatelessWidget 
{

  @override
  Widget build(BuildContext context) 
  {
     return DefaultTabController(
      length: 2,
      child: Scaffold
      (
        backgroundColor: Color.fromRGBO(220,220,220,100),
        appBar: AppBar
        (
          title: Text("Flutter News App "),
        ),
        body: Column
        (
            children: 
            [
              Container(
                height: 45,
                decoration: BoxDecoration
                (
                  color: Colors.white,
                  border: Border.all
                  (
                    color: Colors.red,
                    width: 2
                  ),
                  borderRadius: const BorderRadius.only
                  (
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25) 
                  )
                ),
                child:  TabBar
                (
                  indicator: BoxDecoration
                  (
                    color: Colors.red,
                    borderRadius:  const BorderRadius.only
                    (
                      bottomLeft: Radius.circular(21),
                      bottomRight: Radius.circular(21)
                    )
                  ) ,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  tabs: const  
                  [
                    Tab(text: 'LOGIN',),
                    Tab(text: 'SIGNUP',),
                   
                  ],
                ),
              ),
              const Expanded
              (
                  child: TabBarView
                  (
                    children:  
                    [
                      LoginScreen(),
                      SignUpScreen(), 
                    ],
                  )
              )
            ],
          ),
        )
      );
    
  
  }
}