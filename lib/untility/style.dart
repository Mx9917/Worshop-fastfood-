import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class style {
  Color darkColor = Colors.orange;
  Color pimaryColor = Colors.green.shade900;

  BoxDecoration boxDecorations(String Path_Img) {
    return BoxDecoration(
      image: DecorationImage(
          image: AssetImage('images/$Path_Img'), fit: BoxFit.cover),
    );
  }

  SizedBox widthboxs() => const SizedBox(
        width: 10.0,
      );
  SizedBox heightboxs() => const SizedBox(
        height: 10.0,
      );

  Text lable(String lables) => Text(
        lables,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange),
      );

  Widget titlecenter(BuildContext context, String string) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Text(
          string,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Text title(String title) => Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          color: Colors.orange,
          fontWeight: FontWeight.bold,
        ),
      );
  SizedBox logo() {
    return SizedBox(
      width: 180,
      child: Image.asset('images/fastfoodlogo.png'),
    );
  }

  Container showMap() {
    LatLng latLng = const LatLng(17.963863, 102.610569);
    CameraPosition cameraPosition = CameraPosition(target: latLng, zoom: 16.0);

    return Container(
      // margin: const EdgeInsets.only(left: 25, right: 25),
      height: 210.0,
      child: GoogleMap(
        initialCameraPosition: cameraPosition,
        mapType: MapType.normal,
        onMapCreated: (controller) {},
      ),
    );
  }

  style();
}
