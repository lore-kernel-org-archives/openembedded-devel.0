Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6AA9460722
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jun 2016 18:13:42 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id ug1so3323113pab.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jun 2016 11:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wWVFT1tPVQ0AIEk71Hl0KgKHv2CjezcuKbqgSPXZeHQ=;
	b=JZgjK5MyhryxGfAAyIr3huejsbmSt1TEM3E1lyDb9qtwoPt0XT6tpwGTTrHKTiSltk
	jWnnwhN/dIkEMi1LIrP3nlS7olCXKvZTLogpGEQiKwxUF+LaAZYy4Pz442ke90KL7mze
	UPiS7nTGsJTrbEmVz5tf+fsVHllw4+0zEdKpXAsSu+QXMiq6LL4zqbF5oP9OxR7FtjlO
	kVTfDTucp4LAFofg6iJFt1S7qwE2rNpZYaX3ByusIqKydRH+AM71WTnkJZjYZcsB/O+M
	yXjngCMg01d2XOHrl8fVf0cpx0kMITiFJAVviwDf+7OsWO43mmX1hg1le5cnx5wy4a3m
	K7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wWVFT1tPVQ0AIEk71Hl0KgKHv2CjezcuKbqgSPXZeHQ=;
	b=k7IBoiUuwc6DyipKXA1QB5SkWNgJLtgV3D/MkYSuHlJ7keCwUon5Z7wJ+D33GQCZCK
	laT2EtKyPbiLLDm3k5/axh8ZKs72EdLrQZjXhk8a4lqVLFKA2gx6dLNTYBp2+oq967eL
	KjBizGU+r7Byzumib+L1g9qRZfu81L58/8tHZUwn3IQTU8wcgkEI3SJ+nnSh8/fp3nJe
	MMXJFsybuP/sBG9mhwpkacwT5bkha689nKfV4OuPoEWDWFxSXRLDOXhqdPqYIeTWmlcV
	tIRHaBobE7FAv5HSsUwC/w8DC5AfTpUlwpKTT4HtwfLH0jzWOMxYczi2wVe298EDIbgV
	vlxw==
X-Gm-Message-State: ALyK8tLvkt9je/alDpwrlKACpGmyzy4fZF/UtFxYHzb3sLZ1m0Q7pGCAlD2Mu9/otr+n/A==
X-Received: by 10.67.23.48 with SMTP id hx16mr13601308pad.7.1465496023938;
	Thu, 09 Jun 2016 11:13:43 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	fd8sm11647579pac.23.2016.06.09.11.13.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 09 Jun 2016 11:13:42 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Jun 2016 11:13:31 -0700
Message-Id: <753103782dfd0011b8babec0d1d88df41c61c97e.1465495803.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1465495803.git.chris_larson@mentor.com>
References: <cover.1465495803.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH 1/2] mpv: add DESCRIPTION
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
X-List-Received-Date: Thu, 09 Jun 2016 18:13:43 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
index 6a258b5..5fac298 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.15.0.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Open Source multimedia player"
+DESCRIPTION = "mpv is a fork of mplayer2 and MPlayer. It shares some features with the former projects while introducing many more."
 SECTION = "multimedia"
 HOMEPAGE = "http://www.mpv.io/"
 DEPENDS = "zlib ffmpeg jpeg virtual/libx11 xsp libxv \
-- 
2.8.0


