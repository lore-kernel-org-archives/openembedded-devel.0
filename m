Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1QJKxe-0004oW-Fe
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 09:32:58 +0200
Received: from [2001:638:602:1183:4da:ff61:f5c:b7b4] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1QJKv0-0007d5-Ke by authid <stefan@sostec.de> with srv_auth_cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2011 09:30:16 +0200
Received: from stefan by excalibur.local with local (Exim 4.75)
	(envelope-from <stefan@excalibur.local>) id 1QJKuz-00012d-0E
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 09:30:13 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 May 2011 09:30:12 +0200
Message-Id: <5b9d550f6154301c5926b31c798fa93eb150a1a7.1304925139.git.stefan@buglabs.net>
X-Mailer: git-send-email 1.7.5.1
In-Reply-To: <cover.1304925139.git.stefan@buglabs.net>
References: <cover.1304925139.git.stefan@buglabs.net>
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: [PATCH 2011.03-maintenance 5/7] inetlib: move to proper place
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
X-List-Received-Date: Mon, 09 May 2011 07:32:58 -0000

From: Henning Heinold <h.heinold@tarent.de>

Signed-off-by: Stefan Schmidt <stefan@buglabs.net>
---
 .../inetlib-1.1.1/datadir_java.patch               |    0
 recipes/{classpath => classpathx}/inetlib_1.1.1.bb |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename recipes/{classpath => classpathx}/inetlib-1.1.1/datadir_java.patch (100%)
 rename recipes/{classpath => classpathx}/inetlib_1.1.1.bb (100%)

diff --git a/recipes/classpath/inetlib-1.1.1/datadir_java.patch b/recipes/classpathx/inetlib-1.1.1/datadir_java.patch
similarity index 100%
rename from recipes/classpath/inetlib-1.1.1/datadir_java.patch
rename to recipes/classpathx/inetlib-1.1.1/datadir_java.patch
diff --git a/recipes/classpath/inetlib_1.1.1.bb b/recipes/classpathx/inetlib_1.1.1.bb
similarity index 100%
rename from recipes/classpath/inetlib_1.1.1.bb
rename to recipes/classpathx/inetlib_1.1.1.bb
-- 
1.7.5.1



