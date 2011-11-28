Received: from pd95cb174.dip0.t-ipconnect.de ([217.92.177.116] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1RUz9s-0002CL-EC
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 12:14:00 +0100
Received: by localhost (Postfix, from userid 1000)
	id 335BC44A5F5; Mon, 28 Nov 2011 12:07:22 +0100 (CET)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Nov 2011 12:07:01 +0100
Message-Id: <1322478424-22419-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1322146025-21514-1-git-send-email-sledz@dresearch-fe.de>
References: <1322146025-21514-1-git-send-email-sledz@dresearch-fe.de>
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: [PATCH v2 0/3] gypsy update and fix
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
X-List-Received-Date: Mon, 28 Nov 2011 11:14:00 -0000

This is the update patch set according to the annotations of Paul Menzel.

Steffen Sledz (3):
  gypsy: fix packaging of DBus starter script
  gypsy: move generic SRC_URI part to gypsy.inc
  gypsy: update to latest upstream version 0.8, and remove version 0.7

 recipes/gypsy/gypsy.inc    |    6 +++++-
 recipes/gypsy/gypsy_0.7.bb |   10 ----------
 recipes/gypsy/gypsy_0.8.bb |    6 ++++++
 3 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 recipes/gypsy/gypsy_0.7.bb
 create mode 100644 recipes/gypsy/gypsy_0.8.bb

-- 
1.7.7



