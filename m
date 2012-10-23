Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TQkGL-0006u5-Nd
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Oct 2012 21:35:41 +0200
Received: by mail-gh0-f175.google.com with SMTP id z2so844982ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2012 12:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=Hsn7sJ6Hv1y45KmqXdVNhMa8GJsuATjlRvyujrPfl1Q=;
	b=l8IBqgtHq2/FFFUcIqRd1lBSkCZmwHP+CJIAqpwX6YXErIJRLUcdoJ68YjpZ5ibBAE
	J36ImnzRb7csPxgq20wWMugIcQBCYSc0Hq5cOZo9VhLdaH1McvKen5v57UcsCnv4/mVx
	hSxRo9V1czhpBcqEQ5lS6nXZyGPPxtlaGGWsw2RTRvFmlMyIHITWfEIqhnp2+AbXNy1y
	a22jzb0e57BhzedBb+WT0gWS7J5PTwVEaBigrf7uVL8yuLMVevDB5iQvjflqeHd+JJPW
	UGb6xhFuZhXB/qIqENN3kWfVyYaqGhCEMMJkLA7od7lWsKuiMQ3CU5cnFZcLJQdiWx+O
	KsKg==
Received: by 10.236.144.165 with SMTP id n25mr12815308yhj.61.1351020135078;
	Tue, 23 Oct 2012 12:22:15 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id u13sm11444414anl.5.2012.10.23.12.22.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 23 Oct 2012 12:22:13 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Oct 2012 17:22:03 -0200
Message-Id: <1351020123-22871-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1351020123-22871-1-git-send-email-otavio@ossystems.com.br>
References: <1351020123-22871-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 2/2] rage: Add license checksum
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
X-List-Received-Date: Tue, 23 Oct 2012 19:35:41 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-efl/recipes-efl/e17/rage_svn.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/rage_svn.bb b/meta-efl/recipes-efl/e17/rage_svn.bb
index 2038054..5e3d5f7 100644
--- a/meta-efl/recipes-efl/e17/rage_svn.bb
+++ b/meta-efl/recipes-efl/e17/rage_svn.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "Rage is a media center application based on EFL"
 AUTHOR = "Carsten 'The Rasterman' Haitzler"
 HOMEPAGE = "http://www.rasterman.com"
 LICENSE = "MIT BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
 DEPENDS = "emotion evas ecore edje"
 SECTION = "x11/multimedia"
 PV = "0.3.0.042+svnr${SRCPV}"
-- 
1.7.2.5



