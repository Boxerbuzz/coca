/*
 * Copyright (c) boxerbuzz devs 2024. All Rights Reserved.
 */

import '../models/project_model.dart';
import 'user_data.dart';

final List<ProjectModel> projects = [
  ProjectModel(
      id: '1',
      name: 'Clinic Health Application for Patient',
      description: '',
      image: '',
      access: 'Public',
      progress: 23,
      participants: participants()),
  ProjectModel(
      id: '2',
      name: 'Twin Motion',
      description: 'Realtime 3D visualization made easy',
      image: '',
      access: 'Private',
      url: 'https://www.twinmotion.com/en-US',
      progress: 58,
      participants: participants()),
  ProjectModel(
      id: '3',
      name: 'Project Avalanche',
      description: 'A Dedicated Toolset for Motion and Broadcast Graphics',
      image: '',
      access: 'Public',
      url: 'https://forums.unrealengine.com/t/project-avalanche/778570',
      progress: 79,
      participants: participants()),
  ProjectModel(
      id: '4',
      name: 'Meta Humans',
      description: 'High-fidelity Digital Humans Made Easy.',
      image: '',
      access: 'Private',
      url: 'https://www.unrealengine.com/en-US/metahuman',
      progress: 98,
      participants: participants()),
];
