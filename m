Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RaolB-0008EP-Gi
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Dec 2011 14:20:37 +0100
Received: by eekb15 with SMTP id b15so648926eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Dec 2011 05:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=YQ6zJx4wGsPwgFg1gAD4Kw6YpT8cUIlndHOyiB1YGJk=;
	b=KtZdq+PdP34gtiY5aPlnDSqQNPuwCeDE5T0pdTHPme8cNrM1kWHANmHtcnNOx/1gQW
	sAGi2Jcgklrho27flJHgiO7IodlP8CxrpMYgO0XNgz5jUIfTQa1M1NUrolJhUkROxp0F
	cBxbBT89c7mfVr+iwqLk4ySjP8+OY0CyGf6is=
Received: by 10.213.15.69 with SMTP id j5mr539484eba.128.1323868420718;
	Wed, 14 Dec 2011 05:13:40 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 76sm10348953eeh.0.2011.12.14.05.13.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Dec 2011 05:13:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Dec 2011 14:13:28 +0100
Message-Id: <1323868408-21946-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
Subject: [PATCH][meta-gnome] libgsf: fix LICENSE field
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
X-List-Received-Date: Wed, 14 Dec 2011 13:20:37 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb
index e9b6211..d856c6e 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "GNOME Structured File Library"
-LICENSE = "GPLv2/LGPLv2.1"
+LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dc7371b50816c96e145fa0f8ade8e24d \
                     file://COPYING.LIB;md5=61464cfe342798eeced82efe9ae55f63"
 
-- 
1.7.8



