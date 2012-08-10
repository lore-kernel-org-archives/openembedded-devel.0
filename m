Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Szphi-0001GZ-9n
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:56:42 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1218754wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=+kgTHOUGW7vM6QuCNZ6lGaIYPovb7DQPHNZx1lXTcNw=;
	b=yva6A7U35pCdTO/DqBpVCSk2rmPnU6uFC+ucgjim42ma8exDn1KoptJxP10gHiGTeC
	A4dvigB6A0Zkcqq+ClZPc8US24csrXuyKoEfQ8hVQDVZhImIuQwfjJ1ePgIV0kEetoNN
	lfjT49f9uEGk7CfQmMKPLc9JpmeuXI/InFcQ8HndEtp5i/HOS7f0kI2t/6OZItzDxEN7
	Iohmei2ESSW7swN5n3vwKdN2eiTEKi0hMW7fy058Le+icMJprgYD+OWJ9y/vXIkQE7v8
	XYuy6hPKFALGEdLJ3hyjLc2/EMcHwgK8ykg0FMG1/iJeSXTQOx047E1dXZAWA7WL74qF
	wncw==
Received: by 10.180.100.37 with SMTP id ev5mr6268248wib.5.1344606294873;
	Fri, 10 Aug 2012 06:44:54 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id el6sm7819370wib.8.2012.08.10.06.44.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:44:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:04 +0200
Message-Id: <1ec12d8cad53e75a6260e38f3bd4fa8d0bb77233.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 09/46] e-wm: update LIC_FILES_CHKSUM
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
X-List-Received-Date: Fri, 10 Aug 2012 13:56:42 -0000

* Copyright year was updated in r73192

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/e17/e-wm_svn.bb
index 7cc2167..7cc072e 100644
--- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "The Enlightenment Window Manager Version 17"
 DEPENDS = "eet evas eina ecore edje efreet edbus eeze"
 LICENSE = "MIT BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2667a0f4120372ea91f7467cdff4095f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=76de290eb3fdda12121830191c152a7d"
 SRCNAME = "e"
 PV = "0.16.999.060+svnr${SRCPV}"
 PR = "r2"
-- 
1.7.8.6



