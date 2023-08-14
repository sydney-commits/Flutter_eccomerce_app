import 'package:flutter/material.dart';
import 'package:myapp1/helpers/appColors.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
     
      backgroundColor: Colors.transparent,
      elevation: 0,
  
      title: Container(
        color: AppColors.Blue3,
      
        child: Padding(
          padding: const EdgeInsets.only(left:6.0, right: 5),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline2!.copyWith(
              color: Colors.white
            )
          ),
        ),
      ),
      centerTitle: true,
      // ignore: prefer_const_constructors
      iconTheme: IconThemeData(color: AppColors.Blue3),
      actions: [
        // IconButton(
        //     onPressed: () {
        //       Navigator.pushNamed(context, '/wishlist');
        //     },
        //     icon: const Icon(Icons.favorite)),


              IconButton(
                color: AppColors.Blue3,
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            icon: const Icon(Icons.home))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}
