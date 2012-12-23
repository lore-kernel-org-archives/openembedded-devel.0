Received: from mail-ee0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TmknY-0000kh-L0
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 13:36:58 +0100
Received: by mail-ee0-f41.google.com with SMTP id d41so3102221eek.14
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 04:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=nJMvAPCvsj8mdMsy58iBlOEzycybZFk45eTia9CzTTE=;
	b=JepiAbIFDK2f+HRykJyRcvrEh4ywChpFHIy351BsJLiXbb9x05iWlmySuvPAK7Bjn2
	4H6VYxafwVOQy7/cesT7RsznVGDWEWnXh+8EE0WAMGPyb7XPXg0Sf2gf+9y8pdv73S0H
	F19Z2v4mdtbucw8fSGmfKuZF3XNHWIfjBwWaym4HuAdnLsFddjV+uG2zAoV303+Dsv29
	ZXXSnodIwjR1Ez5YobLobdCcxJEp3L97yy7HQiyiLmw9G/lQrfpCEKWSwmk6VyaDBj8c
	ReEX5wpb/f7od1dodrjnZwAt11bK4b4VozmAVqbQjpidKjYuxgpnSZqwoXcDsMntvKQx
	oNUg==
X-Received: by 10.14.0.133 with SMTP id 5mr47371896eeb.29.1356265328352;
	Sun, 23 Dec 2012 04:22:08 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id f49sm34549506eep.12.2012.12.23.04.22.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 04:22:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 13:21:26 +0100
Message-Id: <0bc442eef0402e65090c76fc492436b9ce78f5b6.1356264861.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 01/30] e-base: bump EFL_SRCREV for E17 zero
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
X-List-Received-Date: Sun, 23 Dec 2012 12:36:58 -0000

* alias final Enlightenment 0.17 version
* announcement: http://www.enlightenment.org/p.php?p=news&l=en

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index ad29726..1eb0eab 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -2,7 +2,7 @@ HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 SRCVER ?= "${PV}"
 
-EFL_SRCREV ?= "81287"
+EFL_SRCREV ?= "81627"
 
 ARM_INSTRUCTION_SET = "arm"
 
-- 
1.8.0.2



