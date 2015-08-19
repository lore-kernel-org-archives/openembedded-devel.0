Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id DADAB73E11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 15:05:59 +0000 (UTC)
Received: by lalv9 with SMTP id v9so4934364lal.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 08:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=RPDaADqT3vBWhrYvFWLkB/8JjnEuxNTIWQwIU9EcXos=;
	b=Kdg8ohDciaMzrQiIrWNfijqLp2g6lWPhptkzU9AgONY4kfN2xqOfDBuArpIViB0WcH
	4D+JNKxJ0xo1jAMlj77fCwSmVzdSNvmxCqg5cdEnn7rOVB+1cpxWtA40xF0YVHV7VMQh
	cgckjIRr//zlbku7t4HydxyKjkCvrde83y1OatE7lkO2p4Vwcpz68P0953iXWSZAfdUl
	zbNB9USEAYFNfTEowvqY+n4vSARdxfdnTHuSxYSRaRJ1XbrAdD6f6LA4IhHtrynoH1mn
	suPaJj/zUluNESAtW4Dw8kgbyUe65kyXDf1mYScPwnZk/R1G3mbOjoXDzfUiyzDNxNAj
	URBQ==
X-Received: by 10.152.23.234 with SMTP id p10mr11544000laf.52.1439996758886;
	Wed, 19 Aug 2015 08:05:58 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id jf8sm294039lbc.12.2015.08.19.08.05.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 19 Aug 2015 08:05:57 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Aug 2015 17:05:44 +0200
Message-Id: <1439996745-4053-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [meta-oe][PATCH 1/2] opencv_2.4: Update LICENSE
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
X-List-Received-Date: Wed, 19 Aug 2015 15:06:01 -0000

LICENSE file at the root of the opencv repo says:

License Agreement
For Open Source Computer Vision Library
(3-clause BSD License)

Credits-to: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_2.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recipes-support/opencv/opencv_2.4.bb
index 75441fd0c92c..ca378d7abc1e 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
@@ -2,7 +2,7 @@ SUMMARY = "Opencv : The Open Computer Vision Library"
 HOMEPAGE = "http://opencv.willowgarage.com/wiki/"
 SECTION = "libs"
 
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://include/opencv2/opencv.hpp;endline=41;md5=6d690d8488a6fca7a2c192932466bb14"
 
 ARM_INSTRUCTION_SET = "arm"
-- 
2.5.0


