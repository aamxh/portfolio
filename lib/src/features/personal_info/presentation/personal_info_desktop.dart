import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/features/personal_info/data/personal_info_repository.dart';
import 'package:portfolio/src/features/personal_info/presentation/widgets/contact_bar.dart';
import 'package:portfolio/src/localization/generated/locale_keys.g.dart';

class PersonalInfoDesktop extends ConsumerWidget {
  const PersonalInfoDesktop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contacts = ref.watch(personalInfoRepositoryProvider).getContacts();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tr(LocaleKeys.name),
          style: Theme.of(context).textTheme.displaySmall,
        ),
        gapH8,
        Text(
          tr(LocaleKeys.description),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        gapH8,
        Text(
          tr(LocaleKeys.subDescription),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        gapH16,
        CircleAvatar(
          radius: 100,
          backgroundImage: const AssetImage('assets/images/pfp.png'),
        ),
        const Spacer(),
        gapH8,
        ContactBar(contacts: contacts.toList()),
      ],
    );
  }
}
