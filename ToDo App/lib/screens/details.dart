import 'package:flutter/material.dart';
import 'package:todo/constants/colors.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void showResultPopup() {
      showDialog(
        barrierColor: Colors.black12,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 10,
            surfaceTintColor: Colors.transparent,
            actions: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  minimumSize: WidgetStateProperty.all<Size>(Size(320, 50)),
                  backgroundColor:
                      WidgetStateProperty.all<Color>(AppColors.white),
                  foregroundColor:
                      WidgetStateProperty.all<Color>(Colors.redAccent),
                ),
                child: Text('Delete TODO',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  minimumSize: WidgetStateProperty.all<Size>(Size(320, 50)),
                  backgroundColor:
                      WidgetStateProperty.all<Color>(AppColors.white),
                  foregroundColor:
                      WidgetStateProperty.all<Color>(Colors.greenAccent),
                ),
                child: Text('Cancel',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          );
        },
      );
    }


     void showColorPickerPopup() {
      showDialog(
        barrierColor: Colors.black12,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 10,
            surfaceTintColor: Colors.transparent,
            actions: <Widget>[
             //ColorPicker()
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
              onPressed: () => null,
              icon: Icon(
                Icons.color_lens,
                size: 30,
              )),
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  barrierColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => Container(
                    width: double.infinity,
                    height: 780,
                    decoration: BoxDecoration(
                      color: AppColors.color1,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                width: 200,
                                height: 7,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Title",
                                  hintStyle: TextStyle(
                                    color: AppColors.white,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                        color: AppColors.white, width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.white, width: 2),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 400,
                                child: TextFormField(
                                  maxLines: 1000,
                                  decoration: InputDecoration(
                                    hintText: "Description...",
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.white,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: AppColors.white, width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.white,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15),
                              Container(
                                // color: Colors.white,
                                width: 400,
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.white,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Add Image (Optional)",
                                        style:
                                            TextStyle(color: AppColors.white),
                                      ),
                                      Spacer(),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.image_rounded,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  shape: WidgetStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                                  minimumSize: WidgetStateProperty.all<Size>(
                                      Size(400, 70)),
                                  backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                          AppColors.white),
                                  foregroundColor:
                                      WidgetStateProperty.all<Color>(
                                          AppColors.color1),
                                ),
                                onPressed: () => null,
                                child: Text(
                                  "Edit TODO",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              icon: Icon(
                Icons.mode_edit_outlined,
                size: 30,
              )),
          IconButton(
            onPressed: () => showResultPopup(),
            icon: Icon(
              Icons.delete_outline_outlined,
              size: 30,
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Task1",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "description",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
