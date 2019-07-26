class Project {
  final String id;
  final double imgHeight;
  final String title;
  final String description;
  final String urlImg;
  final List<String> images;
  final List<SoftwareTool> tools;
  final String gitUrl;
  final String projectUrl;
  final bool onProject;
  Project(
      {this.id,
      this.title,
      this.description,
      this.urlImg,
      this.tools,
      this.gitUrl,
      this.projectUrl,
      this.images = const [],
      this.onProject = false,
      this.imgHeight = 100.0});
}

class SoftwareTool {
  final String name;
  final String urlImg;
  SoftwareTool({this.name, this.urlImg});
}

List<SoftwareTool> customTools = [
  SoftwareTool(name: 'Flutter', urlImg: 'assets/images/tools/flutter.png'),
  SoftwareTool(name: 'Vuejs', urlImg: 'assets/images/tools/vuejs.png'),
  SoftwareTool(name: 'NodeJS', urlImg: 'assets/images/tools/nodejs.png'),
];

List<SoftwareTool> a1tools = [
  SoftwareTool(name: 'Flutter', urlImg: 'assets/images/tools/flutter.png'),
  SoftwareTool(name: 'Flutter: Bloc patten', urlImg: 'assets/images/tools/flutter.png'),
  SoftwareTool(name: 'Flutter: I18n', urlImg: 'assets/images/tools/flutter.png'),
  SoftwareTool(name: 'Firebase', urlImg: 'assets/images/tools/firebase.png'),
];

List<Project> myProject = <Project>[
  Project(
      id: 'a1',
      imgHeight: 150,
      urlImg: 'assets/images/projects/portfolio_main.png',
      images: [
        'assets/images/projects/port_01.png',
        'assets/images/projects/portfolio_main.png',
        'assets/images/projects/port_03.png',
        'assets/images/projects/port_04.png',
      ],
      title: 'Diseño portafolio: Aplicaciones moviles',
      description: 'Proyecto hecho con flutter, bloc_pattern, flutter_localizations y flutter_firebase para el cloud de los datos, la aplicación tiene la finalidad de mostrar proyectos y diseños, sobre todo habilidades en general.',
      gitUrl: 'https://github.com/reynaldoqs/mobil_portfolio.git',
      onProject: true,
      projectUrl: 'www.pornhub.com',
      tools: a1tools),
  Project(
      id: 'a2',
      imgHeight: 150,
      urlImg: 'assets/images/projects/restaurant.webp',
      title: 'Game UI',
      description: 'This is a inteface made for presente a game to everybody',
      gitUrl: 'www.xxxvideo.com',
      onProject: false,
      projectUrl: 'www.pornhub.com',
      tools: customTools),
  Project(
      id: '01',
      imgHeight: 150,
      urlImg: 'assets/images/projects/app01.png',
      title: 'Game UI',
      description: 'This is a inteface made for presente a game to everybody',
      gitUrl: 'www.xxxvideo.com',
      onProject: false,
      projectUrl: 'www.pornhub.com',
      tools: customTools),
  Project(
      id: '02',
      imgHeight: 150,
      urlImg: 'assets/images/projects/app02.png',
      title: 'Dark design',
      description: 'This is a inteface made for presente a game to everybody',
      gitUrl: 'www.xxxvideo.com',
      onProject: false,
      projectUrl: 'www.pornhub.com',
      tools: customTools),
  Project(
      id: '03',
      imgHeight: 320,
      urlImg: 'assets/images/projects/app03.png',
      title: 'Finger log',
      description: 'This is a inteface made for presente a game to everybody',
      gitUrl: 'www.xxxvideo.com',
      onProject: false,
      projectUrl: 'www.pornhub.com',
      tools: customTools),
  Project(
      id: '04',
      imgHeight: 150,
      urlImg: 'assets/images/projects/app04.png',
      title: 'ImageDeign',
      description: 'This is a inteface made for presente a game to everybody',
      gitUrl: 'www.xxxvideo.com',
      onProject: false,
      projectUrl: 'www.pornhub.com',
      tools: customTools),
  Project(
      id: '05',
      imgHeight: 320,
      urlImg: 'assets/images/projects/app05.jpg',
      title: 'Cocacola Design',
      description: 'This is a inteface made for presente a game to everybody',
      gitUrl: 'www.xxxvideo.com',
      onProject: false,
      projectUrl: 'www.pornhub.com',
      tools: customTools),
  Project(
      id: '06',
      imgHeight: 320,
      urlImg: 'assets/images/projects/app06.png',
      title: 'Some other Design',
      description: 'This is a inteface made for presente a game to everybody',
      gitUrl: 'www.xxxvideo.com',
      onProject: false,
      projectUrl: 'www.pornhub.com',
      tools: customTools),
];
