Return-Path: <paul.betafive@gmail.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 19E4160958
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jul 2013 07:32:06 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id x55so3616325wes.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jul 2013 00:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=p2Nmii5kx8klV6ezsODJFo0HrNK3S7eR9jR64eEy4oo=;
	b=ZbtvCKI2sSFtcfqcXZcWeC+GrIfMGbE2G797SN0Ip1ApTqlCuCCsPZ0w0yaD2ie3Oo
	GR4iQpWgoSRWRE99odvYcma6gzl/4IoCZfxzs8DpDi8cwfS2BVX4SrE8E43ZJXKAW0lC
	sqzpjtZK5NTgenbQzb77cIqPmGyw3w0Fy97zAHz1iFwPTMWitSz8lFfOpZ3HeRa1YSdg
	f/dOTjv3nhyLynwXZlk0PjDjmkwWAh/6BiEF6itgXfRpwdajds7CpIUpT8ldthE5SArx
	FTnSrKotrjGb8JaYFfnVqjPHd2o7H1ucSXcamroVpyD6iOVcyz2JYynXRQhaGniwJom5
	9JsA==
X-Received: by 10.180.85.6 with SMTP id d6mr6068022wiz.47.1375083127285;
	Mon, 29 Jul 2013 00:32:07 -0700 (PDT)
Received: from desktop.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id d8sm20557984wiz.0.2013.07.29.00.32.05
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 29 Jul 2013 00:32:06 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Mon, 29 Jul 2013 08:31:28 +0100
Message-Id: <1375083088-22622-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.3.4
Subject: [meta-oe][PATCH] vim: upgrade to v7.3.1314
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
X-List-Received-Date: Mon, 29 Jul 2013 07:32:07 -0000

This is the last patch in the vim 7.3 series, the next release will be vim 7.4.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta-oe/recipes-support/vim/{vim_7.3.905.bb => vim_7.3.1314.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/vim/{vim_7.3.905.bb => vim_7.3.1314.bb} (83%)

diff --git a/meta-oe/recipes-support/vim/vim_7.3.905.bb b/meta-oe/recipes-support/vim/vim_7.3.1314.bb
similarity index 83%
rename from meta-oe/recipes-support/vim/vim_7.3.905.bb
rename to meta-oe/recipes-support/vim/vim_7.3.1314.bb
index f5b1453..1be5a91 100644
--- a/meta-oe/recipes-support/vim/vim_7.3.905.bb
+++ b/meta-oe/recipes-support/vim/vim_7.3.1314.bb
@@ -2,6 +2,6 @@ require ${PN}.inc
 
 PR = "${INC_PR}.0"
 
-SRCREV = "v7-3-905"
+SRCREV = "v7-3-1314"
 
 SRC_URI += "file://configure.in_remove_CC_quotes.patch;patchdir=.."
-- 
1.8.3.4


