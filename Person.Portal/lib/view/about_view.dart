import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:person_portal/controller/menu_controller.dart';
import 'package:person_portal/widget/menu_widget.dart';

class AboutPage extends GetView<MenuController>{
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('About Us'),
      leading: MenuWidget(),

    ),
    body:  SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text('Our Story', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            Image.asset(
              'assets/images/about-4-768x512.jpg',
              width: 300,
              height: 300,
            ),
            RichText(
              text: TextSpan(
                text: 'Prechart Software Inc. was incorporated on January 25, 2005. The main shareholders are also the operating partners. Both partners have extensive knowledge of business processes and software development, deployment, maintenance and support.',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            SizedBox(height: 50),
            Text('Our Mission', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            Image.asset(
              'assets/images/about-2-768x512.jpg',
              width: 300,
              height: 300,
            ),
            RichText(
              text: TextSpan(
                text: 'At Prechart Software we believe that there are a number of small to medium sized clients who have trouble engaging with larger software suppliers to provide them with customized solutions. We are willing to engage on a very small scale and prove to our clients our worth.',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            SizedBox(height: 50),
            Text('Overview', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            Image.asset(
              'assets/images/about-3-768x512.jpg',
              width: 300,
              height: 300,
            ),
            RichText(
              text: TextSpan(
                text: 'Prechart Software Inc. specializes in writing web based applications. We develop software in cooperation with our clients. We do this in a SCRUM like manner. The client specifies an initial problem and Prechart Software provides a first cut solution outline.',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            SizedBox(height: 50),
            Text('Contact us', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Address: ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                Text('Philexcel Business Center 2, Suite 15', style: TextStyle(fontSize: 14)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Philexcel Business Park', style: TextStyle(fontSize: 14)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Clark Freeport Zone, Pampanga, 2023', style: TextStyle(fontSize: 14)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('The Philippines', style: TextStyle(fontSize: 14)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Philippines Telephone: ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                Text('+63 45 499 7017 ', style: TextStyle(fontSize: 14)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Netherlands Telephone: ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                Text('+31 50 720 0221', style: TextStyle(fontSize: 14)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Email: ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                Text('info@prechart.com', style: TextStyle(fontSize: 14)),
              ],
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    ),
  );
}