/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import 'dart:math';

import 'package:appflowy_board/appflowy_board.dart';

import '../models/project_model.dart';
import '../models/task_model.dart';
import 'user_data.dart';

List<Map<String, dynamic>> _data = [
  {
    "name": "Integer convallis turpis vitae condimentum tincidunt",
    "description": "Sed condimentum sapien eu bibendum porta",
    "image": "n.f.brown@hotmail.com",
    "url": "www.RecruitingCorp.io",
    "access": "Relations Manager",
    "progress": 0.4074443219992372,
    "uid": "dcaf4ed9-9d7e-457d-9dfd-7d68722a25ea"
  },
  {
    "name": "Cras suscipit erat sapien, id elementum erat porta eget",
    "description": "Nulla congue bibendum velit dictum pulvinar",
    "image": "t_l_jackson@gmail.com",
    "url": "www.EnergyCorp.com",
    "access": "Engineer",
    "progress": 0.03572269530270793,
    "uid": "f3cfa111-d4c2-4222-9597-08af5c575a1e"
  },
  {
    "name": "Nulla rutrum volutpat porta",
    "description": "Dui imperdiet ligula, efficitur elementum leo orci vitae nisl",
    "image": "emilyjones@outlook.com",
    "url": "www.BankingCorp.net",
    "access": "Assistant Support Executive",
    "progress": 0.856576082607868,
    "uid": "f7769a2e-cf03-4841-9b96-c6aa2639d733"
  },
  {
    "name": "Nunc vel dignissim mauris",
    "description": "Fusce sollicitudin maximus ante sed semper",
    "image": "christina.renee.phillips20@yahoo.com",
    "url": "www.MovieProductionLtd.io",
    "access": "Development Specialist",
    "progress": 0.8091679038971635,
    "uid": "54c8f9e1-00ea-44f6-92b0-6f26b04ff7ce"
  },
  {
    "name": "Nullam lacinia hendrerit ultricies",
    "description": "Cras nec nisl ut tellus mollis tristique eu sit amet risus",
    "image": "awatson@live.com",
    "url": "www.TheNanotechnologyCompany.net",
    "access": "Lead Engineering Manager",
    "progress": 0.14462285240522257,
    "uid": "9418f037-4bce-4e72-9775-63dbc4d1c400"
  },
  {
    "name": "Donec maximus ligula laoreet massa vehicula interdum at ac dolor",
    "description": "Mauris vitae nulla interdum, consectetur nunc eu, maximus nibh",
    "image": "t_h_jenkins@aol.com",
    "url": "www.VeterinaryLLC.net",
    "access": "Finance Consultant",
    "progress": 0.22796038096025123,
    "uid": "01b90cc8-94fc-407d-9214-25d765788d0c"
  },
  {
    "name": "Phasellus ut ante eleifend, ultrices massa non, varius diam",
    "description": "Proin vulputate pulvinar quam, aliquet iaculis eros pellentesque ac",
    "image": "b.carter@hotmail.com",
    "url": "www.ComputerEngineeringCo.org",
    "access": "Finance Specialist",
    "progress": 0.8512365906680084,
    "uid": "cf9e4e4a-3ef9-4bb6-8784-a044c7f46340"
  },
  {
    "name": "Et ultrices posuere cubilia curae; Suspendisse luctus luctus metus et eleifend",
    "description": "In cursus lacus quis sem euismod, eu ultrices diam aliquam",
    "image": "kyle.howard@ymail.com",
    "url": "www.AccountingIncorporated.org",
    "access": "Content Administrator",
    "progress": 0.5376436178464021,
    "uid": "b1244b39-301b-4abb-a807-5d4e49e512db"
  },
  {
    "name": "Integer viverra venenatis mauris, a pharetra dolor accumsan a",
    "description": "Vestibulum hendrerit vulputate euismod",
    "image": "dmdavis@ymail.com",
    "url": "www.AccountingIncorporated.com",
    "access": "Senior Budget Administrator",
    "progress": 0.9818378324386299,
    "uid": "6d0b0e40-dbcc-4e71-8096-c969d10d8c45"
  },
  {
    "name": "Fusce quis dui sed ligula viverra tempus in ac orci",
    "description": "Etiam sollicitudin enim eu nisl ullamcorper sagittis",
    "image": "s.perry@ymail.com",
    "url": "www.EventsServicesIncorporated.net",
    "access": "Finance Executive",
    "progress": 0.7859823622818226,
    "uid": "e7c0dddd-26ec-44e5-8299-98380d3c8555"
  },
  {
    "name": "Integer convallis turpis vitae condimentum tincidunt",
    "description": "Sed condimentum sapien eu bibendum porta",
    "image": "n.f.brown@hotmail.com",
    "url": "www.RecruitingCorp.io",
    "access": "Relations Manager",
    "progress": 0.4074443219992372,
    "uid": "dcaf4ed9-9d7e-457d-9dfd-7d68722a25ea"
  },
  {
    "name": "Cras suscipit erat sapien, id elementum erat porta eget",
    "description": "Nulla congue bibendum velit dictum pulvinar",
    "image": "t_l_jackson@gmail.com",
    "url": "www.EnergyCorp.com",
    "access": "Engineer",
    "progress": 0.03572269530270793,
    "uid": "f3cfa111-d4c2-4222-9597-08af5c575a1e"
  },
  {
    "name": "Nulla rutrum volutpat porta",
    "description": "Imperdiet ligula, efficitur elementum leo orci vitae nisl",
    "image": "emilyjones@outlook.com",
    "url": "www.BankingCorp.net",
    "access": "Assistant Support Executive",
    "progress": 0.856576082607868,
    "uid": "f7769a2e-cf03-4841-9b96-c6aa2639d733"
  },
  {
    "name": "Nunc vel dignissim mauris",
    "description": "Fusce sollicitudin maximus ante sed semper",
    "image": "christina.renee.phillips20@yahoo.com",
    "url": "www.MovieProductionLtd.io",
    "access": "Development Specialist",
    "progress": 0.8091679038971635,
    "uid": "54c8f9e1-00ea-44f6-92b0-6f26b04ff7ce"
  },
  {
    "name": "Nullam lacinia hendrerit ultricies",
    "description": "Cras nec nisl ut tellus mollis tristique eu sit amet risus",
    "image": "awatson@live.com",
    "url": "www.TheNanotechnologyCompany.net",
    "access": "Lead Engineering Manager",
    "progress": 0.14462285240522257,
    "uid": "9418f037-4bce-4e72-9775-63dbc4d1c400"
  },
  {
    "name": "Donec maximus ligula laoreet massa vehicula interdum at ac dolor",
    "description": "Mauris vitae nulla interdum, consectetur nunc eu, maximus nibh",
    "image": "t_h_jenkins@aol.com",
    "url": "www.VeterinaryLLC.net",
    "access": "Finance Consultant",
    "progress": 0.22796038096025123,
    "uid": "01b90cc8-94fc-407d-9214-25d765788d0c"
  },
  {
    "name": "Phasellus ut ante eleifend, ultrices massa non, varius diam",
    "description": "Proin vulputate pulvinar quam, aliquet iaculis eros pellentesque ac",
    "image": "b.carter@hotmail.com",
    "url": "www.ComputerEngineeringCo.org",
    "access": "Finance Specialist",
    "progress": 0.8512365906680084,
    "uid": "cf9e4e4a-3ef9-4bb6-8784-a044c7f46340"
  },
  {
    "name": "Et ultrices posuere cubilia curae; Suspendisse luctus luctus metus et eleifend",
    "description": "In cursus lacus quis sem euismod, eu ultrices diam aliquam",
    "image": "kyle.howard@ymail.com",
    "url": "www.AccountingIncorporated.org",
    "access": "Content Administrator",
    "progress": 0.5376436178464021,
    "uid": "b1244b39-301b-4abb-a807-5d4e49e512db"
  },
  {
    "name": "Integer viverra venenatis mauris, a pharetra dolor accumsan a",
    "description": "Vestibulum hendrerit vulputate euismod",
    "image": "dmdavis@ymail.com",
    "url": "www.AccountingIncorporated.com",
    "access": "Senior Budget Administrator",
    "progress": 0.9818378324386299,
    "uid": "6d0b0e40-dbcc-4e71-8096-c969d10d8c45"
  },
  {
    "name": "Fusce quis dui sed ligula viverra tempus in ac orci",
    "description": "Etiam sollicitudin enim eu nisl ullamcorper sagittis",
    "image": "s.perry@ymail.com",
    "url": "www.EventsServicesIncorporated.net",
    "access": "Finance Executive",
    "progress": 0.7859823622818226,
    "uid": "e7c0dddd-26ec-44e5-8299-98380d3c8555"
  }
];

List<Map<String, dynamic>> _tasks = [
  {
    "id": 1,
    "description": "Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.",
    "title": "User-friendly actuating artificial intelligence",
    "isCompleted": true,
    "date": "30 Jan, 2024"
  },
  {
    "id": 1,
    "description": "Phasellus in felis. Donec semper sapien a libero. Nam dui.",
    "title": "Enhanced logistical standardization",
    "isCompleted": false,
    "date": "8 Jan, 2024"
  },
  {
    "id": 1,
    "description": "Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.",
    "title": "Universal intermediate middleware",
    "isCompleted": true,
    "date": "8 Jan, 2024"
  },
  {
    "id": 1,
    "description": "Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;.",
    "title": "Optional static support",
    "isCompleted": true,
    "date": "27 Jan, 2024"
  },
  {
    "id": 1,
    "description": "Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis.",
    "title": "Proactive heuristic flexibility",
    "isCompleted": true,
    "date": "28 Jan, 2024"
  },
  {
    "id": 1,
    "description": "Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.",
    "title": "Phased solution-oriented project",
    "isCompleted": false,
    "date": "6 Jan, 2024"
  },
  {
    "id": 1,
    "description": "Nullam varius. Nulla facilisi.",
    "title": "Reverse-engineered bi-directional function",
    "isCompleted": true,
    "date": "11 Jan, 2024"
  },
  {
    "id": 1,
    "description": "Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae.",
    "title": "Implemented contextually-based encryption",
    "isCompleted": true,
    "date": "30 Jan, 2024"
  },
  {
    "id": 1,
    "description": "Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem.",
    "title": "Diverse responsive secured line",
    "isCompleted": false,
    "date": "6 Jan, 2024"
  },
  {
    "id": 1,
    "description": "Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut.",
    "title": "Organized real-time project",
    "isCompleted": false,
    "date": "26 Jan, 2024"
  },
  {
    "id": 1,
    "description": "In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. ",
    "title": "Streamlined dedicated middleware",
    "isCompleted": true,
    "date": "6 Jan, 2024"
  },
  {
    "id": 1,
    "description": "Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus.",
    "title": "Decentralized uniform toolset",
    "isCompleted": true,
    "date": "5 Jan, 2024"
  },
  {
    "id": 1,
    "description": "Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.",
    "title": "Multi-layered logistical forecast",
    "isCompleted": false,
    "date": "24 Jan, 2024"
  },
  {
    "id": 1,
    "description": "Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. ",
    "title": "Progressive attitude-oriented capacity",
    "isCompleted": false,
    "date": "22 Jan, 2024"
  },
  {
    "id": 1,
    "description": "Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.",
    "title": "Organized client-server functionalities",
    "isCompleted": false,
    "date": "2 Jan, 2024"
  },
  {
    "id": 1,
    "description": "Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor .",
    "title": "Self-enabling real-time interface",
    "isCompleted": false,
    "date": "19 Jan, 2024"
  },
  {
    "id": 1,
    "description": "Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio.",
    "title": "Centralized needs-based task-force",
    "isCompleted": false,
    "date": "22 Jan, 2024"
  },
  {
    "id": 1,
    "description": "Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo.",
    "title": "Versatile multi-tasking emulation",
    "isCompleted": true,
    "date": "21 Jan, 2024"
  },
  {
    "id": 1,
    "description": "Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.",
    "title": "Fully-configurable scalable policy",
    "isCompleted": true,
    "date": "14 Jan, 2024"
  },
  {
    "id": 1,
    "description": "Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio ",
    "title": "Re-contextualized 4th generation service-desk",
    "isCompleted": true,
    "date": "12 Jan, 2024"
  }
];

final List<ProjectModel> projects = [
  ProjectModel(
      uid: '1',
      name: 'Clinic Health Application for Patient',
      description: '',
      image: '',
      access: 'Public',
      progress: 23,
      participants: participants()),
  ProjectModel(
      uid: '2',
      name: 'Twin Motion',
      description: 'Realtime 3D visualization made easy',
      image: '',
      access: 'Private',
      url: 'https://www.twinmotion.com/en-US',
      progress: 58,
      participants: participants()),
  ProjectModel(
      uid: '3',
      name: 'Project Avalanche',
      description: 'A Dedicated Toolset for Motion and Broadcast Graphics',
      image: '',
      access: 'Public',
      url: 'https://forums.unrealengine.com/t/project-avalanche/778570',
      progress: 79,
      participants: participants()),
  ProjectModel(
      uid: '4',
      name: 'Meta Humans',
      description: 'High-fidelity Digital Humans Made Easy.',
      image: '',
      access: 'Private',
      url: 'https://www.unrealengine.com/en-US/metahuman',
      progress: 98,
      participants: participants()),
];

List<ProjectModel> _projects(int count) {
  Random random = Random();
  _data.shuffle(random);
  _tasks.shuffle(random);

  return _data.take(count).map((e) {
    int num = random.nextInt(15);
    return ProjectModel(
        uid: e['uid'],
        name: e['name'],
        description: e['description'],
        image: e['image'],
        url: e['url'],
        access: e['access'],
        participants: participants(),
        attachments: [],
        hasAttachments: false,
        progress: e['progress'],
        tasks: _tasks
            .take(num)
            .map((e) => TaskModel(
                id: e['id'].toString(),
                description: e['description'],
                title: e['title'],
                isCompleted: e['isCompleted'],
                date: e['date'],
                assignee: participants(count: 3),
                status: ['completed', 'in_progress', 'backlogged', 'pending'][random.nextInt(3)]))
            .toList());
  }).toList();
}

// Kanban Board Data

final todo = AppFlowyGroupData(id: "todo", name: "🗂 To Do", items: List<AppFlowyGroupItem>.from(_projects(2)));

final progress =
    AppFlowyGroupData(id: "progress", name: "🚧 In Progress", items: List<AppFlowyGroupItem>.from(_projects(1)));

final completed =
    AppFlowyGroupData(id: "completed", name: "✅ Completed", items: List<AppFlowyGroupItem>.from(_projects(4)));
final canceled =
    AppFlowyGroupData(id: "canceled", name: "⛔️ Canceled", items: List<AppFlowyGroupItem>.from(_projects(2)));
final backlog = AppFlowyGroupData(id: "backlog", name: "🗒 Backlog", items: List<AppFlowyGroupItem>.from(_projects(3)));

class ListDisplayModel {
  final String name;
  final List<ProjectModel> projects;

  ListDisplayModel({this.name = '', this.projects = const []});
}

final List<ListDisplayModel> listDisplayData = [
  ListDisplayModel(name: '🗂 To Do', projects: _projects(2)),
  ListDisplayModel(name: '🚧 In Progress', projects: _projects(1)),
  ListDisplayModel(name: '✅ Completed', projects: _projects(4)),
  ListDisplayModel(name: '⛔️ Canceled', projects: _projects(2)),
  ListDisplayModel(name: '🗒 Backlog', projects: _projects(3)),
];
