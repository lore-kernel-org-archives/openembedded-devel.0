Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id D0D6171A2D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 18:33:58 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id u19so3879435qtc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 11:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DoManud6AFDrlp/by0k4TY+cCpf77o6j6Ae7Dj96qc0=;
	b=tuH4UJzjT8Jrrf6Vk+uC+6s6klFYYNkB6WYtQtKTHRzZH0EIS5h9/VWh6Dx9Sm7OJ9
	ZWDxwyg08foJkd+RxY8rgEy0zT38Yzw9zS1HD7yV+hdR0huAEvAHstaivALMQQXqFsOF
	R+yK0UjfqoKw25U0/VV6X/ho73l4ciHUcSO7QDVqK9+RCXeldYpfKI90gkoKs7FWN0CZ
	PIirnUBinMkETPAEC62vcGnYbSrVPIoJHcMKE8yxgc5I86KrXcfkzmCF4tQqjLxCDbD/
	KvRAPmiK4QGqIRN8vHOZtzBWlUXKPp246Wac71/FgQIVEgDvMy9Muxhek8W2TFsYoAbZ
	slmA==
X-Gm-Message-State: AHYfb5jAGf3s7dUyaRPz620L0uCIXFryuM3ZNbRklxf70+7ud5Y6dUfI
	usnUxN9hW8GvrcwJKLA=
X-Received: by 10.200.4.4 with SMTP id v4mr7181077qtg.23.1502217239425;
	Tue, 08 Aug 2017 11:33:59 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id b16sm947178qtb.82.2017.08.08.11.33.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Aug 2017 11:33:58 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Aug 2017 14:33:52 -0400
Message-Id: <1502217232-9510-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-perl][PATCH] libextutils-parsexs-perl: update to version 3.35
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
X-List-Received-Date: Tue, 08 Aug 2017 18:33:59 -0000

Update license checksum and verify terms are unchanged

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...tutils-parsexs-perl_3.24.bb => libextutils-parsexs-perl_3.35.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libextutils/{libextutils-parsexs-perl_3.24.bb => libextutils-parsexs-perl_3.35.bb} (85%)

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.24.bb b/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb
similarity index 85%
rename from meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.24.bb
rename to meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb
index bc368ea..33707a0 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.24.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb
@@ -10,12 +10,12 @@ SECTION = "libs"
 HOMEPAGE = "http://metapan.org/release/ExtUtils-ParseXS/"
 
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-LIC_FILES_CHKSUM = "file://README;beginline=121;endline=130;md5=10ddb3a673b4c732022ac899968ea9cc"
+LIC_FILES_CHKSUM = "file://README;beginline=120;endline=129;md5=eb858f0e3b1b0bee0c05b86a474ae2b6"
 
 SRCNAME = "ExtUtils-ParseXS"
 SRC_URI = "${CPAN_MIRROR}/authors/id/S/SM/SMUELLER/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[md5sum] = "e6be3f1d493e04ed805576104cf4328b"
-SRC_URI[sha256sum] = "30b60b8208fc9b7746ed934b678bb9618a8f28994dae8774548353a7b550371e"
+SRC_URI[md5sum] = "2ae41036d85e98e1369645724962dd16"
+SRC_URI[sha256sum] = "41def0511278a2a8ba9afa25ccab45b0453f75e7fd774e8644b5f9a57cc4ee1c"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4


