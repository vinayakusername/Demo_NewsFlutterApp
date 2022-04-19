import 'package:flutter/material.dart';
import 'package:flutter_news_app/demo_news_app/screens/login_screen.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpScreen extends StatefulWidget 
{
  const SignUpScreen({ Key? key }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> 
{

  bool initialCheckBoxResponse = false;
  
  void _setCheckBoxResponse(bool value)
  {
     setState(() 
     {
         this.initialCheckBoxResponse = value;  
     });
  }

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
            child: _buildSignUpForm(context)
          ),
          ElevatedButton
          (
            onPressed:()
            {
              //add signUp code.

              // Navigator.of(context).push
              // (
              //   MaterialPageRoute
              //   (
              //     builder: (context)=> LoginScreen()
              //   ),
              // );
            }, 
            child:Text('REGISTER'),
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

  Widget _buildSignUpForm(BuildContext context)
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
                    'Create an Account',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  )),
              
              Container
              (
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  //controller: nameController,
                  decoration: const InputDecoration
                  (
                    border: UnderlineInputBorder(),
                    suffixIcon: Icon(Icons.person),
                    labelText: 'Name',
                    hintText: 'John Doe'
                  ),
                ),
              ),
               Container
               (
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
                padding: const EdgeInsets.all(10),
                child: IntlPhoneField
                        (
                          decoration: InputDecoration
                                     (
                                      labelText: 'Phone Number',
                                      hintText: '9876543210',
                                      border: UnderlineInputBorder(),
                                      suffixIcon: Icon(Icons.phone)
                                     ),
                           initialCountryCode: 'IN',
                           onChanged: (phone) 
                           {
                                   print(phone.completeNumber);
                           },
                           onCountryChanged: (country) 
                           {
                             print('Country changed to: ' + country.name);
                           },
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
                    hintText: '********'
                  ),
                ),
              ),
   
             SizedBox(height: 15,), 
              
              Row
              (
                mainAxisAlignment: MainAxisAlignment.center,
                children: 
                [
                   
                   Checkbox
                   (  
                      checkColor: Colors.white,  
                      activeColor: Colors.red,  
                      value: this.initialCheckBoxResponse,  
                      onChanged: (value) => _setCheckBoxResponse(value!)
                      
                    ),  

                   Text
                   (
                     'I agree with',
                      style: TextStyle
                            (
                             color: Colors.black
                            ),
                     textAlign: TextAlign.center,
                   ),
                  TextButton
                  (
                      onPressed: () 
                      {
                       //terms and conditions screen
                      },
                      child: const Text
                           (
                             'terms & conditions',
                             style: TextStyle
                             (
                               fontWeight: FontWeight.bold,
                               color: Colors.red
                             ),
                           ),
                  ),

                ],
              ),
              
              SizedBox(height: 10,),
              
              Row
              (
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>
                [
                  const Text("Already have an account?"),
                  TextButton
                  (
                    child: const Text
                    (
                      'Sign In!',
                      style: TextStyle
                            (
                              fontWeight: FontWeight.bold,
                              fontSize: 13
                            ),
                    ),
                    onPressed: () 
                    {
                      
                      // Navigator.of(context).push
                      //                      (
                      //                        MaterialPageRoute
                      //                        (
                      //                          builder:(context)=> LoginScreen()
                      //                        )
                      //                      );
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

