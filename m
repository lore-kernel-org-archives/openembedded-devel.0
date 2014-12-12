Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 622C87237A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Dec 2014 09:58:43 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id l15so1946407wiw.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Dec 2014 01:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=m9yegnwZdOzhQuSKNe9Qz6W6zBGn7Ghj+TezeNY3ZZ8=;
	b=lc5h9w7Y50STQXtQrqN6z2u/C0+aU+fh9nJHgvNymh+zeBqNfn1fCAqBUNQlT+cLj0
	rljyLLtNsoC6ZDWF1RJYYQyRJonpJ97MpUYZR6Bv4MKKn8XbdhqOK3gEUfXTfwtmcn7K
	fwXueSmlpViRIbq8eTH9L4vyMoIK7F5570KTSA0TBDIR/l2ufRDLPfJwN3jnaOG0FTcp
	lZYVsMmR5lk8UQApsD+u6bwOcepP475tJJ40bW2mUpxxcOymZ13+qkjhlR90HX6AkuPV
	vuAmINmC70iLiTek17NTx4wMLmoMgWp7qiDgOJMel1bwJzx4LTxALSbh/gAXZ8fSBiyN
	UUYw==
X-Received: by 10.181.13.7 with SMTP id eu7mr6193918wid.72.1418378324033;
	Fri, 12 Dec 2014 01:58:44 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id td6sm1382589wic.15.2014.12.12.01.58.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Dec 2014 01:58:43 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Dec 2014 10:58:36 +0100
Message-Id: <1418378316-26412-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH][meta-qt5] qttools-native 5.4.0: align source checksums
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Dec 2014 09:58:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qttools-native_5.4.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-qt/qt5/qttools-native_5.4.0.bb b/recipes-qt/qt5/qttools-native_5.4.0.bb
index 3efed85..f9384e9 100644
--- a/recipes-qt/qt5/qttools-native_5.4.0.bb
+++ b/recipes-qt/qt5/qttools-native_5.4.0.bb
@@ -1,5 +1,5 @@
 require qt5-${PV}.inc
 require ${PN}.inc
 
-SRC_URI[md5sum] = "9074cc89bc52aea7f76a4d231d2f0ef6"
-SRC_URI[sha256sum] = "5d39cdc63d43ae1f954517e517d9a5c24f2b2c91e22dab3ae6b5b81deb49983e"
+SRC_URI[md5sum] = "3de5923257b365526856094d7da0ad85"
+SRC_URI[sha256sum] = "5a85a096ffd30463781dc3871ad9640a510eba0086188c7943d23adc3660741a"
-- 
1.8.3.1


