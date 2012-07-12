Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SpOy4-0003zD-MO
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Jul 2012 21:22:43 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 743EEEA04B;
	Thu, 12 Jul 2012 21:16:02 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 6041760297; Thu, 12 Jul 2012 21:11:16 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Jul 2012 21:11:14 +0200
Message-Id: <1342120276-15557-1-git-send-email-apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10.4
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: [oe-classic][PATCH 0/2] tzcode/tzdata: update SRC_URI
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
X-List-Received-Date: Thu, 12 Jul 2012 19:22:54 -0000

Hello,

The official repository of the time zone database was shut down on
2011-10-06, so the corresponding recipes needed to be updated to fetch
the time zone source packages from alternative mirrors.

The two patches that come as follow up of this message is what it's
all about.

Apelete Seketeli (2):
  tzcode: update SRC_URI
  tzdata: update SRC_URI

 recipes/tzcode/tzcode-native.inc |    4 ++--
 recipes/tzdata/tzdata.inc        |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.7.10.4



