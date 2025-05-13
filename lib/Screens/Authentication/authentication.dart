import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AuthenticationScreen extends StatefulWidget {
   AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
  
  
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
bool isSelected=true;
bool isvisible = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth / 3;
    double tabWidth = containerWidth / 2;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context,Constraints) {
          double screenWidth = Constraints.maxWidth;

          return Row(
            children: [
             
                Container(
                  width: screenWidth/2,
                  color:  Color(0xff0E3750),
                  child: Center(
                    child: Image.asset(
                      'assets/images/login_art.png',
                      width: 400,
                    ),
                  ),
                ),
              Expanded(
                flex: 1,
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset("assets/icons/logo.png")
                        //const Icon(, size: 48, color: Colors.blueGrey),
                        , SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Welcome To',textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400,),
                            ),
                            Text(
                              ' Slotit Co',textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 24, color: Color(0xff0E3750),fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        const Text('Crowd is waiting for you....', style: TextStyle(fontSize: 14, color: Colors.grey)),
                        
                        const SizedBox(height: 20),
                        
                        Container(
                          width: containerWidth,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Color(0xff869BAF),), 
                          child: Row(
                            children: [
                              SizedBox(width: 5,),
                              GestureDetector(
                                onTap: () {
                                  if(!isSelected){
                                    setState(() => isSelected=true);
                                  
                                  }
                                },
                                child: Container(
                                  
                                   alignment: Alignment.center,
                                  width: tabWidth,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                  color:isSelected? Color(0xff0E3750):Color(0xff869BAF)),
                                  child:  Text('Sign in',  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700,color: Colors.white),
                                  ),
                                 
                                 
                                ),
                              ),
                              
                               GestureDetector(
                                onTap: () {
                             if (isSelected) {
                              setState(() => isSelected = false);
               
                                    }},
                                 child: Container(
                                  alignment: Alignment.center,
                                  width: screenWidth/7,
                                  height: 30,
                                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),
                                 color: isSelected?Color(0xff869BAF): Color(0xff0E3750)),
                                  
                                   child: Text('Sign up',  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700,color: Colors.white),
                                    ),
                                 ),
                               ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Divider(),
                            const SizedBox(height: 15),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text('Enter your registered email id', 
                                                             style: TextStyle(
                                
                                                            fontSize: 14, 
                                                            fontWeight: FontWeight.w500,
                                                            color: Colors.grey),
                                                        ),
                              ),
                              SizedBox(height: 5),
                        SizedBox(
                          height: 40,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'test@example.com',
                              hintStyle: TextStyle(
                                
                              fontSize: 12, 
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                              
                              border: OutlineInputBorder(borderRadius: 
                              BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Enter the password', 
                               style: TextStyle(
                                
                              fontSize: 14, 
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                                                    ),
                          ),
                            SizedBox(height: 5),
                        SizedBox(
                          height: 40,
                          child: TextFormField(
                            obscureText: isvisible,
                            decoration: InputDecoration(
                              hintText: 'Enter your password',
                              hintStyle: TextStyle( fontSize: 12, 
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                              suffixIcon: IconButton(
                                  icon: Icon(
                                   isvisible
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isvisible = !isvisible;
                                    });
                                  },
                                ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        
                        
                        Row(
                          children: [
                            Expanded(child: Container()),
                            Text('Having Issues?', 
                             style: TextStyle(
                              
                            fontSize: 12, 
                            fontWeight: FontWeight.w300,
                            color: Colors.grey),
                        ),
                            TextButton(
                              onPressed: () {},
                              child:Text('Reset Password', style: TextStyle(color: Color(0xFF12344D))),
                            ),
                          ],
                        ),
                        
                        const SizedBox(height: 20),
                        
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              backgroundColor: const Color(0xFF12344D),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                            ),
                            onPressed: () {},
                            child: const Text('Sign In',  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: Colors.white),
                          ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        }
      ),
    );
  }
  
}

