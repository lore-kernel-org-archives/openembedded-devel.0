Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 347B572EED
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 14:13:34 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id l27so15335967pfk.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 07:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=HqoeSVwUrKwJTjYeMEhYnI9FDaj6o4WkfY39iKI9aWs=;
	b=haXXQA8A3etA5Ct8+aj4dKalDQhntWormAZyfpEzY251WGN2m2C9+gRC4Y1MyweWrn
	JBXCKlKeYqkFKx+8k+WX9RwAY20JThqI3XoAF2hafhbe79Ys790XIIwIPUa1ZxmLrBmL
	nqm/QxnyiU4/n9kjjOemP5zN9l8dzQJhzitBCXeHO1ADYp0qBMNCq5FCDAbMXynuz0sA
	OLfyVitLnSp2ppJBKam7mgrgWL7BseZ0AhXkKUK8qkstRojrEuhk6p9p46KwHO+9Dzb7
	pK2skI3lwVX7Vv9RzT6yv7s8oRp8YeDKWQ7kWoXHho0/zRe+AUuMh5obakIdq9yfAV0L
	0TRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=HqoeSVwUrKwJTjYeMEhYnI9FDaj6o4WkfY39iKI9aWs=;
	b=HywvRE9s6PlaXYvdPNrTRV5uly3B7CqRikGOdJl5FHNCny6fxnZClDkKLF692qz1o0
	Dmit61ow28mC5fmnqUn1p2ace+mYvX77031Hg8KCYATQkFnzuzrQ7lnupG8ErueZlP7i
	dMBCEpVKYxwBbrWUev713XNA6+orM8K15eAX3sZIxz66aR4BeiB071a6iNMy9c55QhKp
	kMNWS1SC+V4Qc083nB0khsUU0q4HycDjXa/IHeAC/VoBXkpkayDNEDTH2E5km/m/TtrM
	5oB0eH5aF+LxgYT8jMvd5+jhv5A9jHU13k8xtzuiuPj5dPefpkLokwY5GpUFYNesy6T9
	tVHg==
X-Gm-Message-State: ALQs6tAHnNH0pCkM/kYS+G5qAxwI/RKGSS2RAYwvhEQqvbQqsJhuG7hm
	W1mSxAwtnYqo5BE8ukvfGcI=
X-Google-Smtp-Source: AIpwx49ZaQb8ezAzSMqHKSIgdtv+9LhBek1pfL+zUIwZWcguQ4se1sYpdwzKeIJ4mPhLkPOEo6MuSQ==
X-Received: by 2002:a17:902:30f:: with SMTP id
	15-v6mr29489006pld.365.1524665615942; 
	Wed, 25 Apr 2018 07:13:35 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:952a:dcb5:7c5a:56df])
	by smtp.gmail.com with ESMTPSA id
	e4sm35563566pfa.128.2018.04.25.07.13.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Apr 2018 07:13:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed, 25 Apr 2018 07:13:27 -0700
Message-Id: <1524665609-7709-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1524665609-7709-1-git-send-email-akuster808@gmail.com>
References: <1524665609-7709-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 4/6] schroedinger: refresh patch
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
X-List-Received-Date: Wed, 25 Apr 2018 14:13:35 -0000

Applying patch configure.ac.patch
patching file configure.ac
Hunk #1 succeeded at 54 with fuzz 2.

Now at patch configure.ac.patch

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../schroedinger/schroedinger/configure.ac.patch                  | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/schroedinger/schroedinger/configure.ac.patch b/meta-multimedia/recipes-multimedia/schroedinger/schroedinger/configure.ac.patch
index 2ed8d22..838400f 100644
--- a/meta-multimedia/recipes-multimedia/schroedinger/schroedinger/configure.ac.patch
+++ b/meta-multimedia/recipes-multimedia/schroedinger/schroedinger/configure.ac.patch
@@ -5,10 +5,10 @@ Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 
 Upstream-Status: Inappropriate [configuration]
 
-Index: schroedinger-1.0.9/configure.ac
+Index: schroedinger-1.0.11/configure.ac
 ===================================================================
---- schroedinger-1.0.9.orig/configure.ac
-+++ schroedinger-1.0.9/configure.ac
+--- schroedinger-1.0.11.orig/configure.ac
++++ schroedinger-1.0.11/configure.ac
 @@ -54,7 +54,7 @@ if test "x${HAVE_ORC}" != xyes ; then
    AC_ERROR([orc-0.4 >= $ORC_VER is required])
  fi
@@ -16,5 +16,5 @@ Index: schroedinger-1.0.9/configure.ac
 -ORCC=`$PKG_CONFIG --variable=orcc orc-0.4`
 +ORCC=$STAGING_DIR`$PKG_CONFIG --variable=orcc orc-0.4`
  AC_SUBST(ORCC)
+ AM_CONDITIONAL(HAVE_ORCC, test "x$cross_compiling" != xyes)
  
- AC_ARG_WITH([thread],
-- 
2.7.4


