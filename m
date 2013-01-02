Received: from mail-ee0-f53.google.com ([74.125.83.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TqQHy-0000Xt-RK
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jan 2013 16:31:30 +0100
Received: by mail-ee0-f53.google.com with SMTP id c50so7118496eek.40
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jan 2013 07:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=Zkz1SE4SN35ZbV3AX/M9A6m9b7C6mCVI0L53au5W9LM=;
	b=djtlbfdTLfZwagYHwM8TpFzlqgzIiPkHyl5OIEoUp62bwIxZKtkLPo3NQ1hywscuO2
	EdUWXzfnwOZIfK6ccvXoXnzJUI3wr2qPUes1HIKUcXteM0u3quIKqwzKBkIN586RDX7V
	1t+aJ+6C9bUp07WoghonnuKRv1pZRDf3aPCeQCS4pPz3LzR2z4Bw4uLvVtU7cX6kFGDA
	TLeGXP+UKIphLF1YKb7CMYX2rlY9H8WmvmWeqY3Yl+kES139lI6FyGc4trgAJb2WvMh7
	2c7x14h/4gnBCH/WLjiApv6DUPTx6WKONi5lDXDi8Q28tBn+/hSf4Ikn2hY+bfpjEmuF
	4OrQ==
X-Received: by 10.14.176.66 with SMTP id a42mr126024507eem.34.1357139788656;
	Wed, 02 Jan 2013 07:16:28 -0800 (PST)
Received: from localhost.localdomain (p4FDF1C58.dip.t-dialin.net.
	[79.223.28.88])
	by mx.google.com with ESMTPS id b2sm98071345eep.9.2013.01.02.07.16.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Jan 2013 07:16:27 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jan 2013 16:16:06 +0100
Message-Id: <1357139774-4364-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1357139774-4364-1-git-send-email-schnitzeltony@googlemail.com>
References: <1357139774-4364-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/meta-gnome/V2 02/10] tumbler: update to 0.1.26
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
X-List-Received-Date: Wed, 02 Jan 2013 15:31:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{tumbler_0.1.25.bb => tumbler_0.1.26.bb}       |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_0.1.25.bb => tumbler_0.1.26.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.25.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.26.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/tumbler/tumbler_0.1.25.bb
rename to meta-xfce/recipes-xfce/tumbler/tumbler_0.1.26.bb
index 3c2c2b3..a066713 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.25.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.26.bb
@@ -6,8 +6,8 @@ DEPENDS = "dbus-glib freetype gdk-pixbuf poppler"
 
 inherit xfce
 
-SRC_URI[md5sum] = "d4edc15c172714c7a3eaf3c719b8faf6"
-SRC_URI[sha256sum] = "02d5de508d8c18692a25a832a9280c2043f6b7c90dd3fcbd87f5955337015546"
+SRC_URI[md5sum] = "874621e7820b3bfe0e8ab66d17f1dc31"
+SRC_URI[sha256sum] = "6602ce700160d09edd88ea0b9bcb16abbc28974f372e646709e0ed8fbacc8a78"
 
 INSANE_SKIP_${PN} = "dev-so"
 
-- 
1.7.4.4



