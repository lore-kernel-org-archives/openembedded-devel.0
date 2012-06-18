Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SgjxB-00024w-19
	for openembedded-devel@openembedded.org; Mon, 18 Jun 2012 23:57:45 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 7E9C8EA040;
	Mon, 18 Jun 2012 23:54:52 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id E5BCB604DE; Mon, 18 Jun 2012 23:47:01 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@openembedded.org, Martin Jansa <martin.jansa@gmail.com>,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>
Date: Mon, 18 Jun 2012 23:46:33 +0200
Message-Id: <1340055995-14534-1-git-send-email-apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10
Subject: [PATCH 0/2] Update package SRC_URI
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
X-List-Received-Date: Mon, 18 Jun 2012 21:57:45 -0000

Hello,

The attached patches update the SRC_UI of both acl and attr packages,
since the mirror.its.uidaho.edu repository seems to be down.
The patches are intended for oe-classic.

Apelete Seketeli (2):
  acl: Updates SRC_URI to download.savannah.gnu.org
  attr: Updates SRC_URI to download.savannah.gnu.org

 acl_2.2.49.bb  |    2 +-
 attr_2.4.44.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)



