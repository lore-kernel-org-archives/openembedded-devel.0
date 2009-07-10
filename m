Received: from [209.85.220.207] (helo=mail-fx0-f207.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1MP9jH-0006t8-Ie
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Jul 2009 08:37:07 +0200
Received: by fxm3 with SMTP id 3so562743fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jul 2009 23:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=dOIoY5/SYzj2NcYQkIH6pk7a55osg6W5RCMD/g/5QAk=;
	b=epT9ahRr2kVR/UoSMw7oE3ESV+tfpNdOmojFbT9nI1iAzGmBbV099XvNpWlNyQiJ0i
	vLLjxIif9ABL1cvdJFT8Hv5Les0Zji1dzH0Polqx1nKPfgh+XGcxP/dlwGSxJhyx+Das
	sCBb3idGJROobqVKMVCyo2lSXoOsAx2Ix80o0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=SK3zAp10/zmHgC2lEogGmwcnWy5/SkccsWHzlLauKKJLhcF87YZ3uYZlsbQkxglBTp
	sBPNcTOHn1eRmVMkwkqDXyQMmw/elpNARSyItkF1sfwLToy6lPU4wxcoeiapRRIQFxl1
	db7uWE2L9neEtExuL2U5Oh6SOIzIidIsRqcb4=
Received: by 10.103.131.18 with SMTP id i18mr855375mun.107.1247207055564;
	Thu, 09 Jul 2009 23:24:15 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id g1sm3418533muf.56.2009.07.09.23.24.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 09 Jul 2009 23:24:12 -0700 (PDT)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Jul 2009 08:24:09 +0200
Message-Id: <1247207049-7291-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] opkg*: bump to r215 to fix segfaults on upgrade
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
X-List-Received-Date: Fri, 10 Jul 2009 06:37:09 -0000

From: Koen Kooi <koen@openembedded.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 conf/distro/include/sane-srcrevs.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include/sane-srcrevs.inc
index 6369462..7116c22 100644
--- a/conf/distro/include/sane-srcrevs.inc
+++ b/conf/distro/include/sane-srcrevs.inc
@@ -185,9 +185,9 @@ SRCREV_pn-openmoko-toolchain-scripts ?= "4913"
 SRCREV_pn-openmoko-worldclock2 ?= "3365"
 SRCREV_pn-openocd ?= "517"
 SRCREV_pn-openocd-native ?= "517"
-SRCREV_pn-opkg ?= "209"
-SRCREV_pn-opkg-native ?= "209"
-SRCREV_pn-opkg-sdk ?= "209"
+SRCREV_pn-opkg ?= "215"
+SRCREV_pn-opkg-native ?= "215"
+SRCREV_pn-opkg-sdk ?= "215"
 SRCREV_pn-opkg-utils ?= "4578"
 SRCREV_pn-opkg-utils-native ?= "4595"
 SRCREV_pn-oprofileui ?= "173"
-- 
1.6.1



