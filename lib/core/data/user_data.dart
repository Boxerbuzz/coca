/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'dart:math';

import '../models/user_model.dart';

List<UserModel> _userData() {
  final List<Map<String, dynamic>> rawUserData = [
    {
      "gender": "male",
      "firstName": "Oscar",
      "lastName": "Andersen",
      "email": "oscar.andersen@example.com",
      "username": "browndog398",
      "dob": "1981-02-18T20:53:47.767Z",
      "createdAt": "2010-07-02T06:04:54.995Z",
      "phone": "67240172",
      "id": "b0147e45-1853-4f1f-9b32-5a60ab3701b4",
      "image": "https://randomuser.me/api/portraits/men/1.jpg",
      "nat": "DK"
    },
    {
      "gender": "male",
      "firstName": "Romário",
      "lastName": "Nascimento",
      "email": "romario.nascimento@example.com",
      "id": "9a6824e7-7602-4dae-954b-8829f51e7191",
      "username": "organiccat477",
      "dob": "1955-06-14T22:11:50.665Z",
      "createdAt": "2010-02-25T01:44:01.485Z",
      "phone": "(94) 6445-5254",
      "image": "https://randomuser.me/api/portraits/men/5.jpg",
      "nat": "BR"
    },
    {
      "gender": "female",
      "firstName": "Judith",
      "lastName": "White",
      "id": "60e6a778-8497-471a-9958-859d28b779c7",
      "email": "judith.white@example.com",
      "username": "heavywolf442",
      "dob": "1945-12-07T20:27:12.328Z",
      "createdAt": "2021-06-16T02:34:13.216Z",
      "phone": "041-869-7523",
      "image": "https://randomuser.me/api/portraits/women/22.jpg",
      "nat": "IE"
    },
    {
      "gender": "male",
      "firstName": "Jeffrey",
      "lastName": "Young",
      "email": "jeffrey.young@example.com",
      "id": "7e7f652b-6bb8-4c87-9ae0-77f60f39ebec",
      "username": "organicgoose488",
      "dob": "1956-01-14T19:46:52.500Z",
      "createdAt": "2014-08-07T05:10:20.709Z",
      "phone": "02-8061-0743",
      "image": "https://randomuser.me/api/portraits/men/53.jpg",
      "nat": "AU"
    },
    {
      "gender": "male",
      "firstName": "Beau",
      "lastName": "Johnson",
      "email": "beau.johnson@example.com",
      "id": "5ae831c4-b72f-4f88-837f-06c82031b2de",
      "username": "sadfrog586",
      "dob": "1998-06-10T01:38:43.992Z",
      "createdAt": "2016-07-07T15:58:53.581Z",
      "phone": "(520)-598-5646",
      "image": "https://randomuser.me/api/portraits/men/52.jpg",
      "nat": "NZ"
    },
    {
      "gender": "female",
      "firstName": "Courtney",
      "lastName": "Burton",
      "email": "courtney.burton@example.com",
      "id": "f9563984-e0a2-41b7-99cf-9241279d037f",
      "username": "smallrabbit884",
      "dob": "1999-10-16T05:24:38.057Z",
      "createdAt": "2017-06-28T08:27:40.305Z",
      "phone": "01-4850-2593",
      "image": "https://randomuser.me/api/portraits/women/83.jpg",
      "nat": "AU"
    },
    {
      "gender": "male",
      "firstName": "Jayden",
      "lastName": "Snyder",
      "email": "jayden.snyder@example.com",
      "id": "1c42569a-435d-421f-b7ff-2b58fb88308f",
      "username": "whitelion238",
      "dob": "1951-03-04T18:28:37.770Z",
      "createdAt": "2006-11-13T09:50:46.932Z",
      "phone": "016977 8529",
      "image": "https://randomuser.me/api/portraits/men/27.jpg",
      "nat": "GB"
    },
    {
      "gender": "male",
      "firstName": "آراد",
      "lastName": "یاسمی",
      "email": "ard.ysmy@example.com",
      "id": "97af4595-3bda-4908-b150-5b9153ad22bd",
      "username": "angrymouse418",
      "dob": "1997-02-05T15:04:57.595Z",
      "createdAt": "2008-05-19T10:29:27.674Z",
      "phone": "053-20462829",
      "image": "https://randomuser.me/api/portraits/men/76.jpg",
      "nat": "IR"
    },
    {
      "gender": "female",
      "firstName": "Mestan",
      "lastName": "Akbulut",
      "email": "mestan.akbulut@example.com",
      "id": "ccdfcd37-d803-48f6-94b6-e6de730aebae",
      "username": "greenladybug352",
      "dob": "1951-10-21T20:31:25.140Z",
      "createdAt": "2006-06-21T03:39:41.722Z",
      "phone": "(532)-547-5876",
      "image": "https://randomuser.me/api/portraits/women/86.jpg",
      "nat": "TR"
    },
    {
      "gender": "male",
      "firstName": "Patrick",
      "lastName": "Howard",
      "email": "patrick.howard@example.com",
      "id": "747d8ac8-b2d6-4420-9a4a-e821348701bd",
      "dob": "1955-06-14T22:11:50.665Z",
      "createdAt": "2010-02-25T01:44:01.485Z",
      "username": "browntiger806",
      "phone": "021-751-6382",
      "image": "https://randomuser.me/api/portraits/men/23.jpg",
      "nat": "IE"
    },
    {
      "gender": "female",
      "firstName": "Anabel",
      "lastName": "Rivas",
      "email": "anabel.rivas@example.com",
      "id": "38e29af9-2a42-4bad-8818-303e47dee103",
      "username": "bluerabbit639",
      "dob": "1952-08-14T20:27:54.238Z",
      "createdAt": "2022-03-09T17:35:13.891Z",
      "phone": "(699) 635 9997",
      "image": "https://randomuser.me/api/portraits/women/42.jpg",
      "nat": "MX"
    },
    {
      "gender": "male",
      "firstName": "Fares",
      "lastName": "Poelman",
      "email": "fares.poelman@example.com",
      "id": "e0341404-7831-4eb0-b1c5-2105a1c8471d",
      "username": "lazyfrog178",
      "dob": "1944-11-05T13:51:19.515Z",
      "createdAt": "2013-06-07T03:55:52.033Z",
      "phone": "(0064) 631907",
      "image": "https://randomuser.me/api/portraits/men/88.jpg",
      "nat": "NL"
    },
    {
      "gender": "male",
      "firstName": "Maël",
      "lastName": "Renard",
      "email": "mael.renard@example.com",
      "id": "f3268ca9-2a84-4f4f-bc66-66a8a5bae89e",
      "username": "bluezebra988",
      "dob": "1960-03-05T09:51:13.834Z",
      "createdAt": "2011-12-30T17:15:34.791Z",
      "phone": "05-92-60-41-05",
      "image": "https://randomuser.me/api/portraits/men/54.jpg",
      "nat": "FR"
    },
    {
      "gender": "female",
      "firstName": "Milica",
      "lastName": "Erceg",
      "email": "milica.erceg@example.com",
      "id": "02a8dd94-4e9f-4b54-9413-669eba62dbdf",
      "username": "goldenlion449",
      "dob": "1950-09-30T17:03:28.885Z",
      "createdAt": "2020-03-19T15:48:50.028Z",
      "phone": "025-6294-248",
      "image": "https://randomuser.me/api/portraits/women/25.jpg",
      "nat": "RS"
    },
    {
      "gender": "female",
      "firstName": "Isla",
      "lastName": "Kilpela",
      "email": "isla.kilpela@example.com",
      "id": "b8e82bbf-2d27-49d9-9422-6e5dae5930f6",
      "username": "purpleleopard513",
      "dob": "1955-05-09T20:52:41.312Z",
      "createdAt": "2015-11-05T15:48:14.807Z",
      "phone": "08-819-591",
      "image": "https://randomuser.me/api/portraits/women/27.jpg",
      "nat": "FI"
    },
    {
      "gender": "male",
      "firstName": "Johannes",
      "lastName": "Lopez",
      "email": "johannes.lopez@example.com",
      "id": "c9116582-e6d7-40a5-a4c8-4307a4d3fbf0",
      "username": "yellowladybug112",
      "dob": "1995-12-13T06:32:15.761Z",
      "createdAt": "2007-10-26T17:54:43.950Z",
      "phone": "078 324 96 78",
      "image": "https://randomuser.me/api/portraits/men/37.jpg",
      "nat": "CH"
    },
    {
      "gender": "female",
      "firstName": "Krisha",
      "lastName": "Kumar",
      "email": "krisha.kumar@example.com",
      "id": "75deee91-8d1f-41ee-8a11-1f5c757423e8",
      "username": "purpleleopard646",
      "dob": "1991-08-09T22:13:56.210Z",
      "createdAt": "2009-10-26T08:24:13.552Z",
      "phone": "8886372746",
      "image": "https://randomuser.me/api/portraits/women/5.jpg",
      "nat": "IN"
    },
    {
      "gender": "male",
      "firstName": "Nathaniel",
      "lastName": "Smith",
      "email": "nathaniel.smith@example.com",
      "id": "97c8cca1-a75b-4ee7-8674-c69b9472e7bc",
      "username": "purpletiger945",
      "dob": "1973-08-29T06:29:05.961Z",
      "createdAt": "2008-01-29T12:48:43.613Z",
      "phone": "(844)-268-9162",
      "image": "https://randomuser.me/api/portraits/men/57.jpg",
      "nat": "NZ"
    },
    {
      "gender": "female",
      "firstName": "Janet",
      "lastName": "Harper",
      "email": "janet.harper@example.com",
      "id": "3593ecd9-32c8-4295-a488-a52c52664d71",
      "username": "silverswan137",
      "dob": "1952-05-31T23:31:44.437Z",
      "createdAt": "2013-02-09T06:07:48.930Z",
      "phone": "017683 13741",
      "image": "https://randomuser.me/api/portraits/women/93.jpg",
      "nat": "GB"
    },
    {
      "gender": "male",
      "firstName": "German",
      "lastName": "Lorenzo",
      "email": "german.lorenzo@example.com",
      "id": "1c414fa1-bbb0-4d95-8822-c92f6fea58ef",
      "username": "organicgorilla180",
      "dob": "1950-12-31T06:09:55.873Z",
      "createdAt": "2015-04-20T19:54:59.948Z",
      "phone": "905-604-141",
      "image": "https://randomuser.me/api/portraits/men/99.jpg",
      "nat": "ES"
    }
  ];

  return rawUserData.map((e) => UserModel.fromJson(e)).toList();
}

final List<UserModel> users = _userData();

List<UserModel> participants() {
  Random random = Random();

  List<UserModel> temp = users;

  temp.shuffle(random);

  return temp.take(5).toList();
}

UserModel userData = UserModel.fromJson(const {
  "gender": "male",
  "firstName": "Oscar",
  "lastName": "Andersen",
  "email": "oscar.andersen@example.com",
  "username": "browndog398",
  "dob": "1981-02-18T20:53:47.767Z",
  "createdAt": "2010-07-02T06:04:54.995Z",
  "phone": "67240172",
  "id": "b0147e45-1853-4f1f-9b32-5a60ab3701b4",
  "image": "https://randomuser.me/api/portraits/men/1.jpg",
  "nat": "DK"
});
