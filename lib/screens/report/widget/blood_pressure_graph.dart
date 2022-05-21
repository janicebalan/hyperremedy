// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:permission_handler/permission_handler.dart';
//import 'package:screenshot/screenshot.dart';
import '../../report/widget/graph_day.dart';
import '../../report/widget/graph_overall.dart';
import '../../report/widget/graph_year.dart';
import '../../view.dart';
import '../report_viewmodel.dart';
import 'graph_month.dart';
import 'package:pdf/widgets.dart ' as pw;

class BloodPressureGraph extends StatelessWidget {
  BloodPressureGraph({data}) : _viewmodel = data;
  final ReportViewmodel _viewmodel;

  //final controller = ScreenshotController();
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  List<Color> gradientColors1 = [
    const Color(0x6d6027),
    const Color(0xD3CBB8),
  ];
  List<Color> gradientColors2 = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  Future<String> saveImage(Uint8List bytes) async {
    await [Permission.storage].request();
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final name = 'screenshot_$time';
    final result = await ImageGallerySaver.saveImage(bytes, name: name);
    return result['filepath'];
  }

  Future getPdf(Uint8List screenShot) async {
    pw.Document pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Expanded(
              child:
                  pw.Image(pw.MemoryImage(screenShot), fit: pw.BoxFit.contain));
        },
      ),
    );

    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final name = 'screenshot_$time';
    final dir = await getExternalStorageDirectory();
    File pdfFile = File('${dir.path}/$name');
    //print('${dir.path}/$name');
    pdfFile.writeAsBytesSync(List.from(await pdf.save()));
    OpenFile.open('${dir.path}/$name');

    //print("Saved");
  }

  GlobalKey imageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return View(
        viewmodel: _viewmodel,
        builder: (_context, _viewmodel, _child) {
          return Column(
            children: [
              FloatingActionButton.extended(
                tooltip: 'Export PDF',
                label: Text('Export PDF'),
                icon: Icon(Icons.add),
                heroTag: null,
                onPressed: () async {
                  //final image = await controller.capture();
                  RenderRepaintBoundary imageObject =
                      imageKey.currentContext.findRenderObject();
                  final image1 = await imageObject.toImage(pixelRatio: 2);

                  ByteData byteData =
                      await image1.toByteData(format: ImageByteFormat.png);
                  final image = await byteData.buffer.asUint8List();
                  if (image == null) {
                    print('image is null');
                    return;
                  }

                  //await saveImage(image);
                  await getPdf(image);
                  //final pdfFile = await PdfApi.generate()
                },
              ),
              Container(
                alignment: Alignment.topRight,
                child: DropdownButton(
                  value: _viewmodel.filterValue,
                  items: [
                    const DropdownMenuItem(
                      child: Text("Last 7 days"),
                      value: 1,
                    ),
                    const DropdownMenuItem(
                      child: Text("Last 30 days"),
                      value: 2,
                    ),
                    const DropdownMenuItem(
                      child: Text("Year"),
                      value: 3,
                    ),
                    const DropdownMenuItem(
                      child: Text("Overall"),
                      value: 4,
                    ),
                  ],
                  onChanged: (value) {
                    _viewmodel.filterValue = value;
                  },
                ),
              ),
              Container(
                child: _viewmodel.filterValue == 1
                    ? RepaintBoundary(
                        key: imageKey, child: GraphDay(data: _viewmodel))
                    : _viewmodel.filterValue == 2
                        ? RepaintBoundary(
                            key: imageKey, child: GraphMonth(data: _viewmodel))
                        : _viewmodel.filterValue == 3
                            ? RepaintBoundary(
                                key: imageKey,
                                child: GraphYear(data: _viewmodel))
                            : RepaintBoundary(
                                key: imageKey,
                                child: GraphOverall(data: _viewmodel)),
              ),
            ],
          );
        });
  }
}
