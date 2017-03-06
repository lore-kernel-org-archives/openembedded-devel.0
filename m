Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id A24CD77577
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Mar 2017 15:28:07 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id o135so4366288qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Mar 2017 07:28:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JCQgM5b8H3S/FRfnsuyy8SAqHR4UNC5LKkEhyLQGL2o=;
	b=iXhkEiVK2rutoKuMhPsB7SLb3HP6akiyMxl1VcqwiwOQJd+0hsyuMNJ4b3FaNDJxpT
	jkY326yuMmz8rrhV1GZ5mEUTdGf3jByitdpvvT0wi2vp2KJdcMVypz6EIEr2qSfeDvP0
	EdJydLK3ZXT/up0lw1+3Amg4boNe+19PqX2Nuqmz/gs+lEkYjVTe+iVkEEBWqjxHtgll
	ZZUUkg794glD6CaLoxE4jPdNgBZikgXcW+efEbQBA66f6oHMxgP6e3o5YXjodVs0JWfU
	H6TlVMtVEpHr4K5HWiOw1G7D1978KmSEh0TqWjwIuOTKJVFMzcZL6FjFhlEEdupQm2CV
	iodA==
X-Gm-Message-State: AMke39mnORWN2aPPj7YkzS0gwHJb2NVyFy0jOk3q2zr2kiMnJIwYhASfvjinWwvZ0NH2WQ==
X-Received: by 10.200.62.137 with SMTP id y9mr15808771qtf.182.1488814088459;
	Mon, 06 Mar 2017 07:28:08 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	j35sm1552448qtc.63.2017.03.06.07.28.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Mar 2017 07:28:08 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Mar 2017 10:28:01 -0500
Message-Id: <1488814081-6158-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-perl][PATCH] libmime-types-perl: update to version 2.13
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
X-List-Received-Date: Mon, 06 Mar 2017 15:28:07 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{libmime-types-perl_2.04.bb => libmime-types-perl_2.13.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libmime/{libmime-types-perl_2.04.bb => libmime-types-perl_2.13.bb} (85%)

diff --git a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.04.bb b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.13.bb
similarity index 85%
rename from meta-perl/recipes-perl/libmime/libmime-types-perl_2.04.bb
rename to meta-perl/recipes-perl/libmime/libmime-types-perl_2.13.bb
index ef53029..fd51c16 100644
--- a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.04.bb
+++ b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.13.bb
@@ -14,8 +14,8 @@ LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=11;md5=963ce28228347875
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/MIME-Types-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[md5sum] = "e292bbf7756bb4999407f3f660697168"
-SRC_URI[sha256sum] = "22b6069d372d587b1f2ecc6d0aaf50fb5c64920caed8c214b9884e64538acc8f"
+SRC_URI[md5sum] = "f2892ae9e6ea660a58746699c3924817"
+SRC_URI[sha256sum] = "99c3376357bbe22cc8b6c78f560aa18d81621287695cd629008a6c4e66b77bf8"
 
 S = "${WORKDIR}/MIME-Types-${PV}"
 
-- 
2.7.4


