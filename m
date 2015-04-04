Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8494273C60
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Apr 2015 16:49:41 +0000 (UTC)
Received: by pdbnk13 with SMTP id nk13so75425962pdb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Apr 2015 09:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=D2/FOPrCaaY9n2g2Gwix8LPuBc4RTqLcsZgK8o3ui8s=;
	b=nQ0K3WEeMNVtFoCinxntQ/PzuUXIKFEgw9k1uVflvOisRe+CJj1YVVeAdHoYNzT45F
	L7n9nlbUKU0fY9X4tDpqr3ZYdT8lCnukLJlGcQVl3pr6XJR90F3PcCV7VwIG8RnJJaHR
	jSk+NE+aMwTwz+aDhLb8IjOaDBC4SXr7sj8G72CHFynDOGg1mIHkjymdaubCQgNZs8Kj
	aZkOn1wmuEyTkTrYKGqN3BWNlVdd+P9klJfPR53/wYgfSCYy8yR8clgkpMIqIJdxF8/M
	19Zjx80GqxxdFVjENAhA4zLuA8//+plOtiaAaRvW+EnxIWIwxRWR+bqBuHUFoOqwJLJL
	kIxA==
X-Received: by 10.66.149.106 with SMTP id tz10mr13552269pab.90.1428166182513; 
	Sat, 04 Apr 2015 09:49:42 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	li10sm11487391pbc.33.2015.04.04.09.49.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 Apr 2015 09:49:41 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat,  4 Apr 2015 09:49:36 -0700
Message-Id: <cover.1428166003.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH 0/1 V2] Add Fido maintainers
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
X-List-Received-Date: Sat, 04 Apr 2015 16:49:42 -0000

squashed commits.

please consider these maintainers for fido

The following changes since commit df6c7b1279790d27ebfd58fbdfbac89bde5782ec:

  python-pyopenssl: Upgrade to 0.14 (2015-03-21 16:42:30 +0100)

are available in the git repository at:

  git://github.com/akuster/meta-openembedded.git akuster/fido-next
  https://github.com//tree/akuster/fido-next

Armin Kuster (1):
  fido README: update maintainers list

 meta-efl/README             | 13 +++++++------
 meta-filesystems/README     | 14 +++++++++-----
 meta-gnome/README           | 12 +++++++-----
 meta-gpe/README             | 13 +++++++------
 meta-initramfs/README       | 11 ++++++-----
 meta-multimedia/README      | 14 +++++++-------
 meta-networking/MAINTAINERS |  8 ++++++--
 meta-networking/README      |  6 +++---
 meta-oe/README              | 11 ++++++-----
 meta-perl/README            | 10 ++++++----
 meta-python/README          | 11 +++++++----
 meta-ruby/README            | 12 +++++++-----
 meta-systemd/README         | 11 +++++++----
 meta-webserver/README       | 13 ++++++++++---
 meta-xfce/README            | 11 ++++++-----
 toolchain-layer/README      |  9 ++++++---
 16 files changed, 107 insertions(+), 72 deletions(-)

-- 
2.3.5


