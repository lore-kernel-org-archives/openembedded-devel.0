Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi53-0002oS-F3
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:17:54 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1377891eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Ywkbaob/Je7UblnsDryGuXHp654X+4G4fsMn5odfGRs=;
	b=npCIhB0ICwSgpRJX4N8hXSiyOExpDCR7sZ9GtsjjE3fMz5g02td7KpCz+9h2TeDlFP
	sa8Op8pt6vM/lrR/T96QSNIX5aU7Agpg8CaR9eqPGT0jj2hZf4UyoYDDG40+gFtKopI9
	r4K0YMzkHQptha1ms1ODkPKX22r8QbSBKOU5myg7Lj4Mot6HgVx0m+3eI6YeWDiN40t8
	ylxC9NJ3AvQbfEvaGsQr4/c7BdvC+Iz4egR6/KamvyA3bsfPl2eAY50PyAYk7tK8NWPc
	51jX26byhD1maR895HE2kJr+bzY9WPvbZvIyn0UIyDXrKQz4tg1xNGaJMzLtFseQAT0f
	eKKw==
Received: by 10.14.215.194 with SMTP id e42mr42864160eep.32.1354586610425;
	Mon, 03 Dec 2012 18:03:30 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q44sm34808704eep.5.2012.12.03.18.03.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:03:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:59:01 +0100
Message-Id: <0c3c5a0a13dadb7047fd5abeef0744d75c02f91c.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 28/58] xorg-sgml-doctools: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Tue, 04 Dec 2012 02:17:55 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.7.bb b/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.7.bb
index 55f4bac..502723c 100644
--- a/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.7.bb
+++ b/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.7.bb
@@ -2,6 +2,8 @@ require xorg-doc-common.inc
 PE = "1"
 PR = "${INC_PR}.0"
 
+LIC_FILES_CHKSUM = "file://COPYING;md5=c8c6c808cd3c797a07b24e443af1c449"
+
 SRC_URI[md5sum] = "2588efb3f49f7fc6ecf41ce42e0b2e5e"
 SRC_URI[sha256sum] = "84fd94e5c50556e6f77501485f8a48724cf3c95c6d58480bc280258ba14580c8"
 
-- 
1.8.0



