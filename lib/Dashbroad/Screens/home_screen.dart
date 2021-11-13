import 'package:flutter/material.dart';
import 'package:flutter_projects/Dashbroad/Model/ProjectModel.dart';
import 'package:flutter_projects/Dashbroad/Widgets/TextTK.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        centerTitle: true,
        title: TextTK(
          text: "TUANKIEU PROJECTS",
          color: Color(0xff002C8B),
          fontWeight: FontWeight.w700,
          size: 21,
        ),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
              itemCount: ProjectModel.listProject.length,
              itemBuilder: (context, index) {
                return _ProjectCard(
                    projectModel: ProjectModel.listProject[index]);
              })
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final ProjectModel projectModel;

  const _ProjectCard({required this.projectModel});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
      child: InkWell(
          onTap: () => Navigator.pushNamed(context, projectModel.route),
          child: Container(
            height: 80,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: projectModel.color,
            ),
            child: Row(
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      projectModel.pathImage,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    )),
                SizedBox(width: 15.0),
                TextTK(
                  text: projectModel.title,
                  size: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xffEDF1F5).withOpacity(0.8),
                  size: 22,
                )
              ],
            ),
          )),
    );
  }
}
