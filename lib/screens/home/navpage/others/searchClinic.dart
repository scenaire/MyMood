import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class SearchClinic extends StatefulWidget {
  @override
  _SearchClinicState createState() => _SearchClinicState();
}

class _SearchClinicState extends State<SearchClinic> {

  List<Marker> allMarkers = [];
  IconThemeData iconThemeData = IconThemeData(color: Colors.black);
  
  Completer<GoogleMapController> _controller = Completer();

  LocationData currentLocation;

  Future<LocationData> getCurrentLocation() async {
    Location location = Location();

    try {
      return await location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {

      }
      return null;
    }
  }

  Future _goToMe() async {
    final GoogleMapController controller = await _controller.future;
    currentLocation = await getCurrentLocation();
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            currentLocation.latitude,
            currentLocation.longitude
          ),
          zoom: 16,
        )
      )
    );
  }

  @override
  void initState() {
    allMarkers.add(Marker(
            markerId: MarkerId('myMarker'),
            infoWindow: InfoWindow(title: 'โรงพยาบาลสินแพทย์'),
            draggable: true,
            position: LatLng(13.834207, 100.6639538)));
        allMarkers.add(Marker(
            markerId: MarkerId('myMarker1'),
            infoWindow: InfoWindow(title: 'โรงพยาบาลกลาง'),
            draggable: true,
            position: LatLng(13.7464973, 100.5070439)));
        allMarkers.add(Marker(
            markerId: MarkerId('myMarker2'),
            infoWindow: InfoWindow(title: 'คณะแพทยศาสตร์วชิรพยาบาล'),
            draggable: true,
            position: LatLng(13.780841, 100.5065103))); 
        allMarkers.add(Marker(
            markerId: MarkerId('myMarker3'),
            infoWindow: InfoWindow(title: 'โรงพยาบาลจุฬาลงกรณ์'),
            draggable: true,
            position: LatLng(13.7311953, 100.534507))); 
         allMarkers.add(Marker(
            markerId: MarkerId('myMarker4'),
            infoWindow: InfoWindow(title: 'โรงพยาบาลเจริญกรุงประชารักษ์'),
            draggable: true,
            position: LatLng(13.6944193, 100.492459))); 
       allMarkers.add(Marker(
            markerId: MarkerId('myMarker5'),
            infoWindow: InfoWindow(title: 'โรงพยาบาลตากสิน'),
            draggable: true,
            position: LatLng(13.7304755, 100.5064551))); 
       allMarkers.add(Marker(
            markerId: MarkerId('myMarker6'),
            infoWindow: InfoWindow(title: 'โรงพยาบาลตำรวจ'),
            draggable: true,
            position: LatLng(13.7433635, 100.5359725)));
        allMarkers.add(Marker(
            markerId: MarkerId('myMarker7'),
            infoWindow: InfoWindow(title: 'โรงพยาบาลทหารผ่านศึก'),
            draggable: true,
            position: LatLng(13.7719828, 100.5493858)));
        allMarkers.add(Marker(
            markerId: MarkerId('myMarker8'),
            infoWindow: InfoWindow(title: 'โรงพยาบาลนพรัตนราชธานี'),
            draggable: true,
            position: LatLng(13.8160199, 100.6851845)));
        allMarkers.add(Marker(
            markerId: MarkerId('myMarker9'),
            infoWindow: InfoWindow(title: 'โรงพยาบาลนครปฐม'),
            draggable: true,
            position: LatLng(13.8189876, 100.0729485)));
         allMarkers.add(Marker(
            markerId: MarkerId('myMarker10'),
            infoWindow: InfoWindow(title: 'โรงพยาบาลสมุทรสาคร'),
            draggable: true,
            position: LatLng(13.5518211, 100.2768692)));    
         allMarkers.add(Marker(
            markerId: MarkerId('myMarker11'),
            infoWindow: InfoWindow(title: 'โรงพยาบาลปทุมธานี'),
            draggable: true,
            position: LatLng(14.0204737, 100.5211546)));    
          allMarkers.add(Marker(
            markerId: MarkerId('myMarker12'),
            infoWindow: InfoWindow(title: 'โรงพยาบาลพระมงกุฎเกล้า'),
            draggable: true,
            position: LatLng(13.7676296, 100.5325235)));    
         allMarkers.add(Marker(
            markerId: MarkerId('myMarker13'),
            infoWindow: InfoWindow(title: 'โรงพยาบาลภูมิพลอดุยเดช'),
            draggable: true,
            position: LatLng(13.9014275, 100.6044005)));    
        allMarkers.add(Marker(
            markerId: MarkerId('myMarker14'),
            infoWindow: InfoWindow(title: 'โรงพยาบาลราชวิถี'),
            draggable: true,
            position: LatLng(13.7651461, 100.5340121)));    
        allMarkers.add(Marker(
            markerId: MarkerId('myMarker15'),
            infoWindow: InfoWindow(title: 'โรงพยาบาลรามาธิบดี '),
            draggable: true,
            position: LatLng(13.7668245, 100.5234602)));    
        allMarkers.add(Marker(
            markerId: MarkerId('myMarker16'),
            infoWindow: InfoWindow(title: 'โรงพยาบาลเลิดสิน'),
            draggable: true,
            position: LatLng(13.7141896, 100.5143423)));    
        allMarkers.add(Marker(
            markerId: MarkerId('myMarker17'),
            infoWindow: InfoWindow(title: 'โรงพยาบาลศิริราช'),
            draggable: true,
            position: LatLng(13.7599266, 100.483604)));    
        allMarkers.add(Marker(
            markerId: MarkerId('myMarker18'),
            infoWindow: InfoWindow(title: 'โรงพยาบาลศรีธัญญา'),
            draggable: true,
            position: LatLng(13.8452502, 100.5150211)));    
        allMarkers.add(Marker(
            markerId: MarkerId('myMarker19'),
            infoWindow: InfoWindow(title: 'โรงพยาบาลสมเด็จพระปิ่นเกล้า'),
            draggable: true,
            position: LatLng(13.7104386, 100.4849197)));    
        allMarkers.add(Marker(
            markerId: MarkerId('myMarker20'),
            infoWindow: InfoWindow(title: 'สถาบันประสาทวิทยา'),
            draggable: true,
            position: LatLng(13.7688369, 100.5234602)));    
       allMarkers.add(Marker(
            markerId: MarkerId('myMarker21'),
            infoWindow: InfoWindow(title: 'สถาบันเวชศาสตร์การบิน กองทัพอากาศ'),
            draggable: true,
            position: LatLng(13.9107161, 100.6158173)));    
       allMarkers.add(Marker(
            markerId: MarkerId('myMarker22'),
            infoWindow: InfoWindow(title: 'โรงพยาบาลสงฆ์'),
            draggable: true,
            position: LatLng(13.7617089, 100.5182584))); 
      allMarkers.add(Marker(
            markerId: MarkerId('myMarker22'),
            infoWindow: InfoWindow(title: 'คณะแพทยศาสตร์ มหาวิทยาลัยธรรมศาสตร์ รังสิต'),
            draggable: true,
            position: LatLng(14.072696, 100.6050392))); 
      allMarkers.add(Marker(
            markerId: MarkerId('myMarker23'),
            infoWindow: InfoWindow(title: 'ศูนย์บริการสาธารณสุข3 บางซื่อ'),
            draggable: true,
            position: LatLng(13.8023683, 100.5253387))); 
      allMarkers.add(Marker(
            markerId: MarkerId('myMarker24'),
            infoWindow: InfoWindow(title: 'ศูนย์บริการสาธารณสุข4 ดินแดง'),
            draggable: true,
            position: LatLng(13.7697228, 100.5493857))); 
       allMarkers.add(Marker(
            markerId: MarkerId('myMarker25'),
            infoWindow: InfoWindow(title: 'ศูนย์บริการสาธารณสุข21 วัดธาตุทอง'),
            draggable: true,
            position: LatLng(13.7200323, 100.576911))); 
       allMarkers.add(Marker(
            markerId: MarkerId('myMarker26'),
            infoWindow: InfoWindow(title: 'ศูนย์บริการสาธารณสุข23 สี่พระยา'),
            draggable: true,
            position: LatLng(13.7309479, 100.51157))); 
       allMarkers.add(Marker(
            markerId: MarkerId('myMarker27'),
            infoWindow: InfoWindow(title: 'ศูนย์บริการสาธารณสุข24 บางเขน'),
            draggable: true,
            position: LatLng(13.8497075, 100.5724317))); 
       allMarkers.add(Marker(
            markerId: MarkerId('myMarker28'),
            infoWindow: InfoWindow(title: 'ศูนย์บริการสาธารณสุข33 วัดหงส์รัตนาราม'),
            draggable: true,
            position: LatLng(13.7393968, 100.4800197))); 
       allMarkers.add(Marker(
            markerId: MarkerId('myMarker29'),
            infoWindow: InfoWindow(title: 'สถาบันกัลยาณ์ราชนครินทร์'),
            draggable: true,
            position: LatLng(13.7629592, 100.3221782))); 
      allMarkers.add(Marker(
            markerId: MarkerId('myMarker30'),
            infoWindow: InfoWindow(title: 'โรงพยาบาลมเหสักข์'),
            draggable: true,
            position: LatLng(13.7253047, 100.5106746))); 
      allMarkers.add(Marker(
            markerId: MarkerId('myMarker31'),
            infoWindow: InfoWindow(title: 'ศูนย์การแพทย์ปัญญานันทภิกขุ ชลประทาน มหาวิทยาลัยศรีนครินทรวิโรฒ'),
            draggable: true,
            position: LatLng(13.8995476, 100.4933453))); 
      allMarkers.add(Marker(
            markerId: MarkerId('myMarker32'),
            infoWindow: InfoWindow(title: 'โรงพยาบาลพร้อมมิตร'),
            draggable: true,
            position: LatLng(13.7160067, 100.4602696))); 
      allMarkers.add(Marker(
            markerId: MarkerId('myMarker33'),
            infoWindow: InfoWindow(title: 'โรงพยาบาลกรุงเทพ'),
            draggable: true,
            position: LatLng(13.7468282, 100.5818861))); 
      allMarkers.add(Marker(
            markerId: MarkerId('myMarker34'),
            infoWindow: InfoWindow(title: 'โรงพยาบาลกรุงเทพคริสเตียน'),
            draggable: true,
            position: LatLng(13.7278983, 100.5224586))); 
      allMarkers.add(Marker(
            markerId: MarkerId('myMarker35'),
            infoWindow: InfoWindow(title: 'โรงพยาบาลเซ็นต์หลุยส์'),
            draggable: true,
            position: LatLng(13.7193751, 100.5164673))); 
      allMarkers.add(Marker(
            markerId: MarkerId('myMarker36'),
            infoWindow: InfoWindow(title: 'โรงพยาบาลเซ็นทรัลเยนเนอรัล'),
            draggable: true,
            position: LatLng(13.8891264, 100.5978433)));                              
      allMarkers.add(Marker(
            markerId: MarkerId('myMarker37'),
            infoWindow: InfoWindow(title: 'โรงพยาบาลบางปะกอก9 อินเตอร์เนชั่นแนล'),
            draggable: true,
            position: LatLng(13.6820098, 100.4659209)));       
      allMarkers.add(Marker(
            markerId: MarkerId('myMarker38'),
            infoWindow: InfoWindow(title: 'โรงพยาบาลรามคำแหง'),
            draggable: true,
            position: LatLng(13.7613129, 100.627421))); 
      allMarkers.add(Marker(
            markerId: MarkerId('myMarker39'),
            infoWindow: InfoWindow(title: 'โรงพยาบาลวิชัยยุทธ'),
            draggable: true,
            position: LatLng(13.7818895, 100.5246754))); 
      allMarkers.add(Marker(
            markerId: MarkerId('myMarker40'),
            infoWindow: InfoWindow(title: 'โรงพยาบาลสายไหม'),
            draggable: true,
            position: LatLng(13.9346581, 100.5912296))); 
      allMarkers.add(Marker(
            markerId: MarkerId('myMarker41'),
            infoWindow: InfoWindow(title: 'โรงพยาบาลเวชธานี'),
            draggable: true,
            position: LatLng(13.7718943, 100.6282019))); 
      allMarkers.add(Marker(
            markerId: MarkerId('myMarker42'),
            infoWindow: InfoWindow(title: 'โรงพยาบาลเมโย'),
            draggable: true,
            position: LatLng(13.8353562, 100.5654865))); 
      allMarkers.add(Marker(
            markerId: MarkerId('myMarker43'),
            infoWindow: InfoWindow(title: 'โรงพยาบาลบางมด'),
            draggable: true,
            position: LatLng(13.6716939, 100.446989))); 
      allMarkers.add(Marker(
            markerId: MarkerId('myMarker44'),
            infoWindow: InfoWindow(title: 'โรงพยาบาลบีแคร์'),
            draggable: true,
            position: LatLng(13.9436439, 100.6158339))); 
      allMarkers.add(Marker(
            markerId: MarkerId('myMarker45'),
            infoWindow: InfoWindow(title: 'โรงพยาบาลบำรุงราษฎร์'),
            draggable: true,
            position: LatLng(13.7463158, 100.5435659))); 
  }

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: iconThemeData,
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: new Text('ค้นหาคลินิกสุขภาพจิตใกล้คุณ', style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 20, color: const Color.fromARGB(255, 40, 40, 40))),
            centerTitle: true,
          ),
          body: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: LatLng(13.7239708, 100.000000),
              zoom: 14
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: Set.from(allMarkers),
          ),

          floatingActionButton: FloatingActionButton(
        onPressed: _goToMe,
        child: Icon(
          Icons.near_me,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).accentColor,
      ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
          
        );
    }
}