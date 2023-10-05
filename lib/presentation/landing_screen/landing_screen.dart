import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/app_assets.dart';
import '../../resources/app_theme_data.dart';
import '../widgets/base_box_widget.dart';
import '../widgets/base_form_widget.dart';
import '../widgets/github_repo_widget.dart';
import '../widgets/horizontal_box_widget.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final screenWidth = size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: _LandingAppBar(
        scrollController: scrollController,
      ),
      body: ListView(
        controller: scrollController,
        children: const [
          _MainBlock(),
          _ProblemSolutionBlock(),
          _Products(),
          _StepsBlock(),
          _TeamBlock(),
          _ContactsBlock(),
          _FooterBlock(),
        ],
      ),
      floatingActionButton: screenWidth > 1000
          ? null
          : FloatingActionButton(
              backgroundColor: AppColors.secondary,
              child: const Icon(
                Icons.messenger_outline,
                color: Colors.white,
              ),
              onPressed: () {
                scrollController.animateTo(scrollController.position.maxScrollExtent * 0.9,
                    duration: const Duration(milliseconds: 150), curve: Curves.easeInOutCubic);
              },
            ),
    );
  }
}

class _MainBlock extends StatelessWidget {
  const _MainBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final screenWidth = size.width;

    return Stack(alignment: Alignment.center, children: [
      Image.asset(
        AppAssets.mainBackImage,
        fit: BoxFit.cover,
        width: double.infinity,
      ),

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        // padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 70),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const Spacer(
            flex: 1,
          ),
          Expanded(
              flex: 5,
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withOpacity(0.6),
                          Colors.white.withOpacity(0.9),
                        ],
                      )),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(
                          'Training open live data through blockchain',
                          style: Theme.of(context).textTheme.displayLarge?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          'Decentralized live AI education platform',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ])))),
          if (screenWidth > 1000)
            const Spacer(
              flex: 2,
            ),
          if (screenWidth > 1000) Flexible(flex: 3, child: BaseFormWidget()),
          const Spacer(
            flex: 1,
          ),
        ]),
      )
    ]);
  }
}

class _ProblemSolutionBlock extends StatelessWidget {
  const _ProblemSolutionBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final screenWidth = size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 90),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Problem & Solution',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          20.heightBox,
          Container(
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.3),
                borderRadius: BorderRadius.circular(6),
              ),
              constraints: const BoxConstraints(maxWidth: 700),
              padding: const EdgeInsets.all(16.0),
              child: Row(children: [
                const Icon(Icons.camera_outdoor, color: AppColors.accent),
                10.widthBox,
                Flexible(
                    child: Text(
                  'AI training is centralized and costly. It is slow or impossible to adapt to new data sources, with limited access and censored by government content',
                  style: Theme.of(context).textTheme.bodyLarge,
                ))
              ])),
          40.heightBox,
          Text(
            'We are here to create a solution to solve the problem of AI training',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          20.heightBox,
          GridView.builder(
              shrinkWrap: true,
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: screenWidth > 1000
                      ? 3
                      : screenWidth > 600
                          ? 2
                          : 1,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.3 / 1),
              itemBuilder: (context, index) {
                return BaseBoxWidget(
                  icon: Icon(
                      [
                        Icons.crisis_alert,
                        Icons.policy_rounded,
                        Icons.lens_blur_rounded,
                        Icons.calculate_rounded,
                        Icons.local_convenience_store_outlined,
                        Icons.currency_exchange
                      ][index],
                      color: AppColors.accent),
                  title: [
                    'Crawlers',
                    'Data Preprocessing Engines',
                    'AI Training',
                    'AI Models',
                    'Console Application',
                    'XSO'
                  ][index],
                  subtitle: [
                    'Web crawlers are designed to scrape different websites and gather data for ML training. These are open-sourced, allowing the community to develop and contribute to them. Crawlers can be compiled into WebAssembly and stored on IPFS.',
                    'Custom blockchain nodes execute these engines, which prepare and clean the collected data for AI training. This includes tasks such as normalization, handling missing data, and encoding categorical variables.',
                    'The AI training process is decentralized across custom blockchain nodes, which use preprocessed data to train ML models. This training can use federated learning or similar decentralized approaches.',
                    'The primary AI model is based on architectures like RoBERTa or GPT and is extended with child ML models trained using the collected data. These models are stored on IPFS and updated with each mined block.',
                    'A console application is developed for interaction with the AI model. Users can ask questions, hold discussions, and execute code or scripts based on user input demands.',
                    'Self-living concept. The platform is sustained by its native cryptocurrency'
                  ][index],
                );
              }).paddingSymmetric(horizontal: screenWidth > 1200 ? (screenWidth-1200)/2 : 0)
        ],
      ),
    );
  }
}

class _TeamBlock extends StatelessWidget {
  const _TeamBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              colorFilter: const ColorFilter.mode(Colors.black, BlendMode.color),
              image: Image.network(
                      'https://images.designtrends.com/wp-content/uploads/2015/12/10131657/Flowers-Background.jpg',
                      filterQuality: FilterQuality.high)
                  .image),
        ),
        child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white.withOpacity(0.2),
                  Colors.white.withOpacity(0),
                  Colors.white.withOpacity(0.2),
                  Colors.white
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 90),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Our Team',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  50.heightBox,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _TeamMember(
                        name: 'Anton Mefed',
                        photo: 'assets/team/person_1.jpg',
                        description: 'Best developer ever',
                      ),
                      Spacer(),
                      _TeamMember(
                        name: 'Roman Cores',
                        photo: 'https://avatars.githubusercontent.com/u/73547162?v=4',
                        description: 'Best developer',
                      ),
                      // Spacer(),
                      // _TeamMember(
                      //   name: 'Some other guy',
                      //   photo: 'assets/team/person_3.jpg',
                      //   description: 'Ok developer',
                      // ),
                    ],
                  ),
                ],
              ),
            )));
  }
}

class _TeamMember extends StatelessWidget {
  const _TeamMember({
    required this.name,
    required this.photo,
    super.key,
    required this.description,
  });

  final String name;
  final String description;
  final String photo;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DecoratedBox(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, strokeAlign: BorderSide.strokeAlignOutside)),
              child: CircleAvatar(
                backgroundImage: Image.network(photo).image,
              )),
          10.heightBox,
          Text(
            name,
            textAlign: TextAlign.center,
            style:
                Theme.of(context).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          4.heightBox,
          Text(
            description,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.normal, color: Colors.white),
          ),

          // Image.asset(
          //   photo,
          //   width: 80.0,
          //   height: 80.0,
          // ),
        ],
      ),
    );
  }
}

class _ContactsBlock extends StatelessWidget {
  const _ContactsBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final screenWidth = size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 90),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text(
          'Contacts',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        25.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Email: <EMAIL>',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                'Phone: +1 (555) 555-5555',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              if (screenWidth <= 600)
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300, minWidth: 200),
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      color: Theme.of(context).cardColor,
                      child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(mainAxisSize: MainAxisSize.min, children: [
                            TextFormField(
                                style: Theme.of(context).textTheme.displaySmall,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                  labelText: 'Name',
                                )),
                            TextFormField(
                                style: Theme.of(context).textTheme.displaySmall,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  labelText: 'Email',
                                )),
                            24.0.heightBox,
                            SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(onPressed: () {}, child: const Text('Send')))
                          ]))),
                )
            ]),
            if (screenWidth > 600) BaseFormWidget()
          ],
        )
      ]),
    );
  }
}

class _FooterBlock extends StatelessWidget {
  const _FooterBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Follow us',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  const Icon(Icons.facebook, color: Colors.white),
                  const Icon(Icons.telegram, color: Colors.white),
                  const Icon(Icons.link, color: Colors.white),
                  const Spacer(),
                  Text(
                    'Dehyphotised LLC 2023 © All rights reserved.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

class _LandingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ScrollController scrollController;

  const _LandingAppBar({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return AppBar(
        title: Text(
          'Dehypnotised',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        // leadingWidth: 200,
        leading: IconButton(
          icon: Transform.scale(
              scale: 2,
              child: SvgPicture.asset(AppAssets.logo
                  // height: kToolbarHeight*2,
                  // fit: BoxFit.fitHeight,
                  )),
          // Icon(
          //   Icons.tag,
          //   color: Colors.white,
          // ),
          onPressed: () {
            // Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        elevation: 10,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.0)),
        // ),
        actions: screenWidth > 700
            ? List.generate(
                4,
                (index) => IconButton(
                  onPressed: () {
                    switch (index) {
                      // case 0:
                      //   scrollController.animateTo(0)
                    }
                  },
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.center,
                  constraints: const BoxConstraints(minWidth: 48.0, minHeight: 48.0),
                  icon: Text(
                    ['Intro', 'Tech', 'Team', 'Contact'][index],
                  ),
                ),
              )
            : [
                PopupMenuButton(
                  icon: const Icon(Icons.table_rows_sharp),
                  itemBuilder: (context) =>
                      ['Intro', 'Tech', 'Team', 'Contact'].map((e) => PopupMenuItem(value: e, child: Text(e))).toList(),
                )
              ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 1.2);
}

const blocksPadding = EdgeInsets.symmetric(horizontal: 24.0, vertical: 60);

class _StepsBlock extends StatelessWidget {
  const _StepsBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final screenWidth = size.width;
    const steps = 5;

    return Padding(
        padding: blocksPadding,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'DETAILED PROJECT ROAD',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ],
          ),
          25.heightBox,
          ...List.generate(
              steps,
              (index) => Transform.translate(
                    offset: screenWidth > 700 ? Offset((screenWidth - 300).abs() / (steps) * index, 0) : Offset.zero,
                    child: BaseBoxWidget(
                      constraints: BoxConstraints(maxWidth: screenWidth / (screenWidth > 700 ? 3 : 1)),
                      icon: [
                        const Icon(Icons.book_outlined),
                        const Icon(Icons.settings),
                        const Icon(Icons.leaderboard_outlined),
                        const Icon(Icons.terminal_sharp),
                        const Icon(Icons.signal_cellular_alt),
                      ][index],
                      direction: Axis.horizontal,
                      title: [
                        'Project Setup & Initial Development',
                        'Blockchain Development',
                        'Machine Learning Development',
                        'Final Integration & Testing',
                        'Integration & Scaling'
                      ][index],
                      subtitle: [
                        'Custom Blockchain Development: Define requirements, design blockchain architecture, and implement basic blockchain features.',
                        'Data Preprocessing: Design and implement data preprocessing pipelines, including data cleaning, transformation, and feature engineering.',
                        'Integration of AI Models with Application: Develop the a console application, integrate AI models, and implement code/script execution features.',
                        'Scaling Data Collection & Processing: Optimize data collection for scale, implement distributed data processing, and optimize ML models for large-scale datasets.',
                        'Ongoing Maintenance & Improvement: Monitor the the system, collect feedback, address issues, and continuously improve and update the system based on feedback and emerging technologies.'
                      ][index],
                    ),
                  ).paddingSymmetric(vertical: 5)).toList()
        ]));
  }
}

class _Products extends StatelessWidget {
  const _Products({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final screenWidth = size.width;

    return Padding(
        padding: blocksPadding,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'High level',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ],
          ),
          25.heightBox,
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            if(screenWidth>1000)
            const Spacer(),
            GithubRepoWidget(
              titleIcon: const Icon(Icons.color_lens_outlined).paddingOnly(bottom: 10),
              gitUrl: 'https://github.com/Dehypnotized/0xSoul.Data',
              title: 'Data collector',
              description: const [],
            ),
            GithubRepoWidget(
                titleIcon: const Icon(Icons.account_box_outlined).paddingOnly(bottom: 10),
                gitUrl: 'https://github.com/Dehypnotized/0xSoul.AI',
                title: 'AI teacher',
                description: const []),
            if(screenWidth>1000)
            const Spacer(),
          ]),

          25.heightBox,
          const HorizontalBoxWidget(
            constraints: BoxConstraints(maxWidth: 500),
            icon: Icon(Icons.person_outline),
            title: 'P2P network data collector',
          ),
          25.heightBox,
           const HorizontalBoxWidget(
            constraints: BoxConstraints(maxWidth: 500),
            textDirection: TextDirection.rtl,
            icon: Icon(Icons.monetization_on_outlined),
            title: 'Trading data collector',
          ),
          25.heightBox,
          const HorizontalBoxWidget(
            constraints: BoxConstraints(maxWidth: 500),
            icon: Icon(Icons.network_locked),
            title: 'Network security data collector',
          ),
        ]));
  }
}
