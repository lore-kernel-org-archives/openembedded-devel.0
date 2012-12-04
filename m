Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi7X-00040y-HV
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:20:27 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1926936eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Btx2DtQXLfcGqfclhM82u1/uOgegt9WJANPyg91IIL4=;
	b=HvDvUsfUuHDjeUlU8EyXKTwMDKEwjUD7p/DV28sCrwB8R8V2z8E8ntyniA30N3Dyh+
	oaNrq9HPRYeNxcLoNzQ+PU7PqwEllOCnCjbmi4rD1Qx1WXUBwirkDTPyCEv2Fdm3R2BL
	NV3KTXk2kRRIMYIWU7spwgqny6mb1+l3ytRrF2ViQS8Ky4v+Z7mcHgnkcqExrELmo5zq
	SopHzbXw/E8JI3e3NvJzWfjKlY//6aWFj6L60IY1U1K6eXcgwBp60NSe+lSCct0MfgTN
	GVe0O6s27tGLG4jHdgjJm7aAvd9TLgyoTmgi0trgzu6xRcplHVCbUIAE1Jtr4SfldH1N
	lgBw==
Received: by 10.14.216.70 with SMTP id f46mr42624074eep.12.1354586767944;
	Mon, 03 Dec 2012 18:06:07 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 43sm34811978eed.10.2012.12.03.18.06.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:06:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:59:20 +0100
Message-Id: <ddf52d8f47ec2e40fd0bb1e068dd996739cf8594.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 47/58] exalt-client: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Tue, 04 Dec 2012 02:20:28 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/exalt-client_svn.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-efl/recipes-efl/e17/exalt-client_svn.bb b/meta-efl/recipes-efl/e17/exalt-client_svn.bb
index 4938900..852ed04 100644
--- a/meta-efl/recipes-efl/e17/exalt-client_svn.bb
+++ b/meta-efl/recipes-efl/e17/exalt-client_svn.bb
@@ -1,4 +1,6 @@
-LICENSE = "LGPLv2"
+LICENSE = "LGPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+
 PV = "0.0.1+svnr${SRCPV}"
 
 require e-module.inc
-- 
1.8.0



