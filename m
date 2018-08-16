Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 279D17927A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 18:28:06 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id t25-v6so5177622wmi.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 11:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=/RGOta11AnimTFcrgDT/FNW33oZHmwnSwSsy2RFTj94=;
	b=fSNknpe3293LULpcb/8rCwUJffa5JWlSdAbkrdsUDQAmxSbiVZc/p5cojPUSpOXA6D
	s4sMV0o3zn+J8A4ZuiG0++tXAEInt2ZiCtg4VU5I/YiAuMvquU575tCUrM3zJ3mte720
	SpewTOXB50u4eYQNOcT8o0yz+MNuBwG3hE8WV1sDlgWzzWGZeCvN6ufPcrqWAiPLxaMe
	wLIBCTEa7nwxVNJsx6CGNlMEs61w2V814ggDrE9RJIZNKAwhHeU6ob4praY03VsMgkUV
	K3uu+ImgrTur7WW4w3pjgnq4BenvFu7coc/d6vm2exaOB1Rugt9FRFZO2QHfUJgF8uKO
	dkjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/RGOta11AnimTFcrgDT/FNW33oZHmwnSwSsy2RFTj94=;
	b=mq4lrAMNp3mS1wPGRVP72g592oddFwS7gIYhtUgKEb+/CdmplRQFBZMtnNgOGamiPD
	QChYR5TSeWz8dSN+G0lVaT7YNmgdP561R+WavlxxOsWiKG0CB13lp0dxe9RS72uxqTC1
	4MXSGf8yRahREjebI26MCd2muM3mPx46h+wDwkNDMrpShioHKJqU4pJdAQe3jAK4AslC
	3BQlZHQkTL4G46J7HxK7Wq05IpRlrOkv3sduarSnsH2NcHW/v2C/8v1odAP/4iLWVftZ
	aahyaxgjLg+qaQAuVaxoPlBxiuXblUtPcSsnHXIDTbxzawH7fWkRgivsHp/Et3UEkfzv
	PaUg==
X-Gm-Message-State: AOUpUlFxnDXF5atUu2hOnfTicJlWc6AL9CyArsVfRkEZm3rLfJk9sIhs
	vPJv+nBluMQhDtbFz8YtPqtYpneK
X-Google-Smtp-Source: AA+uWPz/p2g5bhxW7YoCA3OopUrmsbV4twAFikj+ZfpUB7zTO5c9Eqxg7qwIsstRHXP/mdcxyOlQNg==
X-Received: by 2002:a1c:5bc7:: with SMTP id
	p190-v6mr16648353wmb.101.1534444086584; 
	Thu, 16 Aug 2018 11:28:06 -0700 (PDT)
Received: from localhost.localdomain
	(p200300F07BC4D1601E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc4:d160:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	g10-v6sm26040224wrv.90.2018.08.16.11.28.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Aug 2018 11:28:05 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Aug 2018 20:27:42 +0200
Message-Id: <20180816182748.2400-11-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180816182748.2400-1-schnitzeltony@gmail.com>
References: <20180816182748.2400-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 10/16] dconf-editor: re-add 3.28.0
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
X-List-Received-Date: Thu, 16 Aug 2018 18:28:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It got lost by recent gconf update - separated out of gconf.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/dconf/dconf-editor_3.28.0.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/dconf/dconf-editor_3.28.0.bb

diff --git a/meta-gnome/recipes-gnome/dconf/dconf-editor_3.28.0.bb b/meta-gnome/recipes-gnome/dconf/dconf-editor_3.28.0.bb
new file mode 100644
index 000000000..70f917ea5
--- /dev/null
+++ b/meta-gnome/recipes-gnome/dconf/dconf-editor_3.28.0.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Configuration editor for dconf"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+DEPENDS = "dconf gtk+3"
+
+inherit gnomebase vala gettext gsettings bash-completion
+
+SRC_URI[archive.md5sum] = "cc9eb8020cc848812972d8519c3d05cf"
+SRC_URI[archive.sha256sum] = "455b53d827820efd28a176ee52e13eda5cda8cdf4e31e0145cfdd69931bf0c5a"
+
+FILES_${PN} += " \
+    ${datadir}/dbus-1 \
+    ${datadir}/metainfo \
+"
-- 
2.14.4


