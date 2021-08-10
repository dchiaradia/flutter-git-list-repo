//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import '../../../Data/GitRepositorio.dart';
import '../../../Models/git.dart';

import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../RepoDetail/repoDetailUI.dart';

class DashboardController extends GetxController {
  late List<GitRepositorio> lstRepositorios = List<GitRepositorio>.empty();

  late Widget widgetListViewRepositorios = loadding(48, 48);

  @override
  void onInit() {
    print('onInit');
    super.onInit();
  }

  @override
  void onReady() {
    print('onReady');
    getAllUserRepos('dchiaradia');
    super.onReady();
  }

  @override
  void onClose() {
    print('onClose');
    super.onClose();
  }

  Future<void> getAllUserRepos(String username) async {
    print('Iniciando busca dos repositorios');
    Git git = Git();
    lstRepositorios = await git.getRepository(username);

    if (lstRepositorios.length == 0) {
      widgetListViewRepositorios = Text('Repositorio não encontrado!');
      update();
      return;
    }

    Widget makeAvatar(owner) {
      return Column(
        children: [
          SizedBox(
            height: 24,
          ),
          Container(
            width: 128,
            height: 128,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 6, color: Colors.deepPurple),
              image: DecorationImage(
                image: CachedNetworkImageProvider(owner!.avatar_url.toString()),
              ),
            ),
          ),
          Text(
            owner.login,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    }

    widgetListViewRepositorios = Column(
      children: [
        makeAvatar(lstRepositorios[0].owner),
        SizedBox(
          height: 30,
        ),
        Expanded(
            child: ListView.builder(
                padding: EdgeInsets.all(4.0),
                itemCount: lstRepositorios.length,
                itemBuilder: (context, index) {
                  return listViewProductsItem(lstRepositorios[index], context);
                }))
      ],
    );

    update();
  }

  Widget loadding(double height, double width) {
    return Container(
      child: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.green[100],
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
                ),
                height: height,
                width: width,
              )
            ]),
      ),
    );
  }

  Widget listViewProductsItem(model, BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(bottom: 0),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
              child: Column(
                children: <Widget>[
                  Container(
                    width: Get.size.width * 1,
                    child: Text(
                      model.name.toString().capitalize!,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    width: Get.size.width * 1,
                    child: Text(
                      model.description.toString().capitalize!,
                      maxLines: 2,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                  ),
                  const Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        showCupertinoModalBottomSheet(
          expand: true,
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) => RepoDetailSheet(UniqueKey(), model),
        );
        update();
      },
    );
  }

  myHeader(bool innerBoxIsScrolled) {
    return <Widget>[
      SliverAppBar(
        floating: true,
        expandedHeight: 130,
        forceElevated: innerBoxIsScrolled,
        pinned: true,
        titleSpacing: 20,
        backgroundColor: Colors.deepPurple,
        actionsIconTheme: IconThemeData(opacity: 0.0),
        /*
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: white),
            onPressed: () {
              finish(context);
            }),
        */
        title: Text('Lista Repositorios'),
        flexibleSpace: myDashboardFlexibleSpaceBar(),
      ),
    ];
  }

  FlexibleSpaceBar myDashboardFlexibleSpaceBar() {
    return FlexibleSpaceBar(
      background: Container(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: <Color>[Colors.purple, Colors.deepPurple])),
            ),
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 90),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Localizar Repo',
                            contentPadding: EdgeInsets.only(
                                left: 26.0, bottom: 0.0, top: 0.0, right: 50.0),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 0.5),
                                borderRadius: BorderRadius.circular(26)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 0.5),
                                borderRadius: BorderRadius.circular(26)),
                          ),
                          onSubmitted: (String value) async {
                            print(value);
                            await getAllUserRepos(value);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget myBody() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: GetBuilder<DashboardController>(
              builder: (r) => this.widgetListViewRepositorios,
            ),
          ),
        ],
      ),
    );
  }
}
