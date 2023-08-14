import 'package:flutter/material.dart';

class ProfilePageInfo extends StatefulWidget {
  @override
  _ProfilePageInfoState createState() => _ProfilePageInfoState();
}

class _ProfilePageInfoState extends State<ProfilePageInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Client Info'),
          backgroundColor: Colors.blue,
        ),
        body: ListView(padding: EdgeInsets.zero, children: [
          BuildTop(),
          buildContent(),
        ]));
  }
}

class BuildTop extends StatefulWidget {
  const BuildTop({
    Key? key,
  }) : super(key: key);

  @override
  State<BuildTop> createState() => _BuildTopState();
}

class _BuildTopState extends State<BuildTop> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: 36), child: buildCoverImage()),
        Positioned(
          top: 200,
          child: buildProfileImage(),
        )
      ],
    );
  }
}

Widget buildCoverImage() => Container(
      color: Colors.grey,
      child: Image.network("https://media.istockphoto.com/photos/staying-connected-picture-id1277665587?k=20&m=1277665587&s=612x612&w=0&h=qkXiTryPR7gU0EcM8DyBXyNZhV7Em2kg0uR_Oo7Htd4=",
          width: double.infinity, height: 280.0, fit: BoxFit.cover),
    );

Widget buildProfileImage() => CircleAvatar(
      radius: 72,
      backgroundColor: Colors.grey.shade800,
      backgroundImage: AssetImage('/')
    );

Widget buildContent() => Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Text(
          "Sydney M",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        Text(
          "Lead Manager",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 18,
        ),
        Divider(),
        NumbersWidget(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
               const SizedBox(
          height: 18,
        ),
        Text(
          'About',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding:  EdgeInsets.only( left : 8.0,  right:8.0),
          child: Text(
            'sydney is syedhsd because of the fact that  sydney is syedhsd because of the fact thatsydney is syedhsd because of the fact that ',
            style: TextStyle(fontSize: 18, height: 1.5),
          ),
        )
      ],
    );

class NumbersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildButton(text: 'Products', value: 2),
        buildButton(text: 'Riders', value: 2),
        buildButton(text: 'Customers', value: 2),
      ],
    );
  }
}

Widget buildButton({
  required String text,
  required int value,
}) =>
    MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 5),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '$value',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 16),
              )
            ]));
