Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id A56E0780A6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 19:50:22 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id j13so10958688qta.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 12:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TR7/KYt5dEALya+tPaLy98r4z6vHAlGCEAb2HP8wTno=;
	b=RQpltCyymPQMkVbcDDQUy2EPVL2akF/RDDGTVya9gQ2gABPWeDKDAmmk9oFzqRFpop
	mDBaSiLzdQqNpr87qybfC6sY6cjCrogd2Z/5l7psnb/eYDPf8SVslnTaMi4dgB9CmNVO
	nnrC7Dt7JgZjKOTwSbtyCIN6xJ4Z8obl7cHN7jROZ0JKOiFSJRz5kenLFbpxl4wkqwvQ
	Qcb4G5MnNwJGnERT2q+GCqSZOVdTIVhFH1GG7tPNI8SayatK6xcI2zLgHrFcUzbX4z5B
	fXW268VcvZyYm2MyNDnpl6QDxJF4mmQooM760FQZ8J62rJwYvVHFhP7VFNdjB570saNw
	gGRA==
X-Gm-Message-State: AODbwcDRgYTIbC5wTVTXREOKq3BdRAvzHG4a2nWAPRvpvbnAVa/RmKnI
	pFqbUsxUCmPUCw==
X-Received: by 10.200.41.165 with SMTP id 34mr11535277qts.243.1495223423642;
	Fri, 19 May 2017 12:50:23 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224])
	by smtp.gmail.com with ESMTPSA id v1sm6310545qtg.45.2017.05.19.12.50.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 May 2017 12:50:22 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 May 2017 15:50:14 -0400
Message-Id: <1495223414-16969-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-perl][PATCH] libcgi-perl: update to version 4.36
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
X-List-Received-Date: Fri, 19 May 2017 19:50:22 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-perl/libcgi/{libcgi-perl_4.35.bb => libcgi-perl_4.36.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcgi/{libcgi-perl_4.35.bb => libcgi-perl_4.36.bb} (82%)

diff --git a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.35.bb b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.36.bb
similarity index 82%
rename from meta-perl/recipes-perl/libcgi/libcgi-perl_4.35.bb
rename to meta-perl/recipes-perl/libcgi/libcgi-perl_4.36.bb
index 4fa3429..8f26ab0 100644
--- a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.35.bb
+++ b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.36.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2e9769f0a2613a98bc7fce15dee0c533"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/L/LE/LEEJO/CGI-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "15e63942c02354426b25f056f2a4467c"
-SRC_URI[sha256sum] = "0b34cdc59f596632b0620939286f6e18e7e81d043b6b57b974a8e07d18b5fc1d"
+SRC_URI[md5sum] = "48566d81f430a7f755bb4d8f426ce35d"
+SRC_URI[sha256sum] = "fefe84d4f2461e867f9be80f3f988e17bcbbcb4e306952cf2fd1dea7e4515490"
 
 S = "${WORKDIR}/CGI-${PV}"
 
-- 
2.7.4


