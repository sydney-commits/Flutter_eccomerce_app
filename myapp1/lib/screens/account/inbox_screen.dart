
import 'package:flutter/material.dart';



class Inbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'inbox',
      home: ListTileWidget(),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
        title: 
            Text(
              'Inbox',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.6,
                  fontSize: 16),
            ),
   
        
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height:10),
          Container(child: Text("20 January",style: TextStyle(fontSize: 16),),),
          SizedBox(height:10),
 
      
 
          Card(
            child: ListTile(
              
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Confirmed'),
              ),
            
              subtitle: Text("Your Order 12322 has been confirmed and is expected to be delivered soon"),
              
      
            ),
          ),
          SizedBox(height: 8),

          
         
   
          Card(
            child: ListTile(
 leading:  Image.network("https://media.istockphoto.com/photos/staying-connected-picture-id1277665587?k=20&m=1277665587&s=612x612&w=0&h=qkXiTryPR7gU0EcM8DyBXyNZhV7Em2kg0uR_Oo7Htd4=",width:80,height: 80,),
            
              title: Text('20 KG Ground Floor'),
              
            ),
          ),


        ],
      ),
    );
  }
}

