Received: from zk223.dresearch-fe.de ([217.92.177.116])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@fensuse.internal.dresearch-fe.de>)
	id 1TA0RC-0001MZ-2J for openembedded-devel@lists.openembedded.org;
	Fri, 07 Sep 2012 17:25:42 +0200
Received: from fensuse.internal.dresearch-fe.de
	(fensuse.internal.dresearch-fe.de [172.29.23.6])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id 9BB40E00C1;
	Fri,  7 Sep 2012 15:04:36 +0000 (UTC)
Received: by fensuse.internal.dresearch-fe.de (Postfix, from userid 1000)
	id CA3F97021C9; Fri,  7 Sep 2012 17:04:35 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Tom Rini <tom.rini@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Fri,  7 Sep 2012 17:04:29 +0200
Message-Id: <cover.1347029881.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
Subject: [2011.03-maintenance 0/1] pull request 20120907
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
X-List-Received-Date: Fri, 07 Sep 2012 15:25:42 -0000

Hi Tom,

please pull this commit into 2011.03-maintenance branch.
It fixes a build problem with llvm2.7.

Thx,
Steffen

The following changes since commit 3b1d1112a9a80aba8dbee8b7bd54fe83a1acc6a1:

  gtk+_2.20.1: Depend on gdk-pixbuf-native (2012-08-31 14:06:28 -0700)

are available in the git repository at:

  git://github.com/sledz/oe pull-request-1
  https://github.com/sledz/oe/tree/pull-request-1

Steffen Sledz (1):
  llvm2.7: provide "lseek64" symbol

 recipes/llvm/llvm2.7/r137567-lseek64.patch |   23 +++++++++++++++++++++++
 recipes/llvm/llvm2.7_2.7.bb                |    3 ++-
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 recipes/llvm/llvm2.7/r137567-lseek64.patch

-- 
1.7.10.4



