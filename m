Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Szpko-0003Mh-AZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:59:54 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1221497wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=rOufUiRmFNyfrxNwTzGDMpflaL5YqB7XHzp+wzOjyhE=;
	b=B5fQaIyfNftwPghZ/rRiImxwdN6PCjhduTTBYClzfoFQNy0RHLWP9i1gHvsbblDeyD
	V4Hla03vocovJvrk+GYhYHl4w+DwxxnK6eRMd4WGCrnSgFLE5NS3JMT17HYP3xYCRoRx
	9ShGdcqxeZnchRUkGfBSO6HDfLhsjot/M5LPLx5XIs5R00XtT35u5SvCO2nCXIv+dpsV
	U3qQpPb8PhBDv3sRQFnkrdywEw5rGxgByP3+cIAXjE0R+wufl1t3yDknZ1mqtWkkG527
	Y4FmkwA+z2Ns3zHsHxiZVSBFttj0RQzU4BEdrOQ13jjU6xmhZAcupVaVP3hS62m10J/6
	yu0g==
Received: by 10.180.102.136 with SMTP id fo8mr6150924wib.19.1344606486907;
	Fri, 10 Aug 2012 06:48:06 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id dc3sm7843050wib.7.2012.08.10.06.48.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:48:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:27 +0200
Message-Id: <5fda029eb9f251f508e16268d6c6ccec9184381e.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 32/46] enjoy: update LIC_FILES_CHKSUM, typos fixed in r74611
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
X-List-Received-Date: Fri, 10 Aug 2012 13:59:54 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/enjoy_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/enjoy_svn.bb b/meta-efl/recipes-efl/e17/enjoy_svn.bb
index 470f03d..06998cf 100644
--- a/meta-efl/recipes-efl/e17/enjoy_svn.bb
+++ b/meta-efl/recipes-efl/e17/enjoy_svn.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Enjoy music player"
 LICENSE = "LGPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0f507c68d42d1cc0fcb507d007112bf2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
 DEPENDS = "evas ecore edje elementary emotion lightmediascanner"
 SRCREV = "${EFL_SRCREV}"
 PV = "0.0+svnr${SRCPV}"
-- 
1.7.8.6



