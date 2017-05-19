Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 78ED7780A6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 19:42:50 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id y128so11490443qka.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 12:42:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=y3Ag1DWrp8DNI5kUOnYZJ84xpAEWHMADEXC+kzcM/Wg=;
	b=sgLG1Kgqqrb8UOfBUU+tzCq8nGYRS4eqoPV1mF0MJ3XdCkihCwaeG52MxazgsQsMl7
	W/zQqi7eYjjR7pPSUkQbbFO0sfOGcmsX/P1lQBlMzSAHxiR5/+w6tpbdt/JQc1MaOKIs
	eeCoAzjECrskYVXzGHmdYV+qTden15xQSp6IwySppfqHRRo+oHIk2gg5lmaZzVqmNdgr
	zX10hgBp9uvGR25kdSnTfrjjW5U0hwWIK2R2Qsq4WK+0FGap738L15Voe/0toD86Y6uW
	bgRGoOAxnOZjVN6WqXPEV20z3TTY8GY8HJOANd6xIygigo/yi2WPlFce212zRKnJjFZz
	DVWQ==
X-Gm-Message-State: AODbwcAg7h3FCKD9mt+//sCOqNZqnlww8PivBwQBUJMjogScRr52U4vd
	KYvbVNCdi0J4Mw==
X-Received: by 10.55.210.4 with SMTP id f4mr10668591qkj.266.1495222971500;
	Fri, 19 May 2017 12:42:51 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224])
	by smtp.gmail.com with ESMTPSA id n17sm6688527qtb.6.2017.05.19.12.42.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 May 2017 12:42:50 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 May 2017 15:42:42 -0400
Message-Id: <1495222962-9689-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-perl][PATCH] libstrictures-perl: update to version 2.000003
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
X-List-Received-Date: Fri, 19 May 2017 19:42:50 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...{libstrictures-perl_2.000002.bb => libstrictures-perl_2.000003.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libstrictures/{libstrictures-perl_2.000002.bb => libstrictures-perl_2.000003.bb} (92%)

diff --git a/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000002.bb b/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000003.bb
similarity index 92%
rename from meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000002.bb
rename to meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000003.bb
index 11a6e50..a6808d3 100644
--- a/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000002.bb
+++ b/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000003.bb
@@ -29,8 +29,8 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README;beginline=246;endline=262;md5=43be558cf4f19823cdd6af22135cf5f8"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/strictures-${PV}.tar.gz"
-SRC_URI[md5sum] = "fb1fada8260992bc85e126c21ffcc6d5"
-SRC_URI[sha256sum] = "130355dcb3afd8c3c8213c24b924e71deb7e1e1197da8f90c5ae191766aa4100"
+SRC_URI[md5sum] = "78244cfab6168dcf196370d1e2309536"
+SRC_URI[sha256sum] = "27f8ea096a521e9754d36ea32889c2cda28346d04e3e399e7ea118d182dbaf22"
 
 S = "${WORKDIR}/strictures-${PV}"
 
-- 
2.7.4


