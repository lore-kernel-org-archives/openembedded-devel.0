Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi5Q-0002oS-G7
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:18:16 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1377891eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=KOdTVKrSNdBsbmKRhWbHHWfWCh6LfrOA7V9ey+iCZpc=;
	b=penS9eSkuPGwWwNg7PefTSE9f5P0HOyumTzMweOAmRZ6Ez7ZkjzxH6q47K6dJfRgbu
	GayTlNoOGYfOL3raMgr96XonpANLohASUhhxBvPevc1U4KIUs8nshHSUXPF+7XrLYGKe
	IpXPthz1qEiWfNulHrN/i95j8pKtT5pWR7Hm6uo7ssRC91imbrwHH7wU8kKNN2h/UZ1j
	t+X1vkGUqaZUnik4Vw7R19LQttK1l65wW6vgR6wDyL+fzqiVxRulNvkzeQSNP2XcFQP/
	d/NIrlsiIHx3H2VPt6WrWQ1LU/Or07BTdapPhVuRaJudrVxs4OBMDiLgSgj2Mf/FVmiu
	/SDQ==
Received: by 10.14.223.200 with SMTP id v48mr42897494eep.24.1354586636882;
	Mon, 03 Dec 2012 18:03:56 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e1sm34814226eem.3.2012.12.03.18.03.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:03:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:59:04 +0100
Message-Id: <871f2119c3109698471db6fb5ccfd1bdfe3e7b27.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 31/58] gnome-terminal: add LICENSE version and LIC_FILES_CHKSUM
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
X-List-Received-Date: Tue, 04 Dec 2012 02:18:16 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gnome/gnome-terminal_2.26.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.26.3.bb b/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.26.3.bb
index ac4cc00..a177797 100644
--- a/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.26.3.bb
+++ b/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.26.3.bb
@@ -1,5 +1,6 @@
 DESCRIPTION = "GNOME Terminal"
-LICENSE = "GPL"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5b51eba4ba4cafe64073227530c061ed"
 DEPENDS = "gtk+ glib-2.0 startup-notification dbus-glib vte"
 PR = "r2"
 
-- 
1.8.0



