Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id ABAB06E2E6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 14:43:09 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id b57so903741eek.38
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 06:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=u9EO+I8C4w4UfNztFKggZNzuhRyscbKsfXowFN3Mqqw=;
	b=GFby0yc2ebZv6f2eF1nBWF2ZBvPBwjprD4PIpkL2UTnboEfBWDXtNzHadLFZITB5/A
	Zuc9XbahFaWuxe7VOaH8pwgT80cfcgDKEa4HNaxxBdtRKJ+SMTn2E2G3qCt5ZtFBgVHy
	GDYzNdlU0rl/rwFJ7gDViZwcgZpCJEkVYIyxLDzPNK0eoMlG62fO7mri8v0iKv0W3IX1
	jtZGAd3XFxTbcVU+5H67H/xo3U4+vHBlwrJAOJ5CE3eSEgpg+Fdi2h/e8uIQ/1OCrB0m
	fN/6omjeF55c9+nrK65z/3E9ZFOc7m/wLTlXyvPyOJSTJPzmR5mYf8Gz8nv2JtPuC1hi
	FaGw==
X-Received: by 10.14.2.73 with SMTP id 49mr4225302eee.15.1389796985076;
	Wed, 15 Jan 2014 06:43:05 -0800 (PST)
Received: from localhost.localdomain (ip-109-91-251-248.unitymediagroup.de.
	[109.91.251.248])
	by mx.google.com with ESMTPSA id 7sm10764574eee.12.2014.01.15.06.43.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jan 2014 06:43:04 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jan 2014 15:42:56 +0100
Message-Id: <1389796977-30387-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/1] dconf: update to 0.18.0
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
X-List-Received-Date: Wed, 15 Jan 2014 14:43:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

tested with xfce and gnome image but world test will tell..

Andreas Müller (1):
  dconf: update to 0.18.0

 meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb | 29 ++++++++++++++++++++++++++
 meta-gnome/recipes-gnome/dconf/dconf_0.7.5.bb  | 23 --------------------
 2 files changed, 29 insertions(+), 23 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
 delete mode 100644 meta-gnome/recipes-gnome/dconf/dconf_0.7.5.bb

-- 
1.8.3.1


