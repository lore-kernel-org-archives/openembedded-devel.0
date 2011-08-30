Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1QyM5x-0008S6-Od
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 13:03:05 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1QyM1F-0003PV-7i from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 03:58:13 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 30 Aug 2011 12:58:11 +0200
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Aug 2011 15:58:39 +0500
Message-Id: <cover.1314691875.git.noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 30 Aug 2011 10:58:11.0570 (UTC)
	FILETIME=[B591DD20:01CC6703]
Subject: [meta-oe][PATCH 0/3] pull request #2 for benchmark recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Aug 2011 11:03:06 -0000

From: Noor Ahsan <noor_ahsan@mentor.com>


The following changes since commit eeb0e7ce1e3cf7be787eae20a6ed4e15faa55e35:
  Noor Ahsan (1):
        tiobench: Add version 0.3.3 (initial recipe)

are available in the git repository at:

  git://github.com/Noor-Ahsan/meta-oe master
  https://github.com/Noor-Ahsan/meta-oe/tree/master

Noor Ahsan (3):
  bonnie++: Add version 1.03c (initial recipe)
  netperf: Add version 2.4.4 (initial recipe)
  iozone3: Add version 263 (initial recipe)

 meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb |   30 ++++++
 .../bonnie/files/gcc-4.3-fixes.patch               |   19 ++++
 .../iozone3/iozone3/copyright.txt                  |   62 +++++++++++
 .../iozone3/iozone3/fileop-arm.patch               |   32 ++++++
 meta-oe/recipes-benchmark/iozone3/iozone3_263.bb   |  111 ++++++++++++++++++++
 .../recipes-benchmark/netperf/files/cpu_set.patch  |   27 +++++
 meta-oe/recipes-benchmark/netperf/files/init       |   51 +++++++++
 .../recipes-benchmark/netperf/files/vfork.patch    |   29 +++++
 meta-oe/recipes-benchmark/netperf/netperf_2.4.4.bb |   53 +++++++++
 9 files changed, 414 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb
 create mode 100644 meta-oe/recipes-benchmark/bonnie/files/gcc-4.3-fixes.patch
 create mode 100644 meta-oe/recipes-benchmark/iozone3/iozone3/copyright.txt
 create mode 100644 meta-oe/recipes-benchmark/iozone3/iozone3/fileop-arm.patch
 create mode 100644 meta-oe/recipes-benchmark/iozone3/iozone3_263.bb
 create mode 100644 meta-oe/recipes-benchmark/netperf/files/cpu_set.patch
 create mode 100644 meta-oe/recipes-benchmark/netperf/files/init
 create mode 100755 meta-oe/recipes-benchmark/netperf/files/vfork.patch
 create mode 100644 meta-oe/recipes-benchmark/netperf/netperf_2.4.4.bb



