Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id D206072F0A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Mar 2017 15:21:25 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id o135so4312537qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Mar 2017 07:21:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bw3RLILY9W0qQV0sALT2Cart6bgrOlRlw637QMsNOOk=;
	b=Rum72dnkW/ZqqY2K51ys9vog8QNdYEq5Dy8/Wn1HPOikty+AHpL+NVQa+b5jibcFkc
	yXCxJg3/TdxUqDeP1HGKMXYkEuU1tV2qMfflpZ6QnTVTm5hxd3dCkiutakyrFJAFXJ3x
	7jIe0GLL4QbTVwhaVDpf+i9O3+/B96n5m3dG50dlXs3X4+v7M8HODE3dkc72j7ao9VPZ
	dDK3M3lcV8jRK0s1xQfLxXffkO7O+iJjXuez+QdztKShbxUtJ8QMDM2W77rcJGIyEgYC
	UG7tYAGai3yE27vxuhblP6zSEyMeK9BloeV4aLJHFvPnpNzVzqbKxXYEwzki+GW6hNft
	q/QQ==
X-Gm-Message-State: AMke39n0ob8p/cm6l7yJ5D5MaY6z0B8xx1OjtrTiXhmrVAUqGra6jyRB0xA9RvWQUiRtRA==
X-Received: by 10.200.34.77 with SMTP id p13mr16216485qtp.22.1488813686378;
	Mon, 06 Mar 2017 07:21:26 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	h33sm13588190qtc.42.2017.03.06.07.21.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Mar 2017 07:21:25 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Mar 2017 10:21:15 -0500
Message-Id: <1488813675-5247-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-perl][PATCH] libcgi-perl: update to version 4.35
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
X-List-Received-Date: Mon, 06 Mar 2017 15:21:26 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-perl/libcgi/{libcgi-perl_4.28.bb => libcgi-perl_4.35.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcgi/{libcgi-perl_4.28.bb => libcgi-perl_4.35.bb} (82%)

diff --git a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.28.bb b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.35.bb
similarity index 82%
rename from meta-perl/recipes-perl/libcgi/libcgi-perl_4.28.bb
rename to meta-perl/recipes-perl/libcgi/libcgi-perl_4.35.bb
index 20626d2..4fa3429 100644
--- a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.28.bb
+++ b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.35.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2e9769f0a2613a98bc7fce15dee0c533"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/L/LE/LEEJO/CGI-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "28efb391377f6e98c19c23292d5fcc8c"
-SRC_URI[sha256sum] = "1297d3ed6616cacb4eb57860e3e743f3890111e7a63ca08849930f42f1360532"
+SRC_URI[md5sum] = "15e63942c02354426b25f056f2a4467c"
+SRC_URI[sha256sum] = "0b34cdc59f596632b0620939286f6e18e7e81d043b6b57b974a8e07d18b5fc1d"
 
 S = "${WORKDIR}/CGI-${PV}"
 
-- 
2.7.4


