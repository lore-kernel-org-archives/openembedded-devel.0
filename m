Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1So0Yy-0000v1-Da
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jul 2012 01:06:48 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 4C587EA042;
	Mon,  9 Jul 2012 01:00:56 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id CE206604CC; Mon,  9 Jul 2012 00:55:35 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Jul 2012 00:55:33 +0200
Message-Id: <1341788135-14072-1-git-send-email-apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: [oe-classic][PATCH 0/2] add new mirrors to mirrors.bbclass
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
X-List-Received-Date: Sun, 08 Jul 2012 23:06:48 -0000

Hello,

The source packages binutils_2.21 and libpam_1.1.1 were not found on
any of the specified mirrors, so I added a couple of mirrors to the
list.

The two patches that come as a follow-up of this message is what it's
all about.

Apelete Seketeli (2):
  mirrors.bbclass: add new GNU_MIRROR
  mirrors.bbclass: add new KERNELORG_MIRROR

 classes/mirrors.bbclass |    2 ++
 1 file changed, 2 insertions(+)

-- 
1.7.10



