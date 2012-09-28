Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1THbYO-0000I9-2U
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Sep 2012 16:28:32 +0200
Received: by padfa11 with SMTP id fa11so2332055pad.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Sep 2012 07:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=BN7WmSp0l7eZWwLngeo6vImSZyF2FW6GRreB86U83vI=;
	b=Qga74R1ygOOUcC1yq+x1c5LY4CXJvpUuOxNbV4e+FBWs5EZt6V2GaN9GPPkYJ1IAj8
	UYhFXtWVWiyXOdBRvbEAN2rlPdiGQS4fRENbzHRmIUDH83MWajx362tK0AIk9d3DvMZU
	jseg3+7nSlGjuqWITa20AMQeu6NYD4fT6sBdJaf1ItjXtKHQgf5pSbFbpNqYLHtMJAXF
	pln3jdG6Rd12nbff2fxSRtvxTRHlHxNuc4m/eyLtA8nsnInOflBg66pljSdvPEV7CPEJ
	T+9itE9jlbKbi7Np5j7H2O+RQl0U3Nd8Y1u/jJmWktZ1WgMnD8P/ALGXMBGRze4FCWPS
	zlxw==
Received: by 10.68.221.72 with SMTP id qc8mr20715871pbc.63.1348841738110;
	Fri, 28 Sep 2012 07:15:38 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id j10sm5581770pax.4.2012.09.28.07.15.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 28 Sep 2012 07:15:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Sep 2012 07:15:20 -0700
Message-Id: <1348841720-27106-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-opie][PATCH] qpf-bitstream-vera-sans-mono_1.10.bb: Fix Typo
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
X-List-Received-Date: Fri, 28 Sep 2012 14:28:32 -0000

misplaced end quote

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../qpf-fonts/qpf-bitstream-vera-sans-mono_1.10.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-qtopia/qpf-fonts/qpf-bitstream-vera-sans-mono_1.10.bb b/recipes-qtopia/qpf-fonts/qpf-bitstream-vera-sans-mono_1.10.bb
index d84e3f7..95b6ebf 100644
--- a/recipes-qtopia/qpf-fonts/qpf-bitstream-vera-sans-mono_1.10.bb
+++ b/recipes-qtopia/qpf-fonts/qpf-bitstream-vera-sans-mono_1.10.bb
@@ -2,7 +2,7 @@ require qpf.inc
 
 DESCRIPTION = "Bitstream Vera Monospaced Font, QPF for Qt/Embedded"
 LICENSE = "Bitstream Vera"
-PR = "r4"
+PR = "r5"
 
 PROVIDES += "qpf-bitstream-vera-sans-mono-small"
 PROVIDES += "qpf-bitstream-vera-sans-mono-larger"
@@ -27,7 +27,7 @@ ${palmqtdir}/lib/fonts/verasansmono_10* \
 	${palmqtdir}/lib/fonts/verasansmono_13* \
 	${palmqtdir}/lib/fonts/verasansmono_14*"
 FILES_qpf-bitstream-vera-sans-mono-large = "\
-	${palmqtdir}/lib/fonts/verasansmono_15*" \
+	${palmqtdir}/lib/fonts/verasansmono_15* \
 	${palmqtdir}/lib/fonts/verasansmono_16* \
 	${palmqtdir}/lib/fonts/verasansmono_17* \
 	${palmqtdir}/lib/fonts/verasansmono_18* \
-- 
1.7.9.5



