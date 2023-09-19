import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class HomeScreenZ extends StatelessWidget {
  String content =
      'A flower, sometimes known as a bloom or blossom, is the reproductive structure found in flowering plants (plants of the division Angiospermae). Flowers produce gametophytes, which in flowering plants consist of a few haploid cells which produce gametes. The "male" gametophyte, which produces non-motile sperm, is enclosed within pollen grains; the female gametophyte is contained within the ovule. When pollen from the anther of a flower is deposited on the stigma, this is called pollination. Some flowers may self-pollinate, producing seed using pollen from the same flower or a different flower of the same plant, but others have mechanisms to prevent self-pollination and rely on cross-pollination, when pollen is transferred from the anther of one flower to the stigma of another flower on a different individual of the same species.Self-pollination happens in flowers where the stamen and carpel mature at the same time, and are positioned so that the pollen can land on the flowers stigma. This pollination does not require an investment from the plant to provide nectar and pollen as food for pollinators.[1]Some flowers produce diaspores without fertilization (parthenocarpy). Flowers contain sporangia and are the site where gametophytes develop.Most flowering plants depend on animals, such as bees, moths, and butterflies, to transfer their pollen between different flowers, and have evolved to attract these pollinators by various strategies, including brightly colored, conspicuous petals, attractive scents, and the production of nectar, a food source for pollinators.[2] In this way, many flowering plants have co-evolved with pollinators to be mutually dependent on services they provide to one another—in the plants case, a means of reproduction; in the pollinators case, a source of food.[3] After fertilization, the ovary of the flower develops into fruit containing seeds.Flowers have long been appreciated by humans for their beauty and pleasant scents, and also hold cultural significance as religious, ritual, oA flower, sometimes known as a bloom or blossom, is the reproductive structure found in flowering plants (plants of the division Angiospermae). Flowers produce gametophytes, which in flowering plants consist of a few haploid cells which produce gametes. The "male" gametophyte, which produces non-motile sperm, is enclosed within pollen grains; the female gametophyte is contained within the ovule. When pollen from the anther of a flower is deposited on the stigma, this is called pollination. Some flowers may self-pollinate, producing seed using pollen from the same flower or a different flower of the same plant, but others have mechanisms to prevent self-pollination and rely on cross-pollination, when pollen is transferred from the anther of one flower to the stigma of another flower on a different individual of the same species.Self-pollination happens in flowers where the stamen and carpel mature at the same time, and are positioned so that the pollen can land on the flowers stigma. This pollination does not require an investment from the plant to provide nectar and pollen as food for pollinators.[1]Some flowers produce diaspores without fertilization (parthenocarpy). Flowers contain sporangia and are the site where gametophytes develop.Most flowering plants depend on animals, such as bees, moths, and butterflies, to transfer their pollen between different flowers, and have evolved to attract these pollinators by various strategies, including brightly colored, conspicuous petals, attractive scents, and the production of nectar, a food source for pollinators.[2] In this way, many flowering plants have co-evolved with pollinators to be mutually dependent on services they provide to one another—in the plants case, a means of reproduction; in the pollinators case, a source of food.[3] After fertilization, the ovary of the flower develops into fruit containing seeds.Flowers have long been appreciated by humans for their beauty and pleasant scents, and also hold cultural significance as religious, ritual, or symbolic objects, or sources of medicine and foodr symbolic objects, or sources of medicine and food';

  HomeScreenZ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read more'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: ReadMoreText(
            content,
            trimLines: 3,
            textAlign: TextAlign.justify,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show More',
            trimExpandedText: 'Show less',
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green[700],
            ),
            moreStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green[700],
            ),
            style: TextStyle(
              fontSize: 16,
              height: 2,
            ),
          ),
        ),
      ),
    );
  }
}
