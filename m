Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id B74096B7AF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jan 2014 07:07:13 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id en1so7916168wid.17
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jan 2014 23:07:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jPK7Ru/Vh8S2wfNa7iXhE/Gs0j6ZEfuyoH+6bdKD4rA=;
	b=As1Yx5/T9Y0JrLoiFLIcF7YtPe62F7TwUOjUH8hrJiCauuaFr/W6PerNJjJLkzYOv1
	GxEKCEF/LCzUTvnAoF+92xDqCzg/XN7y6lH4SN5xJocT92ucKtDGUB3tdMZPIve2AAg2
	CpgsIQDvlKo73nWTxyLsLlJZpA5amXGh8Fh/D8Rt3CbinUkVconrkt/HlWejDfs5vTf6
	xxkaR95P2WG3wxBjir3ChKFe6eNwZSG2mncScR6Ppc0JpX1vm4AU7J59GehFtt6SGqwH
	ADWc+A8fPEvV/Zn4UM+voWbosaetVmWoqIyrFQA1sUT0Xj2QGd2A5PIv2Bt2wAqMl2D9
	fYGQ==
X-Gm-Message-State: ALoCoQk/61go5/YqKzSsidZAhWFzf2b6ZOHyUqK+xmKXIQgolhPvxr/8OV+n37Z3GOkIVIwR12Qi
X-Received: by 10.194.92.7 with SMTP id ci7mr6742592wjb.58.1389337634293;
	Thu, 09 Jan 2014 23:07:14 -0800 (PST)
Received: from localhost ([2001:610:612:0:223:32ff:fece:c738])
	by mx.google.com with ESMTPSA id ot9sm3325433wjc.0.2014.01.09.23.07.12
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Jan 2014 23:07:13 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Jan 2014 08:07:08 +0100
Message-Id: <1389337631-1844-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.4.2
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 1/4] oscam: bump SRCREV
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
X-List-Received-Date: Fri, 10 Jan 2014 07:07:14 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-multimedia/recipes-dvb/oscam/oscam_svn.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb b/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
index f466aff..ab74cc4 100644
--- a/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
+++ b/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "libusb1 openssl"
 
 SRC_URI = "svn://www.streamboard.tv/svn/oscam;module=trunk;protocol=http"
-SRCREV = "7974"
+SRCREV = "9164"
 PV = "1.10+${SRCPV}"
 
 S = "${WORKDIR}/trunk"
-- 
1.8.4.2


