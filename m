Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id DAF5677F70
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 01:00:14 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id q66so7263383qki.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Aug 2017 18:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zp+DRgBriv3RpZcaNle44L5gZrG7CwUFOm9+Ga7NLSI=;
	b=VT5TGR31zC3aNC0SJLD+RfcqYweoL3DQZtURaJ2z0bnz1FqdAYLqKPJRs5MGMn/i+R
	r8XVR+jIRZcplzEH2Fu3YuRYiE/klW9macrP0/3Le0dvNGiSKFXUwz3jNopgSB9RP7rN
	iNOx5Yt66RaEYFP7O09oYi9nFyBCIsV5bUOB7weYjYJ4D9O6w+hT0A6KFiAz5xZrVvpS
	77MaVPqqTEAX+piTqb/CriSnZzDBbetBNi8vKnrKw/9XLPRgVjG5fInmOuU6tWgnpwhA
	3079TA6Em9Xs8Rb5ZiunUmD0VXcjdcpJ8uyW3YnpqPkUq0KwpbReyhu/KUNc/8fq4Wim
	eOYg==
X-Gm-Message-State: AHYfb5j3x1pl28LYNaYqeeTl7HYawH3ckarSUI8X7FjH+1wYwYq7uQv8
	qwkho2t3+2R7x8pxG1w=
X-Received: by 10.55.220.3 with SMTP id v3mr5312779qki.102.1502326815379;
	Wed, 09 Aug 2017 18:00:15 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id p1sm2750910qke.16.2017.08.09.18.00.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Aug 2017 18:00:14 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Aug 2017 21:00:07 -0400
Message-Id: <1502326807-29929-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-typing: update to version 3.6.2
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
X-List-Received-Date: Thu, 10 Aug 2017 01:00:15 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-typing.inc                 | 4 ++--
 .../python/{python-typing_3.6.1.bb => python-typing_3.6.2.bb}         | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-typing_3.6.1.bb => python-typing_3.6.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-typing.inc b/meta-python/recipes-devtools/python/python-typing.inc
index 12b7d15..46be47c 100644
--- a/meta-python/recipes-devtools/python/python-typing.inc
+++ b/meta-python/recipes-devtools/python/python-typing.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/python/typing"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64fc2b30b67d0a8423c250e0386ed72f"
 
-SRC_URI[md5sum] = "3fec97415bae6f742fb3c3013dedeb89"
-SRC_URI[sha256sum] = "c36dec260238e7464213dcd50d4b5ef63a507972f5780652e835d0228d0edace"
+SRC_URI[md5sum] = "143af0bf3afd1887622771f2f1ffe8e1"
+SRC_URI[sha256sum] = "d514bd84b284dd3e844f0305ac07511f097e325171f6cc4a20878d11ad771849"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-typing_3.6.1.bb b/meta-python/recipes-devtools/python/python-typing_3.6.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-typing_3.6.1.bb
rename to meta-python/recipes-devtools/python/python-typing_3.6.2.bb
-- 
2.7.4


