Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVfTW-0000R8-2J
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 09:25:06 +0100
Received: by eekc1 with SMTP id c1so155730eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2011 00:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=2E5F5bLl1GSk/beZZk2NPm8lSkL/wr52PcVMZfayXLI=;
	b=IJ9aKklCftZ5Hxa+cVR6MDF7kGkN858jhi6to7NnBWAUfzFJO9hQVeThDtwNkzrQ4N
	d3jl4HkYDL7yv7JjWH22aPPsSZG94vwC0a6yLwyYA1esn3v0pdQK8erJAgqYRrki77AL
	vsoAV+vNXsZ0Yd/vYWwYSUT1vMtgROjbEd4Lc=
Received: by 10.14.18.132 with SMTP id l4mr124142eel.144.1322641106378;
	Wed, 30 Nov 2011 00:18:26 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z58sm3696459eea.3.2011.11.30.00.18.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 00:18:25 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2011 09:16:56 +0100
Message-Id: <8ea2d6d86320d3660470b9b9224bb41c3a268ff0.1322640506.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <55137a5d61c11567ab74d1c1382e04da35cecd5f.1322640506.git.Martin.Jansa@gmail.com>
References: <a>
	<55137a5d61c11567ab74d1c1382e04da35cecd5f.1322640506.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1322640506.git.Martin.Jansa@gmail.com>
References: <cover.1322640506.git.Martin.Jansa@gmail.com>
Subject: [meta-efl 09/11] elementary: fix license metadata
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
X-List-Received-Date: Wed, 30 Nov 2011 08:25:06 -0000

* in r65248 fix errant word 'either' in license.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/elementary_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/elementary_svn.bb b/meta-efl/recipes-efl/efl/elementary_svn.bb
index 6162abd..4051caf 100644
--- a/meta-efl/recipes-efl/efl/elementary_svn.bb
+++ b/meta-efl/recipes-efl/efl/elementary_svn.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "EFL based widget set for mobile devices"
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=cdc6c12b238ccd62635a7517dfe89438"
+LIC_FILES_CHKSUM = "file://COPYING;md5=10a051c72424b80bc784a3903651b43b"
 DEPENDS = "eet-native efreet evas ecore edje eet edbus ethumb"
 PV = "0.8.0+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
-- 
1.7.8.rc4



