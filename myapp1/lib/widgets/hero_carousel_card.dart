import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp1/models/models.dart';
import 'package:transparent_image/transparent_image.dart';


class HeroCarouselCard extends StatefulWidget {
  final Category? category;
  final Product? product;

  const HeroCarouselCard({this.category, this.product});

  @override
  State<HeroCarouselCard> createState() => _HeroCarouselCardState();
}

class _HeroCarouselCardState extends State<HeroCarouselCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (this.widget.product == null) {
          Navigator.pushNamed(context, '/catalog', arguments: widget.category);
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[

                // if(category!.imageUrl != null)

                Image.network(
 widget.product == null ? widget.category!.imageUrl : widget.product!.imageUrl,
  // height: 300,
  width: 1000,
  fit: BoxFit.cover,
  frameBuilder: (_, image, loadingBuilder, __) {
    if (loadingBuilder == null) {
      return const SizedBox(
        height: 300,
        child: Center(child: CupertinoActivityIndicator()),
      );
    }
    return image;
  },
  loadingBuilder: (BuildContext context, Widget image, ImageChunkEvent? loadingProgress) {
    if (loadingProgress == null) return image;
    return SizedBox(
      width: 1000,
      child: Image.asset(
         "assets/icons/mylogo.jpg",fit:BoxFit.cover,)
      // Center(
      //   child: CupertinoActivityIndicator()
      //   // CircularProgressIndicator(
      //   //     value: loadingProgress.expectedTotalBytes != null
      //   //         ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
      //   //         : null,
      //   // ),
      // ),
    );
  },
  errorBuilder: (_, __, ___) => Image.asset(
    '"assets/icons/mylogo.jpg"',
    height: 300,
    fit: BoxFit.fitHeight,
  ),
),







              // Image.network(
              //       widget.product == null ? widget.category!.imageUrl : widget.product!.imageUrl,
              //       fit: BoxFit.cover,
              //       width: 1000.0),
                // else 
                // CircularProgressIndicator(),

                Positioned(
                  top: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(100, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Center(
                      child: Text(
                      
                        widget.product == null ? widget.category!.businessname : widget.product!.merchantCode,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),



                 Positioned(
                  bottom: 8.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      //    product == null ? category!.isService.toString() : '',
                      widget.product == null ? widget.category!.description : '',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),

              ],
            )),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:myapp1/models/models.dart';

// class HeroCarouselCard extends StatelessWidget {
//   final Category? category;
//   final Product? product;

//   const HeroCarouselCard({this.category, this.product});
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         if (this.product == null) {
//           Navigator.pushNamed(context, '/catalog', arguments: category);
//         }
//       },
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
//         child: ClipRRect(
//             borderRadius: BorderRadius.all(Radius.circular(5.0)),
//             child: Stack(
//               children: <Widget>[

//                 // if(category!.imageUrl != null)


//                 Image.network(
//                     product == null ? category!.imageUrl : product!.imageUrl,
//                     fit: BoxFit.cover,
//                     width: 1000.0),
//                 // else 
//                 // CircularProgressIndicator(),

//                 Positioned(
//                   top: 0.0,
//                   left: 0.0,
//                   right: 0.0,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [
//                           Color.fromARGB(100, 0, 0, 0),
//                           Color.fromARGB(0, 0, 0, 0)
//                         ],
//                         begin: Alignment.bottomCenter,
//                         end: Alignment.topCenter,
//                       ),
//                     ),
//                     padding:
//                         EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                     child: Center(
//                       child: Text(
                      
//                         product == null ? category!.businessname : product!.merchantCode,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20.0,
                          
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),



//                  Positioned(
//                   bottom: 8.0,
//                   left: 0.0,
//                   right: 0.0,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [
//                           Color.fromARGB(200, 0, 0, 0),
//                           Color.fromARGB(0, 0, 0, 0)
//                         ],
//                         begin: Alignment.bottomCenter,
//                         end: Alignment.topCenter,
//                       ),
//                     ),
//                     padding:
//                         EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                     child: Text(
//                       //    product == null ? category!.isService.toString() : '',
//                       product == null ? category!.description : '',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 15.0,
//                         fontWeight: FontWeight.normal,
//                       ),
//                     ),
//                   ),
//                 ),

//               ],
//             )),
//       ),
//     );
//   }
// }

