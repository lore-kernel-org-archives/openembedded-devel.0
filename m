Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UWoKn-0006I5-TR
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Apr 2013 15:41:38 +0200
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Apr 2013 14:23:39 +0100
Message-Id: <1367241822-9111-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.2.2
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [meta-oe][PATCH 0/3] php: further clean-ups
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
X-List-Received-Date: Mon, 29 Apr 2013 13:41:55 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

Few more PHP clean-up patches, some testing on more esoteric hardware would
be nice, but I don't forsee any problems (famous last words...).

Jack Mitchell (3):
  php: remove obsolete CFLAGS
  php: remove unnecessary LIBS export
  php: remove unneeded THREADS export

 meta-oe/recipes-devtools/php/php.inc | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

-- 
1.8.2.2



