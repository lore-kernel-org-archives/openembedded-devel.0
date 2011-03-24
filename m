Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q2hXO-0002Ql-Ew
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 11:13:06 +0100
Received: by mail-bw0-f47.google.com with SMTP id 10so7237376bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 03:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=ucvCKm/DzmEJmDBVlq0dYwtb9Fe6JSnEebsfdmXXkeM=;
	b=r2qLKAjs9EM38mWeapNne3RepifB4QdHGvJZvWXArwqhu6rhJU52O7B80cPdZwldqA
	yJ1ti/M1taopaOFbkjh5bRozDhB+8qSd2EmJRKvDo7DTeUK09t5QDY8Rj15m57LcKZkd
	3VWhqIMMyZrau/XErV6UlzTQEmvcnuFH3KxhY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=luggEdyseR0UX8lvBnsoXRw2mZak6mG0hVUCwcd5M4JcMdYcTKwgh/4iEUiqcYtMn0
	qfFCnA0w2DoRqQnkSpptPrWzknZLewncImjjpvJBVi2h7w/LgYss/UVRovmrL1cJbLF8
	Yyt2VcniJ2Iuh7iB3AMsUvJ3BlBAOa7yR6it8=
Received: by 10.204.84.142 with SMTP id j14mr3260673bkl.20.1300961476749;
	Thu, 24 Mar 2011 03:11:16 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id l1sm6584754bkl.13.2011.03.24.03.11.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Mar 2011 03:11:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Mar 2011 11:11:09 +0100
Message-Id: <cc9318bd66867a951470d0f3e2720cfdcdd4c1a2.1300961186.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1300961186.git.Martin.Jansa@gmail.com>
References: <cover.1300961186.git.Martin.Jansa@gmail.com>
Subject: [PATCH 4/7] embryo: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 24 Mar 2011 10:13:06 -0000

---
 meta-efl/recipes-efl/efl/embryo.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/embryo.inc b/meta-efl/recipes-efl/efl/embryo.inc
index cc0a1a4..ab02905 100644
--- a/meta-efl/recipes-efl/efl/embryo.inc
+++ b/meta-efl/recipes-efl/efl/embryo.inc
@@ -1,5 +1,6 @@
 DESCRIPTION = "The Enlightenment C-like scripting language for Edje"
-LICENSE = "MIT BSD"
+LICENSE = "MIT BSD & CompuPhase"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6aa45e26c1ed178da910fd76b306a875"
 
 inherit efl
 
-- 
1.7.4.1



