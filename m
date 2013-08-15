Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5DB986B7DF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:23 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b10so183601eae.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=VGjmrAdRkSc8wkzGHuJk2C9wFghhzMr2XE0P2yob7tw=;
	b=DscTXW/PhF13oxuBhGpXNPQS1KLtO4vO0zmQhLZJhJrnlyoikPehTHwLLaN8rtVzot
	dFBOgyasvgjHRfEo0te+UrkKBjWzYZaE+SMrvgXXAo0GlXQRdlNIlfrWxQjwqfepqBxv
	RFlKSd5+2+Hvc0hUuhVWQ79lOo6ZsC2Izvasv3tXuZIPLSPsS2MOCStMo+5S6TNRNj+b
	gD1kbPb8EZn7mUicZbsjr4UtjgCIQMwnZxOC1B3LbJZOYYvH0Z765HSWxrh1cXuLSW6p
	g4W4UvBxgDC/LADANY4djoR0PnLercU8GAgnt3ceu3RX6lzcZKnEgl40QeyyD6AU8ako
	preQ==
X-Received: by 10.15.49.137 with SMTP id j9mr983038eew.68.1376551163799;
	Thu, 15 Aug 2013 00:19:23 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bn13sm81942650eeb.11.2013.08.15.00.19.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:03 +0200
Message-Id: <66fa4b39c1f0528836bb9ff79d129346322ab3a5.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 23/60] samba: use more specific LICENSE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Aug 2013 07:19:23 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/samba/samba.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/samba/samba.inc b/meta-oe/recipes-connectivity/samba/samba.inc
index 6092226..e7defaa 100644
--- a/meta-oe/recipes-connectivity/samba/samba.inc
+++ b/meta-oe/recipes-connectivity/samba/samba.inc
@@ -1,5 +1,5 @@
 SECTION = "console/network"
-LICENSE = "GPL"
+LICENSE = "GPL-3.0"
 DEPENDS = "readline virtual/libiconv talloc"
 
 SRC_URI = "http://samba.org/samba/ftp/stable/samba-${PV}.tar.gz \
-- 
1.8.3.2


