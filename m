Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 23FEE612E5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 May 2016 14:42:05 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id yl2so15881284pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2016 07:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=RKjx/pb+cLWjRu3IiDKqN8gBq6xOJ+2yamEkxMNwH80=;
	b=UdWM803X+bM4dapQ4PHA0uqz5/SfpDM+dvLEbcGuyJqMxi/GlncZFHBzR0gfwFu2br
	QHNVNb8lW25LXm+xyWDFB8nHW+ub/4g1dSwarLhOn6K4b0TLqI+uVqtHbm5N026WWGKV
	cF9q/tJGYpF9qqEOc8ZSRL76QRt0kIrIlDF7Dtr9alLRlxUFIm9vGIHKYAmU2Lmm+wDk
	x9XfvqBFV8EevMK7uTnwKK1na6clYYoRBUcmd1BFF4Zrh8l/RxiCpwOMeyrUXEWTdK8c
	E5y/b7dUq8e71qqEeBj2YpOG2vCbX3aNzq5ILyvfAlT77QOGYRwXY/i106ty7HakZxzn
	b8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=RKjx/pb+cLWjRu3IiDKqN8gBq6xOJ+2yamEkxMNwH80=;
	b=YHgnLDd+kk1n4BtfH0cOkNslHV+9/24OiZhl34wLz/zuEqmvL3+y8U8saXkffFHNCZ
	GrqJA2Bc8eE2P/3GyLLBtha9jahleknuqkXPCqLIPQybzPrOPnkghHTZ/8QT897z5dI3
	LSNX7p1LbtlItBpne2JkKyJdGjgTHKVK1j5kf4Kj5DkcEssLh5N0IOCLblYoKHp4FOrN
	dNgEkCpuPAOmD8JAksQmCJrvjSy97yvyRYZG4zHE+2HCEl2jQBEqApRYW5ZL5LEyCs7E
	7EKBl5WFlm5n4nr5J8/mCtqdYBPCSJ1grV7sHfGx58zLEqiagIGEnJIYTQpYHmE/EXia
	iakg==
X-Gm-Message-State: AOPr4FWeYwCpaDfq+3aiuDyc6jmcbj8RfjZ0It4LVk28/WFZJU81oeqkDvL8LkjGB8QOtQ==
X-Received: by 10.66.67.11 with SMTP id j11mr50855777pat.45.1462804926781;
	Mon, 09 May 2016 07:42:06 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	yp9sm41314880pab.42.2016.05.09.07.42.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 May 2016 07:42:05 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org, TicoTimo@gmail.com,
	akuster808@gmail.com
Date: Mon,  9 May 2016 07:42:04 -0700
Message-Id: <1462804924-19297-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-python][master][krogoth][PATCH] python-numeric: Add LLNL license
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
X-List-Received-Date: Mon, 09 May 2016 14:42:06 -0000

WARNING: python-numeric-24.2-ml3 do_populate_lic: python-numeric: No generic license file exists for: LLNL in any provider

copied from sources.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/licenses/LLNL | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/licenses/LLNL

diff --git a/meta-python/licenses/LLNL b/meta-python/licenses/LLNL
new file mode 100644
index 0000000..1127d56
--- /dev/null
+++ b/meta-python/licenses/LLNL
@@ -0,0 +1,16 @@
+Legal Notice
+
+*** Legal Notice for all LLNL-contributed files ***
+
+Copyright (c) 1996. The Regents of the University of California. All rights reserved.
+
+Permission to use, copy, modify, and distribute this software for any purpose without
+fee is hereby granted, provided that this entire notice is included in all copies of any software which is or includes a copy or modification of this software and in all copies of the supporting documentation for such software.
+
+This work was produced at the University of California, Lawrence Livermore National
+Laboratory under contract no. W-7405-ENG-48 between the U.S. Department of Energy and The Regents of the University of California for the operation of UC LLNL.
+
+DISCLAIMER
+
+This software was prepared as an account of work sponsored by an agency of the United States Government. Neither the United States Government nor the University of California nor any of their employees, makes any warranty, express or implied, or assumes any liability or responsibility for the accuracy, completeness, or usefulness of any
+information, apparatus, product, or process disclosed, or represents that its use would not infringe privately-owned rights. Reference herein to any specific commercial products, process, or service by trade name, trademark, manufacturer, or otherwise, does not necessarily constitute or imply its endorsement, recommendation, or favoring by the United States Government or the University of California. The views and opinions of authors expressed herein do not necessarily state or reflect those of the United States Government or the University of California, and shall not be used for advertising or product endorsement purposes.
-- 
2.3.5


