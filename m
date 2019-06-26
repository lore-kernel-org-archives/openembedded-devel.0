Return-Path: <uol@pengutronix.de>
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id ECEDC6C106
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jun 2019 23:23:59 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1hgHGi-00026U-AN; Thu, 27 Jun 2019 01:24:00 +0200
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1hgHGh-0002MH-HD; Thu, 27 Jun 2019 01:23:59 +0200
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Jun 2019 01:23:42 +0200
Message-Id: <20190626232342.9017-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <CAP9ODKooyOFZb7fYcLGM8QRaJR2skz-xhWX+Epq1DECzNBQbOQ@mail.gmail.com>
References: <CAP9ODKooyOFZb7fYcLGM8QRaJR2skz-xhWX+Epq1DECzNBQbOQ@mail.gmail.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Subject: [meta-browser][PATCH] README: update list of maintainers
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Jun 2019 23:24:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 README | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/README b/README
index 0a005a8b5ea6..31d361d2ab41 100644
--- a/README
+++ b/README
@@ -23,13 +23,15 @@ revision: HEAD
 Contributing
 ------------
 
-To contribute to this layer you should the patches for review to the
+To contribute to this layer you should send the patches for review to the
 OpenEmbedded dev mailing list openembedded-devel@lists.openembedded.org
 and please cc the maintainers.
 
-Maintainers: Eric Bénard <eric@eukrea.com>
-             Denis Carikli <denis@eukrea.com>
+Maintainers: Fabio Berton <fabio.berton@ossystems.com.br>
+             Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
+             Khem Raj <raj.khem@gmail.com>
              Otavio Salvador <otavio@ossystems.com.br>
+             Maksim Sisov <msisov@igalia.com>
 
 When sending single patches, please use something like :
 git send-email -1 -s --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-browser][PATCH'
-- 
2.20.1


