import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/features/experience/domain/experience.dart';
import 'package:portfolio/src/features/experience/data/experience_repository.dart';
import 'package:portfolio/src/features/experience/presentation/widgets/experience_card.dart';
import 'package:portfolio/src/localization/generated/locale_keys.g.dart';

class ExperienceDesktop extends ConsumerWidget {
  const ExperienceDesktop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final experiences =
        ref.watch(experienceRepositoryProvider).getExperiences();
    final visibleExperiences = experiences.isEmpty
        ? [
            const Experience(
              role: 'NexTrace CTF Winner',
              company: 'Nexus Security Club',
              description:
                  'One of the 4 winning members of NexTrace mini CTF by Nexus Security Club at ESTIN, Bejaia.',
              startYear: 2025,
              startMonth: 10,
            ),
          ]
        : experiences;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, bottom: 20),
          child: Text(
            tr(LocaleKeys.experienceSectionTitle),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        ...visibleExperiences.mapIndexed((index, experience) {
          return Column(
            children: [
              ExperienceCard(experience: experience),
              if (index != visibleExperiences.length - 1) gapH24,
            ],
          );
        }),
      ],
    );
  }
}
