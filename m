Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0FA8A617AA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2014 14:39:08 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id d17so1368815eek.25
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jan 2014 06:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Wszg9OpkmR6MP6imKCS57rNBpZ2FKIAW09sFfG2iYyI=;
	b=EJbDKwrNfOL1wmREARUU+ke4CbPYD80h7yb+k5L24JGWCV3D0/8cbAvpklvZXB7PgG
	hn9qXdJqLuu6rhJovffufde9smsIoYlSjNbUhKAtvLDMS3edhpO3Vg646tGMgTk3/W6t
	0AInJDsyE6r0C04gk6b/dhs+I68r+es9g86ctIXVSrAcyen9WwSkKxqo5vHCFrt1IP6s
	LaUwUPsWMMPvx5zYiHEy5kIJ/S0VIBUMgVzsyLOAxBBXvxuSi7UpDWNSL5xdYlv8w5Kk
	3rJuB07r84pJmEGLnsY/ohSzDvJ/8n5QDTuXMA5CNodA0U8bXkHjsCbwgRQW/s3hK7xf
	4g1g==
X-Received: by 10.15.83.8 with SMTP id b8mr3769015eez.6.1389278349567;
	Thu, 09 Jan 2014 06:39:09 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id e3sm6083383eeg.11.2014.01.09.06.39.08
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Jan 2014 06:39:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Jan 2014 15:39:14 +0100
Message-Id: <1389278354-25293-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
Subject: [meta-systemd][PATCH] ofono: Rename .bbappend to match new version from oe-core
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
X-List-Received-Date: Thu, 09 Jan 2014 14:39:10 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-connectivity/ofono/{ofono_1.13.bbappend => ofono_%.bbappend}  | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/oe-core/recipes-connectivity/ofono/{ofono_1.13.bbappend => ofono_%.bbappend} (100%)

diff --git a/meta-systemd/oe-core/recipes-connectivity/ofono/ofono_1.13.bbappend b/meta-systemd/oe-core/recipes-connectivity/ofono/ofono_%.bbappend
similarity index 100%
rename from meta-systemd/oe-core/recipes-connectivity/ofono/ofono_1.13.bbappend
rename to meta-systemd/oe-core/recipes-connectivity/ofono/ofono_%.bbappend
-- 
1.8.5.2


