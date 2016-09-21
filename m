Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id D5ADF605BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2016 20:38:18 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b184so10618183wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2016 13:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qiakQ25Ej8hu+JzcLoHCmI7xh1CR1N8zIGXvt4Fr0Pk=;
	b=E+4mtnLRO+lHv47YoaLZ+8H6rLiAE8BOgDJ/bgHV6dAM9xOmFb2sR2MUxbqCQgI7JW
	cNE+TnWy35UBlsrlkypiwMdvWnd0HD+2cWAGZYXbaASSgVyrlGu5RFKE6Y3zwTp1/97L
	VLgglTXdwb5Hv4tIYqGGA4CQNYmcEesJko9p6t8xQ16TIezS5dbPJcnIvYwbJbCpOcJ6
	mx5lq5aCekCqcZu4zN7BDkBPqnFimTjQyee30NDl60Bb6F1xyf4yQqKxDDvSrMDsgXzz
	Ecs3H1UbmBqpMc57BjYWkIvq6rxJDE3u7SrSWYGhtMl+415c1zd+L1qbCjYGK4qCgsxz
	X0Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qiakQ25Ej8hu+JzcLoHCmI7xh1CR1N8zIGXvt4Fr0Pk=;
	b=D2cfhi7EnstAOeg153DzbaSk8qbpqYAIio7k91s5cVu2KWpIFB8vvRqXm4TDPafS8N
	A6o5sFRjTqOqfP7abwYVSNv5GtpPDBSdpZ7SL7IQgVhFx83BsoAHKCyd17Ibf/fMgKyE
	K7q2PJcDBCNYk9xyTrS9vrxoTOLUoVCWFO/yFuFeHAyYKK/oFw7h7Qeou9PCaB08rO4j
	7F6F7N9ykihqaNPZjJtFa4cwO3Cj40DDDEgYkl37j5tbkVRR5u01MLOE60MpY/3u6YZV
	Xv5mBgHjbn3Ig+eTDpANSm3Fr2yztX/X1b419WAmTicenvzMCK6MEFN3WyMYbkwBSvso
	ZI/A==
X-Gm-Message-State: AE9vXwMhiOLbuGnty2gEIpWkmyoq9RQVFsZKvMoFEa8nXYrb9BiBC7XqCAeECAJTFf+Oqg==
X-Received: by 10.28.154.142 with SMTP id c136mr5244532wme.102.1474490299384; 
	Wed, 21 Sep 2016 13:38:19 -0700 (PDT)
Received: from localhost.localdomain (p4FDF06F5.dip0.t-ipconnect.de.
	[79.223.6.245]) by smtp.googlemail.com with ESMTPSA id
	a1sm35260377wju.41.2016.09.21.13.38.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Sep 2016 13:38:18 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Sep 2016 22:38:02 +0200
Message-Id: <1474490283-1332-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH 1/2] portaudio: has MIT license
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
X-List-Received-Date: Wed, 21 Sep 2016 20:38:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

| WARNING: portaudio-v19-v19+svnr1387-r0 do_populate_lic: portaudio-v19: No generic license file exists for: PortAudio in any provider

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb b/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
index c8d7378..abe471d 100644
--- a/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
+++ b/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A portable audio library"
 SECTION = "libs/multimedia"
-LICENSE = "PortAudio"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=26107732c2ab637c5710446fcfaf02df"
 
 PV = "v19+svnr${SRCPV}"
-- 
2.5.5


