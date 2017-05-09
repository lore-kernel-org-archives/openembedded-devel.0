Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1180271A1A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 May 2017 07:57:19 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id u26so12840388pfd.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 May 2017 00:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=g8yKXOhRfmlx4BppVZPClSHdOgv60ZnhynswEWC339U=;
	b=eg/Y0GB3fhrFJfM/pixPFm/SQvDp5NbSPUEqNvNH3+YSM7/rl3gbPevuarnnIUG8K3
	+k6FymKaU8lr67FPrqVO4Fanw/6SA84+HwV4lSoFQLuZs474hSoEBRrvcJJrZ1rr/PcI
	5K9NIF515F/MKIcgRBvFxKmNDZ1aNbbUXYFDYV+vREeLkYPAGCEk3oBu9gou5bo5H8wT
	a039PYIfigXM1bvSnPGQlKR3U6VMIZshMyKKMGToPwcsOAdR4vnGf4vVk7t5JjChgi3G
	ARDAeDyI1gYOOsLZOZRL77MVGqUFyLbvFq5zcqNTCpvmZSx47PhFu8YxdU/Hq4/oi0zc
	R5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=g8yKXOhRfmlx4BppVZPClSHdOgv60ZnhynswEWC339U=;
	b=RoNW/hhfgSHkLXJemUa/5XGXgmefiwFfz4Wyf2o9kL0vVd3vvqhJzW+fVYYQhbKn5Z
	qiNnWveHtpLejnlMBPHKpuJOGW8D6DmdWIP+CO7IQXrmqZWfMe/bqdhjGVLS5i+ikjd6
	5iX4BKgSUI3rSUH+h7MWAbehqsBPTCrrEQ34iPP7Ilfh+XW7/E/KvkF3N3aAgRQ9wg07
	B9IwmsnEpJqiDPaf0upO8LezYHMQdjpGhZbyYhFAJRg69t3QEVprjmJ4MhTqKOSPqbqT
	RaHiaECxY911smrgUXOAprDKkywqqbrG/Jedk6vMmh1n62+MUVVjQRz8++PCZ5wjCZIi
	5R4w==
X-Gm-Message-State: AN3rC/53s6A7VDZDF5A8X6qt4C4VM9M4P5TNrLBg+JMClg4eeU56EF+H
	PZy5qx8WDyP5DQ==
X-Received: by 10.84.216.26 with SMTP id m26mr72047007pli.79.1494316640730;
	Tue, 09 May 2017 00:57:20 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::c232])
	by smtp.gmail.com with ESMTPSA id
	i67sm20250916pfk.87.2017.05.09.00.57.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 May 2017 00:57:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 May 2017 00:57:03 -0700
Message-Id: <20170509075711.1575-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
Subject: [meta-multimedia][PATCH 1/9] dleyna-server: Update to 0.6.0 release
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
X-List-Received-Date: Tue, 09 May 2017 07:57:20 -0000

License checksum changed due to copyright year update in 2017

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
index ae167650f..a8e5406d0 100644
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
@@ -6,13 +6,13 @@ HOMEPAGE = "https://01.org/dleyna/"
 
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
-                    file://libdleyna/server/server.c;endline=22;md5=dfa6dc3f914206c2408c0510c234f8c8"
+                    file://libdleyna/server/server.c;endline=22;md5=437455d8aeff69ebd0996a76c67397bb"
 
 DEPENDS = "glib-2.0 gssdp gupnp gupnp-av gupnp-dlna libsoup-2.4 libxml2 dleyna-core"
 RDEPENDS_${PN} = "dleyna-connector-dbus"
 
 SRC_URI = "git://github.com/01org/${BPN}.git"
-SRCREV = "38651783914c76bd861f7fe8651b25e3986d7be8"
+SRCREV = "776950d5d96ac9dbf5c5c47bde8ac06f50a3cf46"
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
-- 
2.12.2


