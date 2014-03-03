Return-Path: <net147@gmail.com>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 83C216F558
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Mar 2014 10:55:09 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id ma3so3494269pbc.41
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Mar 2014 02:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=7ZP+lAmAgCdwFrh4ubQQChsfhD6U/D5xCjm+jLb2LXc=;
	b=X7i4aK/pl/QiUPdNu4sE8n1ZWHyvHOixBDxTUXXA31E11xO7qDXMN75IOfBTHu1Iv1
	GPs5W6Hyf11NthduYoIXc1gK+29BVXYf9wlINsbLlyNzIbYWrpyxsBlN8lbjUidi61sX
	QDZxNUv+j63k7dCYM9dM1iwH6iSE1Y9VxHeHojP+sWSz89F8rlOv6wmOSvRTkprq78/Z
	SYcLXkJRLjZlct1YiZ1KUgCxjFopzcHaB8OAJ8h8abcz/NuAqlIs3CKEwBc8R5Xk0SDz
	Tr9X0yA+yxe/Z3ncJ9GnEQP2KwacaynSL+KndRhz/0DACvxftpvJ41dzZ7WCs/pN/kTx
	g5EQ==
X-Received: by 10.66.138.40 with SMTP id qn8mr2378217pab.154.1393844110585;
	Mon, 03 Mar 2014 02:55:10 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	pp5sm34894701pbb.33.2014.03.03.02.55.07 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Mar 2014 02:55:09 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Mar 2014 21:59:53 +1100
Message-Id: <1393844393-22037-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [meta-qt5][PATCH] cmake: rename .bbappend to match new version from OE-core
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
X-List-Received-Date: Mon, 03 Mar 2014 10:55:12 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../{cmake-native_2.8.12.1.bbappend => cmake-native_2.8.12.2.bbappend}    | 0
 .../cmake/{cmake_2.8.12.1.bbappend => cmake_2.8.12.2.bbappend}            | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename recipes-devtools/cmake/{cmake-native_2.8.12.1.bbappend => cmake-native_2.8.12.2.bbappend} (100%)
 rename recipes-devtools/cmake/{cmake_2.8.12.1.bbappend => cmake_2.8.12.2.bbappend} (100%)

diff --git a/recipes-devtools/cmake/cmake-native_2.8.12.1.bbappend b/recipes-devtools/cmake/cmake-native_2.8.12.2.bbappend
similarity index 100%
rename from recipes-devtools/cmake/cmake-native_2.8.12.1.bbappend
rename to recipes-devtools/cmake/cmake-native_2.8.12.2.bbappend
diff --git a/recipes-devtools/cmake/cmake_2.8.12.1.bbappend b/recipes-devtools/cmake/cmake_2.8.12.2.bbappend
similarity index 100%
rename from recipes-devtools/cmake/cmake_2.8.12.1.bbappend
rename to recipes-devtools/cmake/cmake_2.8.12.2.bbappend
-- 
1.9.0


