Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id C9F61605D2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 11:09:07 +0000 (UTC)
Received: by pabrc13 with SMTP id rc13so51869590pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 04:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=/CiEdaFS+08pgXP9y6LYg31XlgX/6tSkz0+saOmgUtM=;
	b=XZyEojZYqSUdfhtnI7+eu7pATTRjONj9FqBImQFbyse5kv2c0pX4nUpzUsAeqaeaoM
	dUBF+/6OVBTKva5RlzEg//Avsl+sFBFKDd1lSS3FWUiR1MKvrbKu1hvb0pcIaK9kjmQV
	ug75halhauZGngF7Nzk8XJoPtq9c32TKVPVRpdd28Mts6vqdvdFuIux+c9UVKFdkU1Ef
	eBGMZWRe3lYDRFxt4ZFIPZ+Rck1/fdtCCOjvVMdV1FGrXLrS946awVH26C9Y2g0fn79d
	divhegT2drV0ff8edZw6i/MLXopfgiI+VRs4jtYzzym8eoYIJ4PFvCWfFyw+piLpabpq
	Wo1A==
X-Received: by 10.66.193.162 with SMTP id hp2mr3133663pac.108.1444820947821;
	Wed, 14 Oct 2015 04:09:07 -0700 (PDT)
Received: from Pahoa2.mvista.com ([192.165.183.201])
	by smtp.gmail.com with ESMTPSA id w9sm9060420pbt.29.2015.10.14.04.09.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 Oct 2015 04:09:06 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	martin.jansa@gmail.com
Date: Wed, 14 Oct 2015 04:08:57 -0700
Message-Id: <cover.1444820761.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH 0/1] Add Jethro maintainers
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
X-List-Received-Date: Wed, 14 Oct 2015 11:09:08 -0000

Please consider myself as a maintainer for jethro branch

The following changes since commit 47f7d287a09329734629cb9d194ef4e077117d79:

  gnome-keyring: blacklist gnome-bluetooth, gvfs: try to build with libgnome-keyring only (2015-10-13 12:28:17 +0200)

are available in the git repository at:

  git://github.com/akuster/meta-openembedded jethro
  https://github.com/akuster/meta-openembedded/tree/jethro

Armin Kuster (1):
  README: update maintainers list for jethro

 meta-efl/README             | 12 ++++++------
 meta-filesystems/README     | 12 +++++++-----
 meta-gnome/README           | 11 ++++++-----
 meta-gpe/README             | 12 ++++++------
 meta-initramfs/README       | 10 +++++-----
 meta-multimedia/README      | 13 ++++++-------
 meta-networking/MAINTAINERS |  7 +++++--
 meta-oe/README              | 10 +++++-----
 meta-perl/README            |  9 +++++----
 meta-python/README          | 14 ++++++--------
 meta-ruby/README            | 11 ++++++-----
 meta-systemd/README         | 12 ++++++------
 meta-webserver/README       | 12 +++++++-----
 meta-xfce/README            | 11 ++++++-----
 14 files changed, 82 insertions(+), 74 deletions(-)

-- 
2.3.5


