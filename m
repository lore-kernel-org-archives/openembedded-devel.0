Return-Path: <philip.balister@gmail.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9C8347707F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 19:38:07 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id y89so119557181qge.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 11:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Co817a4ng4QTsaHw/lM2s3CwMv4vYhVmBO69ufpcf/I=;
	b=zdErB/mtTSKOBS8b1ZqJ+fJhGlznOW7t5uVfJZhpHnaDqkTy3b7DQcSOVzev2kbwi+
	ZMe0UHs8DQxG19rccBBAAaO9MT1DCNOI2bjwggKTr8bYTzsUw4EHEjYCkk/pTiYQTZu7
	c3loIndzWq79TwFP1S0uhXBsZUQ3wQtNLhhXnCkdu32IXuQxaFmPFFWm/64OcNTzJj0h
	Dm51YhPX5k4oRloisOtXYkuDJBx2v+mpTdDmKpMSSq5ah+8DbxQbSXi61FONo5w7FxDx
	NPph5ye6/SsaQCSJJwL9O/3jgtyPWjceNYO4KRu0FXy5yulagkKJiOHk+KrMz2Ey0y/4
	4E4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=Co817a4ng4QTsaHw/lM2s3CwMv4vYhVmBO69ufpcf/I=;
	b=ZgI+0CFJYO9slwrjHzGJKcp17f4yltlXm4oQSGMr62hdC28TeRbf+8v/TfcruWUvaq
	BlWKf62QGLV25/n6DS9ux1vlOBNa/51+OYflil3V25pL5rgpfXSfcb3tZCl64RU0Nd8q
	yPsiJIg6xvVjEcKoh90z+d9HM9kcRw67lD2VPOVKbwFcQ1L2SE8kuSpkOTnN1zyzefIA
	qp1EPwBw4nbOVuR1QtguM+jAOXqLxZa0exX4Vbvd4If9QiQclnaYgKJTrwxTXzdhoENX
	2TAYo33tKwUahDWONrHeo2Zs3A1AlJrJpBdguYdOev1UKwFyP8vEiwlQfEowqfnLFPeO
	aXxQ==
X-Gm-Message-State: AG10YOQckleUjqW8f/kGmZU4qBbcrq9qeFcJK+CTC00epVswp3hyfd0tNY0E+25HpT3Jfw==
X-Received: by 10.140.235.137 with SMTP id g131mr39157530qhc.43.1456169888692; 
	Mon, 22 Feb 2016 11:38:08 -0800 (PST)
Received: from thuvia.localdomain (pool-71-171-13-83.nwrknj.east.verizon.net.
	[71.171.13.83]) by smtp.gmail.com with ESMTPSA id
	h11sm10788812qhd.31.2016.02.22.11.38.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Feb 2016 11:38:07 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 14:38:02 -0500
Message-Id: <1456169882-7168-2-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1456169882-7168-1-git-send-email-philip@balister.org>
References: <1456169882-7168-1-git-send-email-philip@balister.org>
Subject: [meta-oe][PATCH 2/2] cppzmq: Bump rev.
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
X-List-Received-Date: Mon, 22 Feb 2016 19:38:08 -0000

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
index 1a59716..f41cd0a 100644
--- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
+++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.zeromq.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=db174eaf7b55a34a7c89551197f66e94"
 DEPENDS = "zeromq"
-SRCREV = "a88bf3e0b0bc6ed5f5b25a58f8997a1dae374c8b"
+SRCREV = "68a7b09cfce01c4c279fba2cf91686fcfc566848"
 
 SRC_URI = "git://github.com/zeromq/cppzmq.git"
 
-- 
2.5.0


