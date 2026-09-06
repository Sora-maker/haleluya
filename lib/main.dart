import 'dart:developer' as developer;

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brent Michael S. Ignacio | Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: _PortfolioColors.teal,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: _PortfolioColors.cream,
        fontFamily: 'Arial',
      ),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 760;
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: isWide ? 48 : 20,
                vertical: 24,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1120),
                  child: isWide
                      ? const _WidePortfolioLayout()
                      : const _CompactPortfolioLayout(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _WidePortfolioLayout extends StatelessWidget {
  const _WidePortfolioLayout();

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 305, child: _Sidebar()),
        SizedBox(width: 28),
        Expanded(child: _MainContent(showHero: false)),
      ],
    );
  }
}

class _CompactPortfolioLayout extends StatelessWidget {
  const _CompactPortfolioLayout();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _HeroHeader(compact: true),
        SizedBox(height: 20),
        _MainContent(showHero: false),
        SizedBox(height: 20),
        _Sidebar(showHeader: false),
      ],
    );
  }
}

class _Sidebar extends StatelessWidget {
  const _Sidebar({this.showHeader = true});

  final bool showHeader;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showHeader) const _HeroHeader(),
        if (showHeader) const SizedBox(height: 26),
        const _SectionTitle('CONTACT'),
        const SizedBox(height: 12),
        const _ContactLine(
          Icons.home_rounded,
          'Blk 10 Lot 6 Centennial Homes 2',
          'Pulo, Cabuyao, Laguna',
        ),
        const _ContactLine(Icons.phone_rounded, '0993 518 3295'),
        const _ContactLine(
          Icons.email_rounded,
          'ignaciobrentmichael@gmail.com',
        ),
        const SizedBox(height: 24),
        const _SectionTitle('QUALIFICATIONS'),
        const SizedBox(height: 10),
        const _BulletList([
          'Active Listener',
          'Accountable in every task',
          'Hardworking Individual',
          'Trustworthy',
          'Willing to Learn new things',
        ]),
        const SizedBox(height: 24),
        const _GestureCard(),
      ],
    );
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent({this.showHero = true});

  final bool showHero;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showHero) const _HeroHeader(),
        if (showHero) const SizedBox(height: 28),
        const _SectionTitle('OBJECTIVE'),
        const SizedBox(height: 12),
        const Text(
          'To contribute positively to communities in which we operate through corporate social responsibility initiatives and to adapt to evolving market trends and technological advancements.',
          style: TextStyle(
            fontSize: 15,
            height: 1.55,
            color: _PortfolioColors.ink,
          ),
        ),
        const SizedBox(height: 28),
        const _SectionTitle('EDUCATION'),
        const SizedBox(height: 14),
        const _EducationEntry(
          '2022 - Present',
          'Senior High - College • University of Cabuyao (UC - PNC)',
          'Enterprise Park, Brgy. Banay-banay, Cabuyao, Laguna',
          'Technical-Vocational-Livelihood & Bachelor of Science in Information Technology (BSIT)',
          'With Honors',
        ),
        const _EducationEntry(
          '2018 - 2022',
          'Secondary • Cabuyao Integrated National High School',
          'Cabuyao, Laguna',
          '',
          'With Honors',
        ),
        const _EducationEntry(
          '2012 - 2017',
          'Elementary • Banay-banay Elementary School',
          'Cabuyao, Laguna',
          'Getachez Subdivision, Brgy. Banay-banay, Cabuyao, Laguna',
          'With Honors',
        ),
        const SizedBox(height: 26),
        const _SectionTitle('SKILLS'),
        const SizedBox(height: 12),
        const _BulletList([
          'Project Management',
          'Video Creation',
          'Microsoft Office (MS Word, MS Powerpoint)',
          'Graphic Design Skills',
          'Operating and Organizational Skills',
        ]),
      ],
    );
  }
}

class _HeroHeader extends StatelessWidget {
  const _HeroHeader({this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: compact ? 42 : 48,
          backgroundColor: _PortfolioColors.teal,
          child: CircleAvatar(
            radius: compact ? 37 : 43,
            backgroundImage: const AssetImage('assets/images/brent.jpg'),
          ),
        ),
        const SizedBox(width: 16),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('BRENT MICHAEL', style: _NameStyle()),
              Text('S. IGNACIO', style: _NameStyle()),
              SizedBox(height: 8),
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  'STUDENT • CREATIVE • ORGANIZED',
                  maxLines: 1,
                  softWrap: false,
                  style: _KickerStyle(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _GestureCard extends StatelessWidget {
  const _GestureCard();

  void _logGesture(String gesture, String message) {
    final record = '[GESTURE] {"$gesture","$message"}';
    debugPrint(record);
    developer.log(record, name: 'haleluya.gestures');
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          backgroundColor: _PortfolioColors.teal,
          action: SnackBarAction(
            label: 'OK',
            textColor: Colors.white,
            onPressed: () {},
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    const professorName = 'Prof. Albert Q. Alforja';
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        const message = 'Date: September 6, 2026';
        _logGesture('single_tap', message);
        _showMessage(context, message);
      },
      onDoubleTap: () {
        final message = 'ITP107 professor: $professorName';
        _logGesture('double_tap', message);
        _showMessage(context, message);
      },
      onLongPress: () {
        const message = 'Full name: Brent Michael S. Ignacio';
        _logGesture('long_press', message);
        _showMessage(context, message);
      },
      child: Card(
        elevation: 0,
        color: _PortfolioColors.teal,
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              const Icon(
                Icons.touch_app_rounded,
                color: Colors.white,
                size: 26,
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Click Me',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.2,
            color: _PortfolioColors.teal,
          ),
        ),
        const SizedBox(width: 10),
        const Expanded(child: Divider(color: _PortfolioColors.line)),
      ],
    );
  }
}

class _ContactLine extends StatelessWidget {
  const _ContactLine(this.icon, this.primary, [this.secondary]);

  final IconData icon;
  final String primary;
  final String? secondary;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: _PortfolioColors.coral),
          const SizedBox(width: 11),
          Expanded(
            child: Text(
              secondary == null ? primary : '$primary\n$secondary',
              style: const TextStyle(
                fontSize: 14,
                height: 1.45,
                color: _PortfolioColors.ink,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BulletList extends StatelessWidget {
  const _BulletList(this.items);

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 9),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '•  ',
                    style: TextStyle(
                      color: _PortfolioColors.coral,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 15,
                        height: 1.4,
                        color: _PortfolioColors.ink,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _EducationEntry extends StatelessWidget {
  const _EducationEntry(
    this.period,
    this.school,
    this.location,
    this.program,
    this.honors,
  );

  final String period;
  final String school;
  final String location;
  final String program;
  final String honors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.only(top: 5),
            decoration: const BoxDecoration(
              color: _PortfolioColors.coral,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  period,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: _PortfolioColors.coral,
                  ),
                ),
                Text(
                  school,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: _PortfolioColors.ink,
                  ),
                ),
                if (location.isNotEmpty)
                  Text(
                    location,
                    style: const TextStyle(
                      fontSize: 12,
                      color: _PortfolioColors.muted,
                    ),
                  ),
                if (program.isNotEmpty)
                  Text(
                    program,
                    style: const TextStyle(
                      fontSize: 12,
                      color: _PortfolioColors.muted,
                    ),
                  ),
                if (honors.isNotEmpty)
                  Text(
                    honors,
                    style: const TextStyle(
                      fontSize: 12,
                      color: _PortfolioColors.muted,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NameStyle extends TextStyle {
  const _NameStyle()
    : super(
        fontSize: 27,
        height: 0.95,
        fontWeight: FontWeight.w900,
        color: _PortfolioColors.teal,
        letterSpacing: 0.4,
      );
}

class _KickerStyle extends TextStyle {
  const _KickerStyle()
    : super(
        fontSize: 10,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.5,
        color: _PortfolioColors.coral,
      );
}

class _PortfolioColors {
  static const teal = Color(0xFF173F4F);
  static const coral = Color(0xFFD66A4A);
  static const cream = Color(0xFFF7F3EC);
  static const ink = Color(0xFF23323A);
  static const muted = Color(0xFF66747A);
  static const line = Color(0xFFD7D0C5);
}
