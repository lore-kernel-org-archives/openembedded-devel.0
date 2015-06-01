Return-Path: <aguirre.nicolas@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id AEF4D7579E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jun 2015 06:41:16 +0000 (UTC)
Received: by wgbgq6 with SMTP id gq6so105528606wgb.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 May 2015 23:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CDEW/xvyplz7NKHSlDoyrvWN6xLyerTcSWfvuEYBFqw=;
	b=W974ohEhexLSRH4+BjkFFY3LuTeKfDkzS2+TCnvBO058gLglNcfPjduOzE/Ea9pDNY
	A+f+YvMAtQYgKumSRb518MjeNiM99mmdZGNxB5aV6Qpgi2m1XpEU+nPQEZePfwQv8n3u
	yJO9yD+Ug2Mtwn2p3pGlDwFgkPu2HrN+IaZnrbZ81ydYmY/wG+vt8NDR1hIHZxApQ75a
	44IF9rBN2ELbGoEQzk3BLtOjii3aE9IGaY3t7qe1p2ygy1SRkm3MkUcBB9AGohgTKNqh
	irUD+nDabd2qNrbuHPK15njjnL6je2Vh6bQ1nyaQi46VDTt/JOTnX5t3HGuV5Jh9aH3l
	WMaQ==
X-Received: by 10.180.88.169 with SMTP id bh9mr18298442wib.6.1433140876436;
	Sun, 31 May 2015 23:41:16 -0700 (PDT)
Received: from localhost.localdomain (74.243.118.80.rev.sfr.net.
	[80.118.243.74])
	by mx.google.com with ESMTPSA id c3sm13388993wja.3.2015.05.31.23.41.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 31 May 2015 23:41:15 -0700 (PDT)
From: Nicolas Aguirre <aguirre.nicolas@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Jun 2015 08:41:07 +0200
Message-Id: <1433140867-1089-2-git-send-email-aguirre.nicolas@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1433140867-1089-1-git-send-email-aguirre.nicolas@gmail.com>
References: <1433140867-1089-1-git-send-email-aguirre.nicolas@gmail.com>
Subject: [meta-oe][PATCH 2/2] libsic++-2.0: bump version to 2.4.1
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
X-List-Received-Date: Mon, 01 Jun 2015 06:41:16 -0000

---
 .../{libsigc++-2.0_2.2.11.bb => libsigc++-2.0_2.4.1.bb}             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-core/libsigc++-2.0/{libsigc++-2.0_2.2.11.bb => libsigc++-2.0_2.4.1.bb} (67%)

diff --git a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.2.11.bb b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.4.1.bb
similarity index 67%
rename from meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.2.11.bb
rename to meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.4.1.bb
index 546305f..b3e0e60 100644
--- a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.2.11.bb
+++ b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.4.1.bb
@@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
 DEPENDS = "mm-common"
 
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.2/libsigc++-${PV}.tar.xz"
-SRC_URI[md5sum] = "815d0c6d61601f51bbcaeef6826606b0"
-SRC_URI[sha256sum] = "9834045f74f56752c2c6b3cdc195c30ab8314ad22dc8e626d6f67f940f1e4957"
+SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.4/libsigc++-${PV}.tar.xz"
+SRC_URI[md5sum] = "55945ba6e1652f89999e910f6b52047c"
+SRC_URI[sha256sum] = "540443492a68e77e30db8d425f3c0b1299c825bf974d9bfc31ae7efafedc19ec"
 
 S = "${WORKDIR}/libsigc++-${PV}"
 
-- 
1.9.1


