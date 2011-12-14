Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RadTn-0004Av-UJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Dec 2011 02:17:56 +0100
Received: by mail-yw0-f47.google.com with SMTP id o47so889767yho.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2011 17:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=+n+11xtd0HOq3Q3Xv5kldcm445cQutlMxzLy0Jd420U=;
	b=L0+B5eoDh+JRvLQNL2G1IrLyOqSgeveneIRq45nbwZ9/XsE9TXL0kSihOms3DJ1KZ+
	5rMEtO45nlkZZJ1iNYfYebpBOqmEBIXcaJFiyzvF8s+R9wyj7kzr+vsQrx4d9g+4U02I
	jXLpC5pb/XPHufa8HnY/BzUaX3M/+gGfQPywg=
Received: by 10.236.156.5 with SMTP id l5mr7660814yhk.29.1323825061925;
	Tue, 13 Dec 2011 17:11:01 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 37sm2306489anu.21.2011.12.13.17.10.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 17:11:01 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Dec 2011 01:10:34 +0000
Message-Id: <21d6d15ad86b2066a0de081fb903c871e3406342.1323824998.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323824998.git.otavio@ossystems.com.br>
References: <cover.1323824998.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323824998.git.otavio@ossystems.com.br>
References: <cover.1323824998.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 7/8] qwt.inc: drop 'PRIORITY = "optional"' as it is the default
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
X-List-Received-Date: Wed, 14 Dec 2011 01:17:56 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-qt/qwt/qwt.inc |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-qt/qwt/qwt.inc b/meta-oe/recipes-qt/qwt/qwt.inc
index da1ed11..7112336 100644
--- a/meta-oe/recipes-qt/qwt/qwt.inc
+++ b/meta-oe/recipes-qt/qwt/qwt.inc
@@ -1,6 +1,5 @@
 DESCRIPTION = "Qt Widget Extension for Technical Applications"
 SECTION = "libs"
-PRIORITY = "optional"
 
 # LGPLv2.1 + some exceptions
 LICENSE = "QWTv1.0"
-- 
1.7.2.5



