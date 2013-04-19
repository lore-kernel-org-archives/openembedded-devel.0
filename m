Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UT8Uu-0000xN-Sc
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Apr 2013 12:24:56 +0200
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Apr 2013 11:07:10 +0100
Message-Id: <1366366032-8581-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.2.1
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [PATCH 0/2 v4] php: add PACKAGECONFIG options
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
X-List-Received-Date: Fri, 19 Apr 2013 10:25:13 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

This change is on top of Marcin's PHP 5.4.14 upgrade

Jack Mitchell (2):
  php: add sqlite3 and mysql PACKAGECONFIG options
  php: remove non-existant configure flags and improve current ones

 meta-oe/recipes-devtools/php/php.inc | 38 +++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 14 deletions(-)

-- 
1.8.2.1



