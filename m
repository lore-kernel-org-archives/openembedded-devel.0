Received: from mail-da0-f48.google.com ([209.85.210.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UBsdz-0007lO-4n
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Mar 2013 21:03:05 +0100
Received: by mail-da0-f48.google.com with SMTP id w4so1900149dam.21
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Mar 2013 11:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=btU5boXXA6fo7ZJCRNJtekEtq0lFewXL4YX2nzVAZd8=;
	b=hKa4WMalt/Rsqwz+dBrMA+Idh9N/WLyyoUiP+d6xlGfmLgH/lToDb0ind4OOHmnY0t
	GK0n7tm1700h3bl4HhipTBXn+Octrvmk/Dd2CvfGZGAb2MLtp+8qi29EGKbvkKNUkDtg
	V9jrqV3eWh+T2QOY9XomVniCiGKTJx1N2J6wKJ5PIQB2zHH0FN5+MsTKMWjHXbZgyrdR
	uR+0YtC4UovfYKQA7dxR8WhP+sgAzyWjwV1wNxGHuHW4O5sGyazIS8hN1uD/63/ICI8n
	eYuC4mWvZWvngNERcCkJ6zle/ZAZ2h0Yo7XsxmRtYNYGHDuVz3TCMWPFbtxdgI1SM96u
	YJvg==
X-Received: by 10.66.72.198 with SMTP id f6mr24729421pav.42.1362253589128;
	Sat, 02 Mar 2013 11:46:29 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id pn9sm16408790pbb.22.2013.03.02.11.46.26
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 02 Mar 2013 11:46:28 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Mar 2013 20:46:18 +0100
Message-Id: <1362253578-31458-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [meta-browser][PATCH] nspr: rename bbappend to match new version from oe-core
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
X-List-Received-Date: Sat, 02 Mar 2013 20:03:07 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-support/nspr/{nspr_4.9.4.bbappend => nspr_4.9.5.bbappend} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-support/nspr/{nspr_4.9.4.bbappend => nspr_4.9.5.bbappend} (100%)

diff --git a/recipes-support/nspr/nspr_4.9.4.bbappend b/recipes-support/nspr/nspr_4.9.5.bbappend
similarity index 100%
rename from recipes-support/nspr/nspr_4.9.4.bbappend
rename to recipes-support/nspr/nspr_4.9.5.bbappend
-- 
1.8.1.4



