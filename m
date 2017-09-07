Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id F31E577DA3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Sep 2017 06:45:54 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id d8so4569018pgt.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Sep 2017 23:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iqJkvunXqTK6V0bqYwlcqZnB5JLxNsHX0y1JZcrFMTA=;
	b=IKNboWCrIn9PHmZbimRvnVhY6tYvg1+DWBI50DMZK025S11+6dwx+2ckO5aRzH+5Nm
	50L/UasWcRKuGP9cK/rW3AZ+1CQ7OevyGCg1D7WhbZoGU5Lj8Gn2MuDmGPQly2KhZed1
	PqYrTx/oCDhcE4Kn2U8vIcH6s+6sdRt/UleMtQ0/kdQEPbl8Fjx8Fbs/WazJCMsa8ijR
	f1dv6ejUXGqoKOFeul1QdEtRJXA8hrf8NIGE+kth/kV/up76gcsiFu3g0D9j2/5XVewR
	eXnIEDQmV7KvZApMPUA+fIJb+YLcz0ev6cuX0eIXhmdywYAuvt5IeDVvwTbSG/fG799C
	RK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iqJkvunXqTK6V0bqYwlcqZnB5JLxNsHX0y1JZcrFMTA=;
	b=OhaxoyctNcu3cHBd5YkTPE2SDhrTyq5lIeEFiV3i3Iz0Ay547VseIEf7jCLdSs2tPp
	WJFY1GMzJ/73tJ5dRaAeaLODSZWYYIWKYMKFP0d9/NO92pAjmph0T2KmZfwvuvoIfvPC
	nyo3yXlCgpf2iJf952eE1MvOWpNn0MOP6Iyq6d1BB0unqYFENWahhx0yp6+fWtfzlYq3
	uUvuzF9vsRx8ql8OxIx4/7Q1STzYOsMj9gEHZMeEauqSMFodXdNbCKk+PXUkotMCOp45
	Xvy/eWIewOPiaxWMaDKxVeDiOWMi4CRZqxXbmSL99iq5HIwmzeAvuFJ2cOTDLW3yAA1D
	x8ow==
X-Gm-Message-State: AHPjjUj6FCsLaquRvA1WfkNnbzHzw7nwXqC+M8BVUPxWj6/36OjJWT2x
	y7sQSjh1G8M0FFEr
X-Google-Smtp-Source: ADKCNb46gHN0dIvXn5VcLwV50bY3VobOL6Q4qabAcV+JfogfruHZuS1102S/BL6g1HxQ0id3hzLgsw==
X-Received: by 10.84.231.202 with SMTP id g10mr1819772pln.407.1504766756020;
	Wed, 06 Sep 2017 23:45:56 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::be3d])
	by smtp.gmail.com with ESMTPSA id
	x28sm2187951pgc.91.2017.09.06.23.45.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Sep 2017 23:45:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Sep 2017 23:45:43 -0700
Message-Id: <20170907064543.11580-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170907064543.11580-1-raj.khem@gmail.com>
References: <20170907064543.11580-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] umip: Update SRC_URI to github
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
X-List-Received-Date: Thu, 07 Sep 2017 06:45:55 -0000

original link is not accessible anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/umip/umip_1.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/umip/umip_1.0.bb b/meta-oe/recipes-connectivity/umip/umip_1.0.bb
index cbf306144..2129e379c 100644
--- a/meta-oe/recipes-connectivity/umip/umip_1.0.bb
+++ b/meta-oe/recipes-connectivity/umip/umip_1.0.bb
@@ -9,13 +9,13 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=073dc31ccb2ebed70db54f1e8aeb4c33"
 DEPENDS = "rpm indent-native"
 
-SRC_URI = "git://git.umip.org/umip.git \
+SRC_URI = "git://github.com/jlanza/umip \
            file://add-dependency-to-support-parallel-compilation.patch \
            file://mip6d \
            file://mip6d.service \
            file://0001-Add-format-string-to-fprintf-call.patch \
            "
-SRCREV = "428974c2d0d8e75a2750a3ab0488708c5dfdd8e3"
+SRCREV = "7d67209cd1bba2dd0e183a0fa07eeef07964dd14"
 
 S = "${WORKDIR}/git"
 
-- 
2.14.1


