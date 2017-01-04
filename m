Return-Path: <jaragunde@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id C56847199F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jan 2017 18:21:42 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3AfodIjxxj2/SE49XXCy+O+j09IxM/srCxBDY+r6Qd?=
	=?us-ascii?q?2uweIJqq85mqBkHD//Il1AaPBtSHrasZwLOO4+jJYi8p2d65qncMcZhBBVcuqP?=
	=?us-ascii?q?49uEgeOvODElDxN/XwbiY3T4xoXV5h+GynYwAOQJ6tL1LdrWev4jEMBx7xKRR6?=
	=?us-ascii?q?JvjvGo7Vks+7y/2+94fdbghMizexe65+IRW5oQnMqsUbgpZpJ7osxBfOvnZGYf?=
	=?us-ascii?q?ldy3lyJVKUkRb858Ow84Bm/i9Npf8v9NNOXLvjcaggQrNWEDopM2Yu5M32rhbD?=
	=?us-ascii?q?VheA5mEdUmoNjBVFBRXO4QzgUZfwtiv6sfd92DWfMMbrQ704RSiu4qF2QxLulS?=
	=?us-ascii?q?wJNSM28HvPh8JwkqxVvRyvqR94zYHWboGaO+ZxcKzGcNMGRmdMRNpdWjZdDo6+?=
	=?us-ascii?q?aYYEEuoPPfxfr4n4v1YAqQGxChWrBOz0zT9Dm2P73bcg3OQuDAHG2hEvEMwTu3?=
	=?us-ascii?q?rOttL1LrkdUOGox6TPzzXMdelW1i3y6IjVdBAuvO+DUKlxccre00YvEwLFgU+K?=
	=?us-ascii?q?pYP5ODOV0/0Avm6G5ORjTeKik2oqpxxrrjSy28shiJPFi4YRx1ze6Cl0wIY4KN?=
	=?us-ascii?q?ulQ0Bhe9GkCoFftySCOotzRcMtXn9ntT4hyr0DpZ67ZC8KyIk7xxLHa/yIbYyI?=
	=?us-ascii?q?4hX7WeafOzh4gnNkeLO5hxms60Sgy+L8WdOw0FZLtCVJiMXDtncI1xDL68iHTO?=
	=?us-ascii?q?Vy/lu51DuLygzf8PxILV02mKbBL5MsxqQ8mocTvEnDBiP2nV/5jK6SdkUq4Oio?=
	=?us-ascii?q?7OHnb63kppCGLY97kA7+MrkomsOiH+s1KQkOX2eB9uS41b3s51f1T6lNjv0ziq?=
	=?us-ascii?q?XZqozVJdwHpq6lBA9YyoEj6w6hADegztsYmGIII0xYdx2akYfmJkjCL+3mAveh?=
	=?us-ascii?q?nVuslCxmx/THPr36HpXNNWLPkLD5fblj7U5T1g8zwstB6J1JF74OPu/8VlX2tN?=
	=?us-ascii?q?zCAR8zKxa0zPr/CNVhyoMeXnqCDbGDMKPTrVCF/fwgI/SPZI8PpjnyMeIp6OLp?=
	=?us-ascii?q?jX88gVUdZ7Wm3YMLaHCkGfRrO1iWbmTqgtcACmcHpRQxTPHpiF2YTzFcfWy+UL?=
	=?us-ascii?q?475jE+EIimF5vMRpixgLyd2ye2BppWZnxcBVCSEHfocJ6JW/AXaCKJIs5hiSAE?=
	=?us-ascii?q?WqakS486zx2hqAj6y799IuXP4C1L/a7kgd9t6uvekBs/+TB5A4GR3n+AS0lwn3?=
	=?us-ascii?q?gUXHkxxK15rEl3x1uP3KQ+hOZXRvJJ4PYccA4xMpTbh8VgAt/vXA7MNu8IUlu0?=
	=?us-ascii?q?CoGkCCs4Qc83z9ImYkl0H9SryBvE2nz5UPcui7WXCclsoern1H/rKpMlxg=3D?=
	=?us-ascii?q?=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DhAQBFOm1Y/5tjdVteHAEBBAEBCgEBF?=
	=?us-ascii?q?wEBBAEBCgEBgw0BAQEBAR+Ba41XcqQmgkKCD4IIGoYIAoFWPxQBAQEBAQEBAQE?=
	=?us-ascii?q?BAWIogjMYgh4GIw8BRhAlAiYCAlcZiHQBr06CJYoqAQEBAQYBAQEBJIELhTqJc?=
	=?us-ascii?q?4IACy6CXgWPD4t6kUECkFdIkXgfOIV2gUc9NIgyAQEB?=
X-IPAS-Result: =?us-ascii?q?A2DhAQBFOm1Y/5tjdVteHAEBBAEBCgEBFwEBBAEBCgEBgw0?=
	=?us-ascii?q?BAQEBAR+Ba41XcqQmgkKCD4IIGoYIAoFWPxQBAQEBAQEBAQEBAWIogjMYgh4GI?=
	=?us-ascii?q?w8BRhAlAiYCAlcZiHQBr06CJYoqAQEBAQYBAQEBJIELhTqJc4IACy6CXgWPD4t?=
	=?us-ascii?q?6kUECkFdIkXgfOIV2gUc9NIgyAQEB?=
X-IronPort-AV: E=Sophos;i="5.33,459,1477954800"; d="scan'208";a="96000767"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 04 Jan 2017 19:11:50 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1cOq2Q-00078x-Me; Wed, 04 Jan 2017 19:11:50 +0100
Received: from fanzine.local.igalia.com ([192.168.10.13]
	helo=goomba.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
	id 1cOq2O-0005HI-Kt; Wed, 04 Jan 2017 19:11:48 +0100
From: =?UTF-8?q?Jacobo=20Aragunde=20P=C3=A9rez?= <jaragunde@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Jan 2017 19:11:34 +0100
Message-Id: <1483553494-5687-3-git-send-email-jaragunde@igalia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1483553494-5687-1-git-send-email-jaragunde@igalia.com>
References: <1483553494-5687-1-git-send-email-jaragunde@igalia.com>
MIME-Version: 1.0
Cc: denis@eukrea.com, otavio@ossystems.com.br, eric@eukrea.com
Subject: [meta-browser][PATCH 3/3] chromium: remove conditional detection of CHROMIUM_ENABLE_WAYLAND
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
X-List-Received-Date: Wed, 04 Jan 2017 18:21:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It can be a source of problems, because you must have chosen the
correct recipe to build the wayland or x11 version of chromium.

Signed-off-by: Jacobo Aragunde Pérez <jaragunde@igalia.com>
---
 recipes-browser/chromium/chromium-browser.inc | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/recipes-browser/chromium/chromium-browser.inc b/recipes-browser/chromium/chromium-browser.inc
index 4fb47fd..8c73207 100644
--- a/recipes-browser/chromium/chromium-browser.inc
+++ b/recipes-browser/chromium/chromium-browser.inc
@@ -102,12 +102,6 @@ PACKAGECONFIG[kiosk-mode] = ""
 PACKAGECONFIG[proprietary-codecs] = ""
 
 
-# Conditionally add ozone-wayland and its patches to the Chromium sources
-# You can override this by setting CHROMIUM_ENABLE_WAYLAND=1 or CHROMIUM_ENABLE_WAYLAND=0 in local.conf
-CHROMIUM_ENABLE_WAYLAND ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '0', \
-                     bb.utils.contains('DISTRO_FEATURES', 'wayland', '1', \
-                     '0', d),d)}"
-
 # ozone-wayland will be cloned into a directory with this name
 OZONE_WAYLAND_GIT_DESTSUFFIX ?= "ozone-wayland-git"
 # Use glob to filter out the patches that shall be applied against ozone-wayland.
-- 
2.7.4


