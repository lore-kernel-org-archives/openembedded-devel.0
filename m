Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id CF78B605BA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 19:09:22 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id n63so41896512qkf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 12:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LmixlydOHdR1BMl2l9JPwfTN0uaBItglIjZdg4KXDQc=;
	b=frJc50aWERvJg4a5loVxf3P21wYiloqPBKawUlV/PbnO108+/qH5XQYMvhWnNS6kXe
	Wgp+IIkMGJ9fI+oNAmrbKZYeeF72FeXxLt+LTnGQVrRfdkPnrpqSF/6TCw2PTi8xTcwz
	RXU2g9ZZ74dNOCPheBLbthl1QRmPOJdX9DMWCpUGj8Iy7RbyYjZ4gwiJuFgfP8zTTM9W
	b/yxY15BVbLYyTKCm/23H0Fm9JhpM7uTt1u4DuJ6A65qawoHmsACxpOS0ipmAnOCWths
	H5kJVGhI4Qj4JcwglWuH2/teVYAJ0KboDID/x9ZvaQIOuc/rlgVLtZTJayj41BAj5pI/
	O/Rg==
X-Gm-Message-State: AOPr4FUmyeRF4Hbh3LeZDegf/i/5Y6+p0D3UOoBG/CjmlPHmpSNUWQbsq2ou3f8LBlqfIA==
X-Received: by 10.55.9.139 with SMTP id 133mr26967258qkj.74.1461352162901;
	Fri, 22 Apr 2016 12:09:22 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id m2sm2899647qhc.29.2016.04.22.12.09.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Apr 2016 12:09:22 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Apr 2016 15:09:00 -0400
Message-Id: <1461352140-18407-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCH] libubox: update to the latest git version for bug fixes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Apr 2016 19:09:23 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-devtools/libubox/libubox_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/libubox/libubox_git.bb b/meta-oe/recipes-devtools/libubox/libubox_git.bb
index d0da2c5..609281a 100644
--- a/meta-oe/recipes-devtools/libubox/libubox_git.bb
+++ b/meta-oe/recipes-devtools/libubox/libubox_git.bb
@@ -18,7 +18,7 @@ SRC_URI = "\
     file://fix-libdir.patch \
 "
 
-SRCREV = "136a5196266d03d537f822c4e67d2fde2ed59505"
+SRCREV = "155bf39896f126b1ba121b816922a88dc34c31e3"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.1


