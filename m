Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6AD5D780CE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 18:07:29 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id j13so10612327qta.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 11:07:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iwD966sxl6mvVdM84Ii5yf47Y5IAgJXPGePd6Tc8Kq4=;
	b=AIM77iD7wL+u0DZsrrRvEr7I+6JQAU4LbJTMdVZ2NakqLs2eK2KCy06lwsww1j41+V
	fFcyWhmGsy5knPwGKwvmceVff305Hrq/4Nwb71d6XrMJ4d/fvgq3Gi0JLr3RJLl91tF6
	+Iwh8iU22Y6pfZCZQmstZ0kZtnjcAfLRMpI900E60XXqLgXOhHnTvyk8jZJAmIRV5cPq
	k+/uTyomlDBbJ03CXMsQlXFM7FO+2XM1G2AFNvk3flCsxZ8GCGVVf3iek9Mj3LtADERs
	trJLZBoCoV00WSwEaE3I114DKmFoEi2MULa/+mN6f/RcadS68yEQuQ1pNqnHCv/eLw5R
	UAnQ==
X-Gm-Message-State: AODbwcBlI1REMy7K+6H2WVO4+Ju54UppySny4DhLbB+NO/kEYv1t/pAq
	v7+4NUonuBebsPMtmHM=
X-Received: by 10.200.52.221 with SMTP id x29mr10334603qtb.70.1495217251281;
	Fri, 19 May 2017 11:07:31 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224])
	by smtp.gmail.com with ESMTPSA id h3sm6449853qte.11.2017.05.19.11.07.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 May 2017 11:07:30 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 May 2017 14:07:24 -0400
Message-Id: <1495217244-1972-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyro4: update to version 4.59
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
X-List-Received-Date: Fri, 19 May 2017 18:07:30 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python-pyro4/{python-pyro4_4.55.bb => python-pyro4_4.59.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-connectivity/python-pyro4/{python-pyro4_4.55.bb => python-pyro4_4.59.bb} (70%)

diff --git a/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.55.bb b/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.59.bb
similarity index 70%
rename from meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.55.bb
rename to meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.59.bb
index cc28a81..834f7a1 100644
--- a/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.55.bb
+++ b/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.59.bb
@@ -2,8 +2,8 @@ SUMMARY = "Python Remote Objects"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=378acef375e17a3bff03bd0f78c53220"
 
-SRC_URI[md5sum] = "0400a4d260dbeaa4e7e725c4ba310ead"
-SRC_URI[sha256sum] = "49a7a142542d87dde1cecc8d3ee048ec9481ba861d61234d219fadd06e6ced96"
+SRC_URI[md5sum] = "a93a41038dba964011772e0d3e4651a0"
+SRC_URI[sha256sum] = "6a39dadbd2a83b6fd5ab7f5402f8a4befd467b5c0404b8610a8797f748b72a38"
 
 PYPI_PACKAGE = "Pyro4"
 
-- 
2.7.4


