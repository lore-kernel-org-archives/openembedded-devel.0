Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1USTN9-00019g-8W
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Apr 2013 16:30:20 +0200
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Apr 2013 15:10:38 +0100
Message-Id: <1366207839-3620-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.2
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [meta-oe][PATCH] php add PACKAGECONFIG options
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
X-List-Received-Date: Wed, 17 Apr 2013 14:30:30 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

This change is on top of Marcin's PHP 5.4.14 upgrade

Jack Mitchell (1):
  php: add sqlite3 and mysql PACKAGECONFIG options

 meta-oe/recipes-devtools/php/php.inc | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

-- 
1.8.2



