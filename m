Received: from pd95cbf07.dip0.t-ipconnect.de ([217.92.191.7] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1SFNMw-0003Af-OT
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Apr 2012 12:23:14 +0200
Received: by localhost (Postfix, from userid 1000)
	id 061CDC2CC0; Wed,  4 Apr 2012 12:14:03 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Tom Rini <tom.rini@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Wed,  4 Apr 2012 12:13:56 +0200
Message-Id: <cover.1333534095.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
Subject: [2011.03-maintenance 0/1] pull request 20120404
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
X-List-Received-Date: Wed, 04 Apr 2012 10:23:15 -0000

Hi Tom,

please pull this commit backported from oe-core fixing a problem with docbook-utils-native.

Thx,
Steffen

The following changes since commit 71df8a759f91e821a2daee22f34eaa3a31708775:

  python-2.6.6: Fix python-2.6.6 build failure on linux-3.x (2012-03-27 13:08:38 +0200)

are available in the git repository at:
  git://github.com/sledz/oe pull-request-1
  https://github.com/sledz/oe/tree/pull-request-1

Steffen Sledz (1):
  docbook-utils-native: fix syntax problem in jw.in

 .../docbook-utils/docbook-utils-0.6.14/re.patch    |   29 ++++++++++++++++++++
 .../docbook-utils/docbook-utils-native_0.6.14.bb   |    8 ++++-
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 recipes/docbook-utils/docbook-utils-0.6.14/re.patch

-- 
1.7.7



