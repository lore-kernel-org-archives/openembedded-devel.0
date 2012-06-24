Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1Simpo-0003nw-Ly
	for openembedded-devel@openembedded.org; Sun, 24 Jun 2012 15:26:36 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id CDB2FEA040;
	Sun, 24 Jun 2012 15:22:53 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 8A561604DE; Sun, 24 Jun 2012 15:15:46 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@openembedded.org
Date: Sun, 24 Jun 2012 15:15:46 +0200
Message-Id: <1340543746-15982-1-git-send-email-apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: [oe-classic][PATCH 0/1] bluez4: update checksum values
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
X-List-Received-Date: Sun, 24 Jun 2012 13:26:37 -0000

Hello,

The checksum values reported in the bluez4_4.42.bb recipe do not match
the actual values of the source package.
The patch that follows fixes that, and is targeting oe-classic.

Apelete Seketeli (1):
  bluez4: update checksum values

 recipes/bluez/bluez4_4.42.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.10



