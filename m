Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0CB2A70057
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 18:18:14 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id t37so24056197qtg.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 11:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TFsoVr1f0CmBFQFhu/mRdSrJWUgK5zdyIvr2LXtf6+s=;
	b=Rofn5pkdwH39XV8/CkafokNLx2uWqVEKkyRzOPDse0K99vkzNJxyLmnrCf2CuqO8gw
	Sa20XVcpDs6gKbe+UYXlfZV2umICmobpNK98KM4Tum01H3YEEpYrma9vX5wvL6hNTs0t
	Uz2uug54jmjdmpsrW7jgS1uG9nXQsAmNfemQeQ3+N3mBbfTmXHt7QavHufu/5V99lFIB
	Ef7dR1Ah418P0uIpPsPZJahnMJGnZazdn8l++au9ypF5CzXO6Tz7GrUV+kCiycp8WBgo
	V14gFtd42Cj/5iR++P070xSwzz/jYnbTCeh6kuNczhq/+A/uJZpsZTyfeFLnHCnfukuz
	fq9g==
X-Gm-Message-State: AHYfb5gMdvfxvoEqvYwoq49KjpAmF6PWNKAtGQPQhNBe66MhqaHf8FUh
	qfwCuRFsioWtQpzbolE=
X-Received: by 10.237.42.44 with SMTP id c41mr6873383qtd.74.1502216295908;
	Tue, 08 Aug 2017 11:18:15 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id y9sm1130989qkg.36.2017.08.08.11.18.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Aug 2017 11:18:15 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Aug 2017 14:17:58 -0400
Message-Id: <1502216278-22292-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-perl][PATCH] libmoo-perl: update to version 2.003002
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
X-List-Received-Date: Tue, 08 Aug 2017 18:18:16 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../libmoo/{libmoo-perl_2.000002.bb => libmoo-perl_2.003002.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libmoo/{libmoo-perl_2.000002.bb => libmoo-perl_2.003002.bb} (87%)

diff --git a/meta-perl/recipes-perl/libmoo/libmoo-perl_2.000002.bb b/meta-perl/recipes-perl/libmoo/libmoo-perl_2.003002.bb
similarity index 87%
rename from meta-perl/recipes-perl/libmoo/libmoo-perl_2.000002.bb
rename to meta-perl/recipes-perl/libmoo/libmoo-perl_2.003002.bb
index fe119fa..a0fe492 100644
--- a/meta-perl/recipes-perl/libmoo/libmoo-perl_2.000002.bb
+++ b/meta-perl/recipes-perl/libmoo/libmoo-perl_2.003002.bb
@@ -7,11 +7,11 @@ SECTION = "libs"
 HOMEPAGE = "http://metapan.org/release/Moo/"
 
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-LIC_FILES_CHKSUM = "file://README;beginline=688;endline=733;md5=27efedd175eeaddbd18f4e3572bd72a8"
+LIC_FILES_CHKSUM = "file://README;beginline=731;endline=776;md5=27efedd175eeaddbd18f4e3572bd72a8"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Moo-${PV}.tar.gz"
-SRC_URI[md5sum] = "8b84a7289fc6247de5ec5d151105fd6b"
-SRC_URI[sha256sum] = "fb4bfa751f0dd06bd70f2e06e811f85a640501f263c228a8efafbf6b26691fd4"
+SRC_URI[md5sum] = "e9f1f3159555ecebcd062e998f297a94"
+SRC_URI[sha256sum] = "f3e9741e79baa63e89f5a08706cd80d18c0a5a37e3d898847e002310e06582f1"
 
 S = "${WORKDIR}/Moo-${PV}"
 
-- 
2.7.4


