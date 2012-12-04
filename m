Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi57-0002oS-2t
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:17:57 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1377891eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=uwOLLaKqqdtvasxJ4Mj4m/IyxADZ6r/6NkFfDScC5ag=;
	b=RguVdV3ZK8psPCk25NVLBmZ7fyJMyFreuzYdo/LXxBmnNyjK9mqTVY5F6KSRNpEgg+
	mUUQYHkXOrj3KcamiKAukqafO7alJvXHpZ3jfEn4jdU5636dW0KgpBH7qLu3hWzHQyb0
	asZmrZ5G4Ihal4KfTQjPSepHts1A7UUDZ6lkhvkWFW5W7+6PwXarfNBMMUizMt24yisd
	P/ae9phEI5gBeAF4R/Z99dSSGyCmxiEBLzqMOCFWndEBbqBJXDs/4b1rXv1FmkDmbcL/
	jS+tOpw6Xmb31/U0xEHMBVXHJKHh7DI2te1Z/ERV8NzwH48zeW/YgV6dfDAu+YWIcY3x
	wbCw==
Received: by 10.14.209.193 with SMTP id s41mr43108752eeo.9.1354586617504;
	Mon, 03 Dec 2012 18:03:37 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f49sm34802270eep.12.2012.12.03.18.03.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:03:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:59:02 +0100
Message-Id: <d98a58472f816b7077f5eec0b937d85e6e720fdb.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 29/58] engrave: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Tue, 04 Dec 2012 02:17:58 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/engrave_svn.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-efl/recipes-efl/efl/engrave_svn.bb b/meta-efl/recipes-efl/efl/engrave_svn.bb
index 2ebb0a1..f0f5d4f 100644
--- a/meta-efl/recipes-efl/efl/engrave_svn.bb
+++ b/meta-efl/recipes-efl/efl/engrave_svn.bb
@@ -1,5 +1,6 @@
 DESCRIPTION = "Engrave is an Edje Editing Library"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=edf2d968b9eb026bfa82cccbd0e6f9f5"
 # also requires yacc and lex on host
 DEPENDS = "evas ecore"
 PV = "0.0.0+svnr${SRCPV}"
-- 
1.8.0



