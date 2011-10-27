Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Imran_Mehmood@mentor.com>) id 1RJPPX-0002tw-S0
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Oct 2011 14:50:20 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1RJPJk-00014s-LA from Imran_Mehmood@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Oct 2011 05:44:20 -0700
Received: from localhost.localdomain ([137.202.156.87]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 27 Oct 2011 14:44:19 +0200
From: "Mehmood, Imran" <Imran_Mehmood@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Oct 2011 17:43:43 +0500
Message-Id: <cover.1319719054.git.Imran_Mehmood@mentor.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 27 Oct 2011 12:44:19.0905 (UTC)
	FILETIME=[255A2B10:01CC94A6]
Cc: Imran Mehmood <Imran_Mehmood@mentor.com>
Subject: [meta-oe][PATCH v3 0/1] pull request for xclock recipe
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
X-List-Received-Date: Thu, 27 Oct 2011 12:50:20 -0000

From: Imran Mehmood <Imran_Mehmood@mentor.com>

The following changes since commit c60bf558fa16034f7b010dc3e5862a1d3eb6c6d4:
  Andreas Müller (1):
        xfce4-datetime-plugin: Initial add git (0.6.1)

are available in the git repository at:

  git://github.com/imehmood/meta-oe master
  https://github.com/imehmood/meta-oe/tree/master

Imran Mehmood (1):
  xclock: Add version 1.0.5 (initial recipe)

 meta-oe/recipes-graphics/xorg-app/xclock_1.0.5.bb |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/xclock_1.0.5.bb



