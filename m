Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7DA3C60E7E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2013 09:04:41 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id r16so1890002ead.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2013 02:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=t5sGn2ASMRYGc+AW/TAgIYMTl2+8MpsxYdnjPe/LEss=;
	b=TAwvv5v4fO1DMeJBODQfMmBaA+n1duLI7+J7QEY0sM7jCtrHM3gbW8nyDbVVk9I3R7
	IDm3TpVgGgCk+SsP2Gd/g8YMZAFWPebzNUIk8WOnJ0pcpf51MSDHhKw1+2Atlpcbvgcz
	rVTmCS72wK8D+12oZpG6mALHi3f/J4FNmzp1UFTxM7xImVAGp+wuRgRco2RDicdRqNjk
	5Vb5rErAqyWrnd3DOSI0Jg9xA82zAl4E+bZ0WIP8D1cHkABoXOHsWpUUUl/UEq6M3xv3
	e6Iu7NnU1Kc0JttRoNKmUzvWVFV8POPhSxdJN66qG5tfPTJxdpo8dG8/JQOpCjSw9vLh
	+I7g==
X-Received: by 10.14.99.196 with SMTP id x44mr670729eef.83.1379322283115;
	Mon, 16 Sep 2013 02:04:43 -0700 (PDT)
Received: from localhost.localdomain (ip-178-200-247-59.unitymediagroup.de.
	[178.200.247.59])
	by mx.google.com with ESMTPSA id f49sm40119433eec.7.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 16 Sep 2013 02:04:42 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2013 11:04:19 +0200
Message-Id: <1379322259-3831-10-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1379322259-3831-1-git-send-email-schnitzeltony@googlemail.com>
References: <1379322259-3831-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce 9/9] packagegroup-xfce-extended: add xfce4-equake-plugin
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Sep 2013 09:04:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../packagegroups/packagegroup-xfce-extended.bb    |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index e2ed864..059d8c9 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -42,6 +42,7 @@ RRECOMMENDS_${PN} = " \
     xfce4-mount-plugin \
     xfce4-brightness-plugin \
     xfce4-closebutton-plugin \
+    xfce4-equake-plugin \
     \
     thunar-media-tags-plugin \
     thunar-archive-plugin \
-- 
1.7.6.5


