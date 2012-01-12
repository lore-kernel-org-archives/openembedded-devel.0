Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RlHMS-0007c4-E0
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Jan 2012 10:54:20 +0100
Received: by mail-ey0-f175.google.com with SMTP id o13so522504eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2012 01:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=zaPLAxuPXOUB/ID+Uqxku60drC9sMS96VyUshhLzujw=;
	b=DhfapFRaUBmbgO17HaELB52Oi97QIlbuZaI+S+qZ9YCOXacG0GQXaVY00casP+03Ca
	oRxL8AJMfRR2ePowlMls5QkX12dpVDWiOpAm00CNdym+iW72UIZTs2Bzx7dr5hKXYkq3
	4rhThxTJ8TojsEAy1eAIgpBGAdGm/rT8HetkE=
Received: by 10.213.31.76 with SMTP id x12mr671688ebc.45.1326361611865;
	Thu, 12 Jan 2012 01:46:51 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s16sm17466439eef.2.2012.01.12.01.46.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jan 2012 01:46:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Jan 2012 10:46:17 +0100
Message-Id: <76bea3d19a9fa6f2c8a85ca0644c825a8ef415d2.1326361490.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.3
In-Reply-To: <0796505f34620059cfed707c33f08b68f346937f.1326361490.git.Martin.Jansa@gmail.com>
References: <0796505f34620059cfed707c33f08b68f346937f.1326361490.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1326361490.git.Martin.Jansa@gmail.com>
References: <cover.1326361490.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 3/7] emotion: update LIC_FILES_CHKSUM, COPYING file was cleaned to match rest of EFL
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
X-List-Received-Date: Thu, 12 Jan 2012 09:54:20 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/emotion_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/emotion_svn.bb b/meta-efl/recipes-efl/efl/emotion_svn.bb
index 8b197df..dd0adf2 100644
--- a/meta-efl/recipes-efl/efl/emotion_svn.bb
+++ b/meta-efl/recipes-efl/efl/emotion_svn.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "The Enlightenment multimedia library"
 LICENSE = "MIT BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
+LIC_FILES_CHKSUM = "file://COPYING;md5=69f44058245ce5c596d56bb622d5dabd"
 # we no longer build the libxine backend, since the gstreamer backend seems more promising
 DEPENDS = "eet eeze evas ecore edje gstreamer gst-plugins-base"
 PV = "0.2.0+svnr${SRCPV}"
-- 
1.7.8.3



