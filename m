Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S4Bg4-0007qx-Dt
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Mar 2012 14:40:44 +0100
Received: by wgbdr12 with SMTP id dr12so2433057wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Mar 2012 05:32:11 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.104.65 as permitted sender)
	client-ip=10.180.104.65; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.104.65 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.104.65])
	by 10.180.104.65 with SMTP id gc1mr8977912wib.13.1330867931372
	(num_hops = 1); Sun, 04 Mar 2012 05:32:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.104.65 with SMTP id gc1mr7190892wib.13.1330867931326;
	Sun, 04 Mar 2012 05:32:11 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id w14sm1993617wiv.11.2012.03.04.05.32.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Mar 2012 05:32:10 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Mar 2012 14:32:03 +0100
Message-Id: <1330867925-23330-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1330867925-23330-1-git-send-email-koen@dominion.thruhere.net>
References: <1330867925-23330-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQm/z8zqLWasvVCsvU+3nbNyk2SI8ftsgtS9epFlrkHlOMrDMTO3KZ/uEdPG/01bJULzpYKA
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe 2/4] gateone: update to the 1.0 release
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
X-List-Received-Date: Sun, 04 Mar 2012 13:40:44 -0000

License is still AGPL-3 the checksum changed due to 1.0rc -> 1.0

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-connectivity/gateone/gateone_git.bb    |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-connectivity/gateone/gateone_git.bb b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
index aee88f3..107b3f2 100644
--- a/meta-oe/recipes-connectivity/gateone/gateone_git.bb
+++ b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
@@ -1,11 +1,9 @@
 DESCRIPTION = "HTML5 (plugin-free) web-based terminal emulator and SSH client"
 LICENSE = "AGPLv3"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=07d5a2790569bd3e3b422b69ccd43bec"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ee5b168fc7de89a0cadc49e27830aa2c"
 
-PR = "r16"
-
-PV = "0.9"
-SRCREV = "a68444610efa2892842893dae828a28527e64a6e"
+PV = "1.0"
+SRCREV = "0dfa4196ca514e075199c0dbf849353c6aa2976b"
 SRC_URI = "git://github.com/liftoff/GateOne.git \
            file://gateone-avahi.service \
            file://gateone.service \
-- 
1.7.2.5



