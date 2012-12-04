Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi8h-0005OA-7J
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:21:41 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1927519eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=gfm1Pkzn3ee4pDN4+IWERGKEOy/zQLpPKRgNiPdfIcc=;
	b=Aty4jpI0urWuorp1Pp9RO7NTxU6y13WVD/YRaOzVHRSUyvz7g4q2lxVMWLcO3WwCOD
	ASukAR60hHkhxYE4CnaIU+m8s0l4k3pCF2fuWKVENGfpP1CsP/RMlfEap7k4LiGyGyzk
	d+IZykMerxDNNeIxPOXKvTgYRPgwHpkN+mi12dBJ9AewdZzdtg95c5V2FJ1f+VvpbZEi
	ViwD8/uxO1h9Jr8uahydKrO2bPgwqp6nWXZDKYCie6os73QUIfXcHHeClzoxd7RuOXAQ
	etcamU0ec1A7hYaJZjrCU2rFhgiI8qI2qAfQHVAVwk8gJUwjtMAAtcqJLLHbSxBXx83p
	vVbg==
Received: by 10.14.216.70 with SMTP id f46mr42634745eep.12.1354586837578;
	Mon, 03 Dec 2012 18:07:17 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w3sm34847697eel.17.2012.12.03.18.07.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:07:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:59:30 +0100
Message-Id: <4ce0a4e3663458d2193b7c2ce67cf13d8a4acf70.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 57/58] eject: drop 2nd LICENSE field
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
X-List-Received-Date: Tue, 04 Dec 2012 02:21:42 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/eject/eject_2.1.5.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-oe/recipes-support/eject/eject_2.1.5.bb b/meta-oe/recipes-support/eject/eject_2.1.5.bb
index 0373d23..3f17fe8 100644
--- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
+++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
@@ -1,11 +1,8 @@
 DESCRIPTION = "Eject allows removable media (typically a CD-ROM, floppy disk, tape, or JAZ or ZIP disk) to be ejected under software control."
 HOMEPAGE = "http://eject.sourceforge.net/"
 LICENSE = "GPLv2"
-
-LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-
 inherit autotools gettext update-alternatives
 
 SRC_URI = "http://sources.openembedded.org/${P}.tar.gz"
-- 
1.8.0



