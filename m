Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id CD17477FC5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 May 2017 21:30:09 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id r58so23936105qtb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 May 2017 14:30:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8x/BAxG4KjXqg/hwGt720GIvxRToGvvs3EcrR4O7i0k=;
	b=l5PNv9mJwvFHG7PYdW14Taeeu5/BonkjRZAGnSDnllcGEVsaD/Fp0QAc8csDJ4pZaK
	DdQoj3hWpgqVd8cXS8nUBW4V8zMnTg2I1m6UrENF3UE9y0WXc4Wjda3MHeJHv1R3mQcr
	Cqu9hhrM3N+hrxwwrYKaFtCwWtGyjc2YIrEjwF3Qd8Hq/SPrZ1q9x+8mtDERd6Iv+tBk
	+h2Nn4ah4j7PF56MAHt/0LZz722v2ZL5JhUosP/nKR67CvpaywtXFtcdJePG49HFnuPo
	COakHgnzOQd/31WIXNGyu9/GFfpBIt3vJIgLv2vnYZ/lcuv47F/kvYteD5SqXgmkmYAt
	uVig==
X-Gm-Message-State: AODbwcCyoF9bYi1+QedkA2CSz/gnG7vzi3Lk/ci3ymyjW3zYXzW1vDK9
	WzhuypLyREyl8MHKs7E=
X-Received: by 10.237.63.168 with SMTP id s37mr31696709qth.61.1495575011030;
	Tue, 23 May 2017 14:30:11 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4]) by smtp.gmail.com with ESMTPSA id
	l36sm1283758qtl.32.2017.05.23.14.30.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 May 2017 14:30:10 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 May 2017 17:30:04 -0400
Message-Id: <1495575004-16418-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-perl][PATCH] libdevel-globaldestruction-perl: update to version 0.14
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
X-List-Received-Date: Tue, 23 May 2017 21:30:11 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...struction-perl_0.13.bb => libdevel-globaldestruction-perl_0.14.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libdevel/{libdevel-globaldestruction-perl_0.13.bb => libdevel-globaldestruction-perl_0.14.bb} (82%)

diff --git a/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.13.bb b/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.14.bb
similarity index 82%
rename from meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.13.bb
rename to meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.14.bb
index 1a593cf..0ce2424 100644
--- a/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.13.bb
+++ b/meta-perl/recipes-perl/libdevel/libdevel-globaldestruction-perl_0.14.bb
@@ -10,8 +10,8 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README;beginline=53;endline=55;md5=935dadb9423774f53548e5cd5055d41a"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Devel-GlobalDestruction-${PV}.tar.gz"
-SRC_URI[md5sum] = "e7be00040827e204b2b6cba2f3166074"
-SRC_URI[sha256sum] = "b29824dc0d322e56da325f05185367eb443694716010b36693dd52ffbe8ec462"
+SRC_URI[md5sum] = "24221ba322cf2dc46a1fc99b53e2380b"
+SRC_URI[sha256sum] = "34b8a5f29991311468fe6913cadaba75fd5d2b0b3ee3bb41fe5b53efab9154ab"
 
 S = "${WORKDIR}/Devel-GlobalDestruction-${PV}"
 
-- 
2.7.4


