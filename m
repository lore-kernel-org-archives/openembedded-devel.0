Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SUQO6-0003cI-8W
	for openembedded-devel@openembedded.org; Wed, 16 May 2012 00:38:38 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 37308EA040;
	Wed, 16 May 2012 00:40:49 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 3B53064387; Wed, 16 May 2012 00:28:38 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@openembedded.org,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 16 May 2012 00:27:53 +0200
Message-Id: <1337120874-17531-1-git-send-email-apelete@seketeli.net>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] libecj-bootstrap: Update package SRC_URI
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
X-List-Received-Date: Tue, 15 May 2012 22:38:38 -0000

Hello,

The attached patch updates the SRC_URI since mirrors.ibiblio.org seems
to be down. The patch is targeted at oe-classic.

Apelete Seketeli (1):
  libecj-bootstrap: Update SRC_URI to archive.eclipse.org

 recipes/ecj/libecj-bootstrap_3.6.1.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)



