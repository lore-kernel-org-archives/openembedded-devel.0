Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id BAAA6771D2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2016 19:32:41 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id x67so4185335qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2016 12:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=57KU0B+EtDdciEMwFE0E2k6/oX/4o+skasj3BJzpfkE=;
	b=P4u4IKA62HqTv31TdRPTXVoBNhp8fxfndgeZNscZWki6+TcEcdYgZCu7KJWZlAZ4CS
	crViSOuVNH/pV9S31e7eAf+dO3JJMkoZ2uayHHuvTLVjRmdsm6ui8SRz8C6/oJmXyz1L
	urqJ3BOGmcATFhE67XKKri6zTYARe0QdqsjENUjROYf8xj7TExMTVLaOl0ZGwMpldQ8i
	YDjgZ3q+HXLT3WlqBx+gMzF05dh7FskbuS5bBTWgIgQ0KIZzXpO/Bh7LAdbD2MA7wxJ2
	Aac4qvqcboPp1vHfoSaipGc5qxqS6cKDjzpEpxHmK05sDyaEL9Ng46U7sjE7CZ0h6yiF
	s2Sw==
X-Gm-Message-State: AEkoousWADfRRGSsrdScmByVKNxzSL+11voi0pmNCxyTRTw6RT+/RDf+bEXAUO1JdQdKFw==
X-Received: by 10.55.100.21 with SMTP id y21mr6271689qkb.281.1470857561894;
	Wed, 10 Aug 2016 12:32:41 -0700 (PDT)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id
	g29sm24107544qtg.12.2016.08.10.12.32.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Aug 2016 12:32:41 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Aug 2016 15:32:31 -0400
Message-Id: <1470857551-20244-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] python-pygobject: update to version 3.20.1
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
X-List-Received-Date: Wed, 10 Aug 2016 19:32:42 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-pygobject_3.18.2.bb => python-pygobject_3.20.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/python/{python-pygobject_3.18.2.bb => python-pygobject_3.20.1.bb} (86%)

diff --git a/meta-oe/recipes-devtools/python/python-pygobject_3.18.2.bb b/meta-oe/recipes-devtools/python/python-pygobject_3.20.1.bb
similarity index 86%
rename from meta-oe/recipes-devtools/python/python-pygobject_3.18.2.bb
rename to meta-oe/recipes-devtools/python/python-pygobject_3.20.1.bb
index 52ef425..77416d4 100644
--- a/meta-oe/recipes-devtools/python/python-pygobject_3.18.2.bb
+++ b/meta-oe/recipes-devtools/python/python-pygobject_3.20.1.bb
@@ -16,8 +16,8 @@ SRC_URI = " \
     file://0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch \
 "
 
-SRC_URI[md5sum] = "0a956f3e785e23b0f136832f2e57a862"
-SRC_URI[sha256sum] = "2a3cad1517916b74e131e6002c3824361aee0671ffb0d55ded119477fc1c2c5f"
+SRC_URI[md5sum] = "4354c6283b135f859563b72457f6a321"
+SRC_URI[sha256sum] = "3d261005d6fed6a92ac4c25f283792552f7dad865d1b7e0c03c2b84c04dbd745"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


