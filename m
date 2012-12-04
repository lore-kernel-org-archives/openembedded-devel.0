Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi4D-0002l7-W1
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:17:02 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1926297eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=AwlXsHcVSNmHD4rwz3+6CINO8hMzZomVBbgr3w8SF0I=;
	b=VCmJ1Uz2/hriKOAgW8x/GekuypSE+EDMX88qlR6uWFoq4rKMCXzr/VIgi9p7Wc9E5r
	ojmEANPn+ESuVKqnlbr0y7Cz+dsTYmFEJiqI60ohMbZZ8PQaKBHoA3bV606TU+3Z92S3
	JDlXD76lyY51WIY7OdIBDyAtqxcpkJW0W5K0YKoxKfKR31SYrKgWeNpEvT7kH8acXIx1
	PSwhk55XcOV6ROh5iQqiKt/hiq3iEewEHMPIKMpakkqJWfN4+4q/q8H7o4xW/rLFlaXn
	6oPvyStwCgCi9gCNLC2K+4utXpslUybGkBp/hNdbkdEKMCIoLz8OWo8DF6dtepiLGMnf
	qOHA==
Received: by 10.14.184.134 with SMTP id s6mr42491094eem.43.1354586562276;
	Mon, 03 Dec 2012 18:02:42 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k2sm34806496eep.15.2012.12.03.18.02.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:02:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:58:55 +0100
Message-Id: <e68dabce6bcab3144a79e4aa0dfee5e44b5bd029.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 22/58] exalt: fix LICENSE and add LIC_FILES_CHKSUM
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
X-List-Received-Date: Tue, 04 Dec 2012 02:17:02 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/exalt_svn.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-efl/recipes-efl/e17/exalt_svn.bb b/meta-efl/recipes-efl/e17/exalt_svn.bb
index a5590e1..973bb67 100644
--- a/meta-efl/recipes-efl/e17/exalt_svn.bb
+++ b/meta-efl/recipes-efl/e17/exalt_svn.bb
@@ -1,7 +1,9 @@
 DESCRIPTION = "Exalt is a network manager for the windows manager Enlightenment DR17."
 HOMEPAGE = "http://watchwolf.fr/wiki/doku.php?id=exalt"
 
-LICENSE = "LGPLv2"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+
 DEPENDS = "elementary vpnc wpa-supplicant ecore eet edbus"
 RDEPENDS_${PN} = "vpnc wpa-supplicant"
 
-- 
1.8.0



