Return-Path: <akuster808@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 72F8F736B6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Apr 2015 23:43:46 +0000 (UTC)
Received: by igcau2 with SMTP id au2so62698149igc.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Apr 2015 16:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=QkoBTd6ODLhoEp29a970LDBsr1pzqQptjopESp4N3QQ=;
	b=kEcCNQ9WU6jqTl8X1O7Zfz72vc9tUvvvP5hCq7AAWNAcupG4jrvbru5tp3xl8G5C9J
	T2+Ge9Xc0bSunAlKiGcu85nxa2E5+qHDEjVvHTCOAHnROsQTTCIXscIFrRHBaWAuGYvX
	bTeCsuJjJbfqVdDNkQrm5fWlwPgZGwNhttJTz+mV3FrHhTwHTHPYh3ENO0Lu/LFF3Cb5
	/c7eeGhLFcoLFDDtaui9pFtOyPubs+KhGYzyXOpIBkT3bsUlinpVwKzdFKq43eNB6RSE
	o8T4FVCSyyF0wk9tPsVetfJ9rMPgdC4KSP40xDvU974IkeGXF16aVZ+/SYt4V7VKbAkA
	iggQ==
X-Received: by 10.107.166.11 with SMTP id p11mr67659547ioe.30.1427931827157;
	Wed, 01 Apr 2015 16:43:47 -0700 (PDT)
Received: from Pahoa2.mvista.com (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id d75sm2155298iod.35.2015.04.01.16.43.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Apr 2015 16:43:46 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Wed,  1 Apr 2015 16:43:34 -0700
Message-Id: <cover.1427931203.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 00/15] Fido add maintainers
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
X-List-Received-Date: Wed, 01 Apr 2015 23:43:48 -0000

please consider these maintainers for the meta-openembdded fido branch

The following changes since commit df6c7b1279790d27ebfd58fbdfbac89bde5782ec:

  python-pyopenssl: Upgrade to 0.14 (2015-03-21 16:42:30 +0100)

are available in the git repository at:

  https://github.com/akuster/meta-openembedded akuster/fido-next
  https://github.com//tree/akuster/fido-next

Armin Kuster (15):
  meta-efl: update maintainers list
  meta-filesystems: update for fido maintainer
  meta-gnome: update maintainers list
  meta-gpe: update maintainers list
  meta-initramfs: update maintainers list
  meta-multimedia: update maintainers list
  meta-networking: update maintainers list
  meta-oe: update maintainers list
  meta-perl: update maintainers list
  meta-python: update maintainers list
  meta-ruby: update maintainers list
  meta-systemd: update maintainers list
  meta-xfce: update maintainers list
  meta-webserver: updated maintainers list
  toolchain-layer: update maintainers list

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
1.9.1


