Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Imran_Mehmood@mentor.com>) id 1R6cv4-0002LN-VJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Sep 2011 08:38:03 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1R6cpv-0005DL-Qy from Imran_Mehmood@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Sep 2011 23:32:44 -0700
Received: from localhost.localdomain ([137.202.157.139]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 22 Sep 2011 08:32:42 +0200
From: "Mehmood, Imran" <Imran_Mehmood@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Sep 2011 11:31:08 +0500
Message-Id: <cover.1316616945.git.Imran_Mehmood@mentor.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 22 Sep 2011 06:32:43.0157 (UTC)
	FILETIME=[6EFF2C50:01CC78F1]
Cc: Imran Mehmood <Imran_Mehmood@mentor.com>
Subject: [meta-oe][PATCH v3 0/2] pull request for twm and xclock recipes
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
X-List-Received-Date: Thu, 22 Sep 2011 06:38:03 -0000

From: Imran Mehmood <Imran_Mehmood@mentor.com>

The following changes since commit 94a25d92b4d0e9379caaab127ccac1a94e9e4d28:
  Imran Mehmood (1):
        cramfs: Adds cvs version recipe (initial recipe)

are available in the git repository at:

  git://github.com/lawwama/meta-oe master
  https://github.com/lawwama/meta-oe/tree/master

Imran Mehmood (2):
  xclock: Add version 1.0.5 (initial recipe)
  twm: Add version 1.0.6 (initial recipe)

 meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb    |   16 ++++++++++++++++
 meta-oe/recipes-graphics/xorg-app/xclock_1.0.5.bb |   10 ++++++++++
 2 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/twm_1.0.6.bb
 create mode 100644 meta-oe/recipes-graphics/xorg-app/xclock_1.0.5.bb



