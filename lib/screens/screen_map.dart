import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:seoul/widget/bottombar/bottom_bar.dart';
import 'package:seoul/widget/serchbar/serch_bar.dart';

import '../widget/appbar/main_app_bar.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<MapScreen> {
  late GoogleMapController mapController;
  Completer<GoogleMapController> _controller = Completer();
  final LatLng _center = const LatLng(37.3216, 127.1268);

  Map<MarkerId, Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _controller.complete(controller);
  }


  Future<void> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('위치 서비스 권한이 거부되었습니다.');
        return; // 권한이 없으므로 여기서 리턴
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print('위치 서비스 권한이 영구적으로 거부되었습니다.');
      // 사용자가 위치 서비스 권한을 영구적으로 거부한 경우 처리 로직
      return;
    }

    if (!await Geolocator.isLocationServiceEnabled()) {
      print('위치 서비스가 비활성화 되었습니다.');
      return; // 위치 서비스가 비활성화되었으므로 여기서 리턴
    }

    try {
      final GoogleMapController controller = await _controller.future;
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print('현재 위치: ${position.latitude}, ${position.longitude}');
      // 현재 위치에 마커 추가
      final MarkerId markerId = MarkerId("current_location");
      final Marker marker = Marker(
        markerId: markerId,
        position: LatLng(position.latitude, position.longitude),
        infoWindow: InfoWindow(title: "현재 위치"),
      );
      setState(() {
        _markers[markerId] = marker; // _markers는 Map<MarkerId, Marker> 타입의 상태 변수입니다.
      });

      controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 0,
          target: LatLng(position.latitude, position.longitude),
          zoom: 18.0,
        ),
      ));
    } catch (e) {
      print('현재 위치를 가져오는데 실패했습니다: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize( // AppBar 클래스는 명시적으로 너비와 높이를 설정할 수 있는 PreferredSize 위젯을 상속 받는다.
        preferredSize: Size.fromHeight(60), // 앱바 높이 조절
        child: MainAppBar(), // 앱바 적용
      ),
      body:
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children : <Widget>[
              SizedBox(
                width: double.infinity,
                height: 735,
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 18.0,
                  ),
                  markers: Set<Marker>.of(_markers.values),
                  zoomControlsEnabled: true,
                ),
              ),
              Positioned(
                top: 18,
                left: 18,
                right: 18,
                child: MapSearchBar()
              ),
              Positioned(
                left: 20,
                bottom: 20,
                child: GestureDetector(
                  onTap: (){
                    getCurrentLocation();
                    },
                  child: Container(
                    child: Icon(
                      Icons.my_location,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10, left: 18, right:18,
                  child: BottomBar(),
              ),
            ],
          ),
        ),
    );
  }
}