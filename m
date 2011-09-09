Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Imran_Mehmood@mentor.com>) id 1R21H1-0002vY-2O
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Sep 2011 15:37:39 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1R21By-0003Ct-9l from Imran_Mehmood@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Sep 2011 06:32:26 -0700
Received: from localhost.localdomain ([137.202.157.139]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 9 Sep 2011 15:32:25 +0200
From: "Mehmood, Imran" <Imran_Mehmood@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Sep 2011 18:31:10 +0500
Message-Id: <cover.1315574675.git.Imran_Mehmood@mentor.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 09 Sep 2011 13:32:25.0289 (UTC)
	FILETIME=[E958D390:01CC6EF4]
Cc: Imran Mehmood <Imran_Mehmood@mentor.com>
Subject: [meta-oe][PATCH 0/1] pull request for xclock recipe
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
X-List-Received-Date: Fri, 09 Sep 2011 13:37:39 -0000

From: Imran Mehmood <Imran_Mehmood@mentor.com>

The following changes since commit 94a25d92b4d0e9379caaab127ccac1a94e9e4d28:
  Imran Mehmood (1):
        cramfs: Adds cvs version recipe (initial recipe)

are available in the git repository at:

  git://github.com/lawwama/meta-oe master
  https://github.com/lawwama/meta-oe/tree/master

Imran Mehmood (1):
  xclock: Add recipe version 1.0.5 (initial recipe)

 meta-oe/recipes-graphics/xorg-app/xclock_1.0.5.bb |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/xclock_1.0.5.bb



