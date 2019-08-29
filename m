Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 73DF17F308
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 19:22:15 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id b24so2758919pfp.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 12:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xXOrnsEFRdNbqMu0rpKQ53eE7/KMNJvafORr1ynkC+k=;
	b=IHP/6RkypSJKpl5dJfVT5tvNHCHBhoMErj+QeUrVTZo+iaFLnvoa6pLIRwoxHEbUPt
	IlWTmAcNwvZiXdIpARMV/TcUzNUJxO0JVidnmjBXVdl5NN5jggiCA3B2CTLROczE/J5b
	gHaWvKPL+mv9fs6AlJxDSqS7sEoI2tgtu+O0jFJkMmZtDd5R7yHETm6GsR0uGcK56B8n
	I9p/DLz6bQ0itUJ1naksoSykSAMFN0Jg7NSHf021ncOKOwR47vkLEbyJE+7ZHRDc5Kvm
	q2GV3mLU7gsMeaXIxdyeZVzoyufCDxyL94K9QUs+wfAV0x0/ey8sfViR9FuUiX1tKAXF
	1Kcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xXOrnsEFRdNbqMu0rpKQ53eE7/KMNJvafORr1ynkC+k=;
	b=ts5SCHezjkV01V+uaZicZyJyNFg+ixIBUWI7L1fJYtI9fO31ccENcjWzQEnrL8ZRAc
	HPmS7OUXXqd1u1exCZXXPrcMIDhxdY/hrL/gq/TMkbmyPuJLaJW8pLf9RjRrIW5BLS49
	nsqpDgaZJjvQi6IKJFBURgrQM/FLBTpeVOc14cD186WoQnrsMm3vVAv2DGhXERziFxWu
	hTB3ghqIaq+SXFe15e9gprGiTwaRJ7fL/c0XVRtas7PKIx5CCQaeAjY+ZbykXeqW1FNB
	vFIEVrje7c3qutRoO715cLyYtftggOYmmun2pqzkuxJTvSV15qJS4PsGASB3Hso9V1h0
	kK9g==
X-Gm-Message-State: APjAAAWeUfAzTIvP6wp8c5c2lJRTd7e/33JpBbD013A6rt1ifWbFHMKg
	zla4sgZDxjLDNYz6I7mh8F0YoDg45hA=
X-Google-Smtp-Source: APXvYqzHwt7gz2rTvFf51bvx+TdFjEDDRm1UrYuLBhlDKlvGoXAp4IxymQsKTPiNtuIQVCbnlHmQNA==
X-Received: by 2002:a65:5188:: with SMTP id h8mr9748071pgq.294.1567106535961; 
	Thu, 29 Aug 2019 12:22:15 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id s16sm4893281pfs.6.2019.08.29.12.22.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 29 Aug 2019 12:22:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2019 12:22:03 -0700
Message-Id: <20190829192206.1200-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190829192206.1200-1-raj.khem@gmail.com>
References: <20190829192206.1200-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/5] android-tools: update license md5sum for BSD-2-Clause
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
X-List-Received-Date: Thu, 29 Aug 2019 19:22:15 -0000
Content-Transfer-Encoding: 8bit

The text has changed in OE-Core common licenses

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/android-tools/android-tools_5.1.1.r37.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index d84fcaecc9..34b0b7a3b6 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -4,7 +4,7 @@ LICENSE = "Apache-2.0 & GPL-2.0 & BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = " \
     file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10 \
     file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6 \
-    file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=8bef8e6712b1be5aa76af1ebde9d6378 \
+    file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=cb641bc04cda31daea161b1bc15da69f \
     file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9 \
 "
 DEPENDS = "libbsd libpcre zlib libcap"
-- 
2.23.0


