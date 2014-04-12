Return-Path: <paul.betafive@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1D8B165E01
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Apr 2014 19:14:15 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id hm4so3866617wib.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Apr 2014 12:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=3uYRJ2hJTB65ymwjoy0sBovrnpFII7DY1fhLshXigJ0=;
	b=A9NY18dnlkG+gpimoZFzC8EcMLLVzLXas7etNIgPfH5m39UREdgK1wmBVq0QP1zfHN
	Oikz/d7wunyi59/EAkpzYUaYc7NA6Kb1e1Qq97ObfibLsGEWtC6N59fz58dZ8Ybi9YKw
	IbtQCMSyNBUU3kWJMpruPC/PyrfKVZnLqD4EWjQvUgi5NN+mxkrjsUdquQVR6NCrY16R
	JgC1R39SLFWcUmKLBAZD/h6llW+GQW3uU6gB8wHoPpTJChd4DDKnpPzhqtGJxFHOSKb/
	peY6aS3UzNqBPde3PH2/Zk2+3Lv2xwIxLsrhIbluYzY7ngXtBnFKkftkt2eXliBnKLy2
	rSZA==
X-Received: by 10.180.77.200 with SMTP id u8mr3343590wiw.48.1397330056089;
	Sat, 12 Apr 2014 12:14:16 -0700 (PDT)
Received: from desktop.betafive.co.uk
	(cpc66027-shep11-2-0-cust140.8-3.cable.virginm.net. [81.110.75.141])
	by mx.google.com with ESMTPSA id r4sm16930245wjz.28.2014.04.12.12.14.14
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 12 Apr 2014 12:14:14 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Apr 2014 20:14:08 +0100
Message-Id: <1397330049-20282-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.9.2
Subject: [PATCH] ipsec-tools: Update patch status
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
X-List-Received-Date: Sat, 12 Apr 2014 19:14:16 -0000

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 .../ipsec-tools/ipsec-tools/0002-Don-t-link-against-libfl.patch        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0002-Don-t-link-against-libfl.patch b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0002-Don-t-link-against-libfl.patch
index 674331d..13e9d73 100644
--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0002-Don-t-link-against-libfl.patch
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0002-Don-t-link-against-libfl.patch
@@ -9,7 +9,8 @@ need to link against libfl and so no longer get errors about undefined
 references to yylex.
 
 Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
-Upstream-status: Pending
+Upstream-status: Submitted 2014-03-11
+    see http://sourceforge.net/p/ipsec-tools/mailman/ipsec-tools-devel/thread/CANyK_8ewmxGA3vBVJW6s1APXPmxPR%2BDFWZ61EL8pCt288aKQ6w%40mail.gmail.com/#msg32088797
 ---
  src/libipsec/Makefile.am | 1 -
  src/racoon/Makefile.am   | 2 +-
-- 
1.9.2


