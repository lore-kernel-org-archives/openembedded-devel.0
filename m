Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4C93677589
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Mar 2017 15:27:10 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id o4so1813157ywd.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Mar 2017 07:27:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bw3RLILY9W0qQV0sALT2Cart6bgrOlRlw637QMsNOOk=;
	b=JlN+YXHqp53FtLnRAS7em/phjUbmaidiRbnFYGlwtll+Y/ZNQyv7DXQ6vSjHg+Zn5y
	+BesvzaUrxRbwxKv8IVbIMzdnx5E+sEarXX1YFz3s4tMR/5k0ZiS1Q/rNMfCaKLk214X
	vE5UvbQSKMMQg7Lfah4JwOZo020BA1vhwg8gdnOCE0ZdLrc7fa/iTbFODqPFd2kQ7vGA
	mvskAsFATJBVJA7t+eiPzihHSo9OQ09W/j12ceq+JecOjuSXDSEAnC/YTDYIgCfrEbYf
	PNlLuMF5jwgraR9egxXCVcVGbAQnBjXUOwbzLD24GDJY+7VzWpTlylyU3mfQtxU8wPln
	rnhw==
X-Gm-Message-State: AMke39nLdx6jt2TYkLEcD9i+r3MXg83bZAwKyJhEah2pZM5SfuLE3NtUOdVdkuc+j0Uxgg==
X-Received: by 10.200.35.250 with SMTP id r55mr1893369qtr.280.1488814032098;
	Mon, 06 Mar 2017 07:27:12 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	r83sm11377523qki.51.2017.03.06.07.27.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Mar 2017 07:27:11 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Mar 2017 10:27:03 -0500
Message-Id: <1488814023-6056-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-perl][PATCH] libcgi-perl: update to version 4.35
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
X-List-Received-Date: Mon, 06 Mar 2017 15:27:11 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-perl/libcgi/{libcgi-perl_4.28.bb => libcgi-perl_4.35.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcgi/{libcgi-perl_4.28.bb => libcgi-perl_4.35.bb} (82%)

diff --git a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.28.bb b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.35.bb
similarity index 82%
rename from meta-perl/recipes-perl/libcgi/libcgi-perl_4.28.bb
rename to meta-perl/recipes-perl/libcgi/libcgi-perl_4.35.bb
index 20626d2..4fa3429 100644
--- a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.28.bb
+++ b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.35.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2e9769f0a2613a98bc7fce15dee0c533"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/L/LE/LEEJO/CGI-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "28efb391377f6e98c19c23292d5fcc8c"
-SRC_URI[sha256sum] = "1297d3ed6616cacb4eb57860e3e743f3890111e7a63ca08849930f42f1360532"
+SRC_URI[md5sum] = "15e63942c02354426b25f056f2a4467c"
+SRC_URI[sha256sum] = "0b34cdc59f596632b0620939286f6e18e7e81d043b6b57b974a8e07d18b5fc1d"
 
 S = "${WORKDIR}/CGI-${PV}"
 
-- 
2.7.4


