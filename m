Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RXrse-0004Wz-Qr
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 11:04:08 +0100
Received: by mail-ey0-f175.google.com with SMTP id c1so1374062eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2011 01:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=QmH/DfGYVAl12+69WmLo86yLsG7Kxop3zzaHW+Lf2Fw=;
	b=n/y1rOtcNHrWEUvHdgY4XMUEPeduseajS+p/u2KR1K8wgHgTcR2oB3Km1lSRb3xAGf
	qK2lJ6cZq46D+k57glLFYU7/TUctnMJiL82963YJzkEWAnCmmb8pzmrvmZ59tjmLaVqc
	23CNfVnfGlidxOeGtoT4Xq0o2gX/nH5wGNQcY=
Received: by 10.213.27.74 with SMTP id h10mr2150111ebc.72.1323165443654;
	Tue, 06 Dec 2011 01:57:23 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 58sm64579750eet.11.2011.12.06.01.57.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 01:57:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Dec 2011 10:57:00 +0100
Message-Id: <afdc12df305d22c372df0202f576cc3f85860b1a.1323165311.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <cover.1323165311.git.Martin.Jansa@gmail.com>
References: <cover.1323165311.git.Martin.Jansa@gmail.com>
Subject: [PATCH][meta-efl 01/16] e-base: bump EFL_SRCREV for beta
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
X-List-Received-Date: Tue, 06 Dec 2011 10:04:08 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index d9c2275..05997bd 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -2,7 +2,7 @@ HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 
 # usually tracks svn trunk HEAD
-EFL_SRCREV ?= "65428"
+EFL_SRCREV ?= "65690"
 # revision when 1.0.0 was released, for recipes which don't need rebuild so often
 EFL_SRCREV_1.0.0 ?= "56356"
 
-- 
1.7.8



