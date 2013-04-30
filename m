Received: from mail-pd0-f176.google.com ([209.85.192.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UXDnp-0001Fg-5w
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Apr 2013 18:53:27 +0200
Received: by mail-pd0-f176.google.com with SMTP id r10so395988pdi.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2013 09:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=/fCPXErWN3E/rKssNNW/sSHecAtUQkwPtjWXh+S3JvE=;
	b=wBBvJqtgbA3tFj61vmIfXRACcuLU7HarZv+6rsxwoXgtzJcqHUgLc4TxJS2Tm2+n0U
	QSSEDhzPUByLVCEcWQGp/HQd4VCq0TdQj/WIecp7LmtZCBS3hqRPAJEN3cv6wj9Rm2I8
	weVeR7nqnePCWIjEjMrb+1jb15DK3HlUoYXdieF7864YSzq7D2oOSnGVEEnDhU9lW69O
	y7OMAI02AwsfJYI5I0gmGg0l1BKQ6Z20YI12D5/z4oeNMkfQYzKV+68yw7kJQ44jrGGZ
	YI88ojiQZXMxc6V3CRIa1NRhMlAuFj7qjrWo8oeDT6G/XWzu81Q89wdG20qDdi4Vh6G+
	gG5g==
X-Received: by 10.66.50.138 with SMTP id c10mr49414531pao.220.1367339725667;
	Tue, 30 Apr 2013 09:35:25 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	ux10sm31301132pab.1.2013.04.30.09.35.19 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 30 Apr 2013 09:35:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Apr 2013 18:32:56 +0200
Message-Id: <7e95a6882b1a63bf1ac283b60edce70a2d4df7a8.1367339449.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <cover.1367339449.git.Martin.Jansa@gmail.com>
References: <cover.1367339449.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1367339449.git.Martin.Jansa@gmail.com>
References: <cover.1367339449.git.Martin.Jansa@gmail.com>
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][dylan][PATCH 06/12] e-wm-0.17.2.1: Update checksums, tarball was repackaged upstream :/
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
X-List-Received-Date: Tue, 30 Apr 2013 16:54:13 -0000

Files enlightenment-0.17.2.1/ChangeLog and enlightenment-0.17.2.1-new/ChangeLog differ
Files enlightenment-0.17.2.1/NEWS and enlightenment-0.17.2.1-new/NEWS differ
Files enlightenment-0.17.2.1/po/ca.gmo and enlightenment-0.17.2.1-new/po/ca.gmo differ
Files enlightenment-0.17.2.1/po/ca.po and enlightenment-0.17.2.1-new/po/ca.po differ
Files enlightenment-0.17.2.1/po/eo.gmo and enlightenment-0.17.2.1-new/po/eo.gmo differ
Files enlightenment-0.17.2.1/po/eo.po and enlightenment-0.17.2.1-new/po/eo.po differ

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm_0.17.2.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-wm_0.17.2.1.bb b/meta-efl/recipes-efl/e17/e-wm_0.17.2.1.bb
index 228c122..5ff68bb 100644
--- a/meta-efl/recipes-efl/e17/e-wm_0.17.2.1.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_0.17.2.1.bb
@@ -12,5 +12,5 @@ SRC_URI = "\
     file://applications.menu \
 "
 
-SRC_URI[md5sum] = "e78018ba7a4622efbcbebd6d093b7fa4"
-SRC_URI[sha256sum] = "5e7b7f5ec88d0589bb4db8aae2c198dc9fd91049419e2460cbd7631207ebd799"
+SRC_URI[md5sum] = "dd6ffbe1ee6a804dbd2a7b2645bf3b4d"
+SRC_URI[sha256sum] = "66d250a865ffb97b12cabe8081ae041ce6924f55ffffaca6c65d468bb9f902f9"
-- 
1.8.2.1



