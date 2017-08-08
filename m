Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id A83CB719AF
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 17:56:45 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id d145so3728915qkc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 10:56:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7HH/DDsNJo9jWyb9X6ZDyyp39A59/Hoo6iwok0B3/Aw=;
	b=PAE58XjQoyz6l57eDI3E/6Zk5/+9O6MhhC2bURShSDDjGmop2uD4fttunEryex2PWK
	8q9t4MxdnfTystXLC+SKaA/jGf3KBaftd/1+kHrUDwkbfmauK39q13mJsVlok7aP0xYr
	+4iBZyetA4krSgNRf07deoBvNq4uRuk+JA1zuxdaJLbYZrtUeeYnUe8difyxaix8SWXa
	TyTXfbtuuyIQe2ct2npg1h99qO/bX2cyMFo2vVYnDmwapmd8WZjgGPKr11HWMNoPNvPr
	qsPrvzeBFJhpx3smXeE8E0QFFFYsXVoUX7+kJ+A+id9Mp/RjgcB45+Wlo+0o/u/YkaXt
	VLkw==
X-Gm-Message-State: AHYfb5gncCARDQjR1JcELCLtH8MIEaCZuyC/3Lzrtre26R024GkgWDGP
	iV2PPRz+EwHT8XTG3CU=
X-Received: by 10.200.38.212 with SMTP id 20mr6801190qtp.112.1502215006598;
	Tue, 08 Aug 2017 10:56:46 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id b16sm916766qtb.82.2017.08.08.10.56.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Aug 2017 10:56:45 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Aug 2017 13:56:40 -0400
Message-Id: <1502215000-15965-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-perl][PATCH] librole-tiny-perl: update to version 2.000005
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
X-List-Received-Date: Tue, 08 Aug 2017 17:56:45 -0000

Update the start and end marker for the license and verify the terms are the same

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...{librole-tiny-perl_2.000001.bb => librole-tiny-perl_2.000005.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/librole/{librole-tiny-perl_2.000001.bb => librole-tiny-perl_2.000005.bb} (77%)

diff --git a/meta-perl/recipes-perl/librole/librole-tiny-perl_2.000001.bb b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.000005.bb
similarity index 77%
rename from meta-perl/recipes-perl/librole/librole-tiny-perl_2.000001.bb
rename to meta-perl/recipes-perl/librole/librole-tiny-perl_2.000005.bb
index 48360c6..f684f68 100644
--- a/meta-perl/recipes-perl/librole/librole-tiny-perl_2.000001.bb
+++ b/meta-perl/recipes-perl/librole/librole-tiny-perl_2.000005.bb
@@ -6,11 +6,11 @@ SECTION = "libs"
 HOMEPAGE = "https://metacpan.org/pod/Role::Tiny"
 
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-LIC_FILES_CHKSUM = "file://README;beginline=172;endline=209;md5=26df7e7c20551fb1906e2286624f0b71"
+LIC_FILES_CHKSUM = "file://README;beginline=177;endline=214;md5=26df7e7c20551fb1906e2286624f0b71"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Role-Tiny-${PV}.tar.gz"
-SRC_URI[md5sum] = "f350f1f8c13652bf85da172380b39ec8"
-SRC_URI[sha256sum] = "31883410a7c85d6dc7501c718b1f83edba013a7b9bbccf0338a1033c391f296d"
+SRC_URI[md5sum] = "c8c5cf1e02d2e0a1ed22530b55b67d66"
+SRC_URI[sha256sum] = "593a29b621e029bf0218d0154d5dfdf6ec502afc49adeeadae6afd0c70063115"
 
 S = "${WORKDIR}/Role-Tiny-${PV}"
 
-- 
2.7.4


