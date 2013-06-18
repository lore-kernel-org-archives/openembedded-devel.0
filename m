Return-Path: <paul.betafive@gmail.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id AA7226ABE7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2013 23:36:29 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id u53so3978373wes.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2013 16:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=7FcEoMIDG80gIkI7dkbyIEIEIIpOLPXZdPAl5KJMXFk=;
	b=VlFFaABghFs/AjcsA93QXCMZrsxXodWmuFre5/F4fl+D6Hs92RdUGfZ6pWFODV46SB
	mSKFnC55ybIVdhDBhUSokU3XZz0FzMzU2SoWw1duNOeddN5V+ZfoPgmyfJnyhaA+uziW
	1bZ76IPP/sght9LUHDUw7Kcps9qUs9yMWR4yxGjzCAZ/7TFeqspNdLcG8r5/l8slTr0t
	h7VPD3cTvp9KmP4iCuYqJz0YgF5dIIBw/oyNobAzESyBOcOQQNAg7pgVJ21HSpaUTHBj
	fTjjIz5pR/slRrqyb3PoHZ2SAm4MARyuhBXCEfvGvgh6kv7DTGcG84ixvQdpROTwJf31
	So+Q==
X-Received: by 10.180.189.136 with SMTP id gi8mr9084641wic.11.1371598590378;
	Tue, 18 Jun 2013 16:36:30 -0700 (PDT)
Received: from vesta.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id fo10sm5434483wib.8.2013.06.18.16.36.29
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 18 Jun 2013 16:36:29 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jun 2013 00:36:10 +0100
Message-Id: <1371598570-16322-2-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1371598570-16322-1-git-send-email-paul@paulbarker.me.uk>
References: <1371598570-16322-1-git-send-email-paul@paulbarker.me.uk>
Subject: [meta-networking][PATCH] ipsec-tools: update Upstream-Status for patch
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
X-List-Received-Date: Tue, 18 Jun 2013 23:36:30 -0000

I've been notified that the patch has been accepted upstream.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 .../ipsec-tools/ipsec-tools/0001-Fix-warning-with-gcc-4.8.patch        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0001-Fix-warning-with-gcc-4.8.patch b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0001-Fix-warning-with-gcc-4.8.patch
index 569b545..61f39d1 100644
--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0001-Fix-warning-with-gcc-4.8.patch
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0001-Fix-warning-with-gcc-4.8.patch
@@ -16,7 +16,8 @@ the warning and does not need replacing anything.
  src/racoon/ipsec_doi.c | 1 -
  1 file changed, 1 deletion(-)
 
-Upstream-Status: Submitted
+Upstream-Status: Accepted
+	(in CVS HEAD and 0_8-stable, expected to be present in next release)
 
 diff --git a/src/racoon/ipsec_doi.c b/src/racoon/ipsec_doi.c
 index 2b48d49..4e9d3a8 100644
-- 
1.8.3.1


