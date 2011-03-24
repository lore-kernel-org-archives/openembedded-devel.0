Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q2hXI-0002Ql-Lv
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 11:13:00 +0100
Received: by bwz10 with SMTP id 10so7237376bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 03:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=jwSxP9yhSBJtyQECDwaajSFBy8lcSB6jNa94manFRQs=;
	b=D6Kx9MLR/vrL+KmqNaoTNnQTIjTqWmWRKgNsfIGno6ojjkh2xIReWp1jbhl4xjnm+K
	P1k6fiHa8QdJ5TJrx1w1bX4xsSTicsurplq18RGCPRICBkiIe80kjCedPzmuWCY3c18f
	mfOXkqcI+YstNUghdGNP0A7hw2o7u+A9GSqTQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=a0p8TV3D4ctgm4cw1npMXxAt+CLW/Fo9XmOFU+TL8tPZuFBPICl1Dzx1ASgvb5gWJL
	DAXLl2vKmRZnSzkpXIZz2RRhiZm7P9/jZNYkHhm05AYHs4xG1CdbEIG2d3bXXr//tMmS
	90v7PFqQTnPb/kr9TubfKBG36NPEgMjLSUeYo=
Received: by 10.204.133.91 with SMTP id e27mr2343779bkt.23.1300961468433;
	Thu, 24 Mar 2011 03:11:08 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id t1sm6585697bkx.7.2011.03.24.03.11.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Mar 2011 03:11:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Mar 2011 11:11:01 +0100
Message-Id: <d1e04582aa858b7264808dfdeb7bfa689f0e4add.1300961186.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1300961186.git.Martin.Jansa@gmail.com>
References: <cover.1300961186.git.Martin.Jansa@gmail.com>
Subject: [PATCH 3/7] eina: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 24 Mar 2011 10:13:01 -0000

---
 meta-efl/recipes-efl/efl/eina.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/eina.inc b/meta-efl/recipes-efl/efl/eina.inc
index 621cc9e..c3f654d 100644
--- a/meta-efl/recipes-efl/efl/eina.inc
+++ b/meta-efl/recipes-efl/efl/eina.inc
@@ -1,5 +1,6 @@
 DESCRIPTION = "Eina is the Enlightenment data library"
-LICENSE = "LGPL"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=723bb07e0e90220fe8f03924969e5f4e"
 
 BBCLASSEXTEND = "native"
 INC_PR = "r0"
-- 
1.7.4.1



