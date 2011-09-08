Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Imran_Mehmood@mentor.com>) id 1R1fx0-0001lW-WC
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Sep 2011 16:51:35 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1R1ffv-0005QP-1K from Imran_Mehmood@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Sep 2011 07:33:55 -0700
Received: from localhost.localdomain ([137.202.157.139]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 8 Sep 2011 16:33:54 +0200
From: "Mehmood, Imran" <Imran_Mehmood@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Sep 2011 19:32:40 +0500
Message-Id: <cover.1315491183.git.Imran_Mehmood@mentor.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 08 Sep 2011 14:33:54.0225 (UTC)
	FILETIME=[55B60A10:01CC6E34]
Cc: Imran Mehmood <Imran_Mehmood@mentor.com>
Subject: [meta-oe][PATCH 0/1] pull request for cramfs recipe
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
X-List-Received-Date: Thu, 08 Sep 2011 14:51:35 -0000

From: Imran Mehmood <Imran_Mehmood@mentor.com>

The following changes since commit 9d3c8a9abc42b3ae7639f1226daf198ca04cd9bc:
  lumag (1):
        tcp-wrappers: drop emptying PARALLEL_MAKE

are available in the git repository at:

  git://github.com/lawwama/meta-oe master
  https://github.com/lawwama/meta-oe/tree/master

Imran Mehmood (1):
  cramfs: Adds cvs version recipe (initial recipe)

 meta-oe/recipes-support/cramfs/cramfs_cvs.bb |   29 ++++++++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/cramfs/cramfs_cvs.bb



