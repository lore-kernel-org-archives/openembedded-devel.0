Return-Path: <cazfi74@gmail.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id E71046B8FE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 08:10:36 +0000 (UTC)
Received: by mail-la0-f52.google.com with SMTP id ev20so328771lab.25
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 01:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NvBM/UkZDT3iVhrPBE+hcoBL8rpGX9X35jZGSkWhcCA=;
	b=URMcxlW2LojFJCCQ76Dg4uB2eulB7deL871Ouxc2RIpv1qOZv3+HxsyWRBGBWCYfnO
	RkbJndegyOwBOu5vkm3NKwvkMjgHpcjtiKzlEk9qQ76eMkHOZ73n5BGlqUvi5KbgQFFR
	3IHPMTp67+GQ749P3tdXMMyFlmozQQXWJLdhayh/itw66cj0XhBzwCzribxbbstWlKgW
	NHTLBcDdr1AWG/aYzQtTgkb6wQtIiXZ1W7atD+cnHQI5nKo/ZbRaAI9C+IBy0OFPHUKM
	azVqnrxyknhSEp1cl5VguXe0K/lDvas+rekdpuKWhFXDhKttwKrT4b/hSFoA2l57Ng7X
	yEyg==
X-Received: by 10.112.51.166 with SMTP id l6mr11751587lbo.5.1376554237082;
	Thu, 15 Aug 2013 01:10:37 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id 8sm17238806lbq.4.2013.08.15.01.10.34
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 01:10:36 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1V9sdd-0000Pf-Gm; Thu, 15 Aug 2013 11:10:33 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 11:10:26 +0300
Message-Id: <1376554226-1550-2-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1376554226-1550-1-git-send-email-cazfi74@gmail.com>
References: <1376554226-1550-1-git-send-email-cazfi74@gmail.com>
Subject: [meta-oe][PATCH 2/2] libsdl-mixer: correct license name to Zlib
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
X-List-Received-Date: Thu, 15 Aug 2013 08:10:37 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb b/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb
index 5307535..d3f3bb0 100644
--- a/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb
+++ b/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Simple DirectMedia Layer mixer library."
 SECTION = "libs"
 DEPENDS = "virtual/libsdl flac libmikmod libvorbis"
-LICENSE = "zlib"
+LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a37a47a0e579e461474cd03b9e05199d"
 
 SRC_URI = "http://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-${PV}.tar.gz \
-- 
1.7.10.4


