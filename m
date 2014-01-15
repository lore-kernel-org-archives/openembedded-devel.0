Return-Path: <paul.betafive@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1A3A56AE73
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 02:13:58 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id cc10so1571808wib.17
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2014 18:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=qy/BN1g54vzf/vTA9nY+XPHPIxza+ysctQDaNHzOEFY=;
	b=qtOoKBm4t7kP8hQGqzAzXbRRvzkADUv9ENw0r5wqis2+T1mKIyb0fxMOXFvpO8hMzR
	FxxwS7n61u10vYchCehXyKA1mZfllKioTJasq0kaw34smTktxrsLviQbTGjMU89CleoR
	5ZmvhFicxGt2rkRVPVTJ6jIsdEpd+py1eteYqAee2nV+lcMd9WaRc8eiaa+7+4iq/tqG
	cvuBnE9HRE/vpNJnjEIKCWFZpcG60zTMGX3a+fa8u5wU2c/nYBgi60eN+xoEh/2TxYy7
	FoH85Q8+kJNnsVLiT1DO+mckqdZNjhHNZOnaj3r3jI4t/6Ox1vcLjITJF9KRiqE9rJTQ
	m7xA==
X-Received: by 10.180.221.129 with SMTP id qe1mr14291247wic.17.1389752039598; 
	Tue, 14 Jan 2014 18:13:59 -0800 (PST)
Received: from netbook.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id md9sm26010089wic.1.2014.01.14.18.13.58
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Jan 2014 18:13:58 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jan 2014 02:13:45 +0000
Message-Id: <1389752025-4210-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.5.2
Subject: [PATCH] vim: Upgrade to version 7.4.155
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
X-List-Received-Date: Wed, 15 Jan 2014 02:13:59 -0000

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta-oe/recipes-support/vim/{vim_7.4.27.bb => vim_7.4.155.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/vim/{vim_7.4.27.bb => vim_7.4.155.bb} (99%)

diff --git a/meta-oe/recipes-support/vim/vim_7.4.27.bb b/meta-oe/recipes-support/vim/vim_7.4.155.bb
similarity index 99%
rename from meta-oe/recipes-support/vim/vim_7.4.27.bb
rename to meta-oe/recipes-support/vim/vim_7.4.155.bb
index 5cb933b..0d98e7a 100644
--- a/meta-oe/recipes-support/vim/vim_7.4.27.bb
+++ b/meta-oe/recipes-support/vim/vim_7.4.155.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;md5=b779e18be6ed77facc77069
 
 SRC_URI = "hg://vim.googlecode.com/hg/;protocol=https;module=vim \
 	   file://configure.in_remove_CC_quotes.patch;patchdir=.."
-SRCREV = "v7-4-027"
+SRCREV = "v7-4-155"
 
 S = "${WORKDIR}/${PN}/src"
 
-- 
1.8.5.2


