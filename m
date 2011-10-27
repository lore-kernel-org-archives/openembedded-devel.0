Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Imran_Mehmood@mentor.com>) id 1RJOEp-0006sE-Vo
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Oct 2011 13:35:12 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1RJO90-00011p-NI from Imran_Mehmood@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Oct 2011 04:29:10 -0700
Received: from localhost.localdomain ([137.202.156.87]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 27 Oct 2011 13:29:09 +0200
From: "Mehmood, Imran" <Imran_Mehmood@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Oct 2011 16:28:34 +0500
Message-Id: <cover.1319713297.git.Imran_Mehmood@mentor.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 27 Oct 2011 11:29:09.0727 (UTC)
	FILETIME=[A5139EF0:01CC949B]
Cc: Imran Mehmood <Imran_Mehmood@mentor.com>
Subject: [meta-oe][PATCH v2 0/1] pull request for xclock recipe
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
X-List-Received-Date: Thu, 27 Oct 2011 11:35:12 -0000

From: Imran Mehmood <Imran_Mehmood@mentor.com>

The following changes since commit c60bf558fa16034f7b010dc3e5862a1d3eb6c6d4:
  Andreas Müller (1):
        xfce4-datetime-plugin: Initial add git (0.6.1)

are available in the git repository at:

  git://github.com/imehmood/meta-oe master
  https://github.com/imehmood/meta-oe/tree/master

Imran Mehmood (1):
  xclock: Add version 1.0.5 (initial recipe)

 meta-oe/recipes-graphics/xorg-app/xclock_1.0.5.bb |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/xclock_1.0.5.bb



