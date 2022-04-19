
import 'package:flutter/material.dart';
import 'package:flutter_news_app/demo_news_app/screens/home_screen.dart';
import 'package:flutter_news_app/demo_news_app/screens/sign_up_screen.dart';



class LoginScreen extends StatefulWidget 
{
  const LoginScreen({ Key? key }) : super(key: key);
  
  

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> 
{
  
  @override
  Widget build(BuildContext context) 
  {
  
    return Scaffold
    (
      //backgroundColor: Colors.grey,
      backgroundColor: Color.fromRGBO(216,216,216,100),
     
      body: Column
      (
        children: 
        [
          Expanded
          (
            child: _buildLoginForm(context)
          ),
          ElevatedButton
          (
            onPressed:()
            {
              Navigator.of(context).pushReplacement
              (
                MaterialPageRoute
                (
                  builder: (context)=> HomePage()
                ),
              );
            }, 
            child:Text('LOGIN'),
            style: ElevatedButton.styleFrom
            (
              primary: Colors.red,
              /*
               The minimumSize: const Size.fromHeight(50) creates a button with a height of 50 and width set to infinite.
               */
              minimumSize: const Size.fromHeight(55),
              shape: RoundedRectangleBorder
              (
                  borderRadius: const BorderRadius.only
                  (
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)
                  )
              )
            ),
          )
        ],
      )
    );
  }

  Widget _buildLoginForm(BuildContext context)
  {
    return Padding
    (
      padding: const EdgeInsets.all(10.0),
      child: Card
      (
        shape: RoundedRectangleBorder
        (
          borderRadius: BorderRadius.circular(16)
        ),
        child: SizedBox
        (
          height: 300,
          child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView
          (
            children: <Widget>
            [
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'SignIn Into your Account',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  )),
              
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  //controller: nameController,
                  decoration: const InputDecoration
                  (
                    border: UnderlineInputBorder(),
                    suffixIcon: Icon(Icons.email),
                    labelText: 'Email',
                    hintText: 'johndoe@gmail.com'
                  ),
                ),
              ),
              Container
              (
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextFormField
                (
                  obscureText: true,
                  //controller: passwordController,
                  decoration: const InputDecoration
                  (
                    border: UnderlineInputBorder(),
                    suffixIcon: Icon(Icons.lock_outline),
                    labelText: 'Password',
                    hintText: 'password'
                  ),
                ),
              ),
              
              SizedBox(height: 5.0,),
              
              TextButton
              (
                onPressed: () 
                {
                  //forgot password screen
                },
                child: const Text
                           (
                             'Forgot Password ?',
                             style: TextStyle
                             (
                               fontWeight: FontWeight.bold
                             ),
                           ),
                style: TextButton.styleFrom
                (
                  alignment: Alignment.centerRight
                ),
              ),
              
              SizedBox(height: 25,),
              
              Text
              (
                'Login with',
                style: TextStyle
                       (
                         color: Colors.black
                       ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 15,), 
              
              Row
              (
                mainAxisAlignment: MainAxisAlignment.center,
                children: 
                [
                  GestureDetector
                  (
                    onTap: ()
                    {
                      print('google signIn');
                    },
                    child: Image.asset
                          (
                            'assets/images/google-logo.png'
                          ),
                  ),
                  SizedBox(width: 30,),
                  GestureDetector
                  (
                    onTap: ()
                    {
                      print('facebook signIn');
                    },
                    child: Image.asset('assets/images/facebook-logo.png',color: Colors.blue,),
                  ),
                ],
              ),
              
              SizedBox(height: 10,),
              
              Row
              (
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>
                [
                  const Text("Don't have an account?"),
                  TextButton
                  (
                    child: const Text
                    (
                      'Register Now',
                      style: TextStyle
                            (
                              fontWeight: FontWeight.bold,
                              fontSize: 12
                            ),
                    ),
                    onPressed: () 
                    {
                      //signup screen
                      Navigator.of(context).push
                                           (
                                             MaterialPageRoute
                                             (
                                               builder:(context)=> SignUpScreen()
                                             )
                                           );
                    },
                  )
                ],
                
              ),
            ],
          )
          ),

        ),
      ),
    );
  }
}