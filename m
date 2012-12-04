Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi3y-0002oS-NS
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:16:47 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1377891eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=FRMbstbX1MqWDPQRhbMFLDKUnImJ6tpqiHcpplXXGIQ=;
	b=YDO1ElA4mPT9fHQS/5lGKwaSsWV1VbLpGxXtynjXNUP65kQfhzbDY5DURivXtfNyNC
	t3/kQEyknr7wNc5yTiXi/6kWi/rQa+7TQWbOCUUIxJ3Cg12mkqKODKAxzpV7R4r4q1t5
	FStn1Cw2W76IbSWPLJOYSMD58WotrpLPqYX2XDYujDFwcb20xFV7QzDuivysNUdgXg+y
	NqkYaPtKorRN2QYj2g6Nj2s0LsHETk8nyvzRAG2nNN15ibOdbB+Tmjk/Wqe6eEYNg/bU
	k4fOV5SPHvTyCJP/bJ1i/5dp+B0/mcnkAuL37QHqbWPf6G4SWK13MhAQmfWHZBFH18K8
	dgdw==
Received: by 10.14.177.1 with SMTP id c1mr42749043eem.8.1354586545086;
	Mon, 03 Dec 2012 18:02:25 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d3sm8833257eeo.13.2012.12.03.18.02.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:02:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:58:53 +0100
Message-Id: <3dba14c46c853c238e8549e814de8b15a0d96495.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 20/58] exquisite: add LIC_FILES_CHKSUM
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2012 02:16:47 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/exquisite_svn.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-efl/recipes-efl/e17/exquisite_svn.bb b/meta-efl/recipes-efl/e17/exquisite_svn.bb
index a25c4b3..62453b8 100644
--- a/meta-efl/recipes-efl/e17/exquisite_svn.bb
+++ b/meta-efl/recipes-efl/e17/exquisite_svn.bb
@@ -1,5 +1,6 @@
 DESCRIPTION = "A psplash replacement for display"
 LICENSE = "MIT BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=14defa372a91118e755133bc8e6aff83"
 DEPENDS = "eet evas ecore embryo edje"
 PV = "0.0.1+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
-- 
1.8.0



