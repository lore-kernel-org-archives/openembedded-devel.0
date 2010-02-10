Received: from mail-fx0-f225.google.com ([209.85.220.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NfIwH-00068a-Gb
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Feb 2010 21:13:36 +0100
Received: by fxm25 with SMTP id 25so402476fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2010 12:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=jr0Ti4mrqb2oiOk5FdXhfhDUEg/cXT2R8NnMxFG4qk0=;
	b=KbFWgDAZtni9aBYAQi4XPgN2fMhjenWPl/O+7K+o60ydF8CFO+TL0SfMEBS3GFavRu
	u9u2RBxGYMPkDi2gjCXixZsmfMFlyZ1JqCXjtrS65hZRdYmAMVGMPqGAp+MfMXZq/Q52
	qvyEC90pZyDVuk/Ec/Ud3sjtZNLtvofPbQOkI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Inmn+BJv8wOeXytIY00/aiJ0J02uh4HBuP4Nmb01v1zqhYFdNwvtGNU4DvXz3jjLXZ
	fChho8U3yVTzVpBx8XML7HB16yF1yw48BkwAuBeIdlH0rQeE1SdHHW7GQEAY5LC4hhpL
	P4lmcZYp7/RNDM1lehh9Qh9m9JKwlp+d0bJ6g=
Received: by 10.223.94.204 with SMTP id a12mr891136fan.75.1265832656163;
	Wed, 10 Feb 2010 12:10:56 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 21sm2601776fkx.25.2010.02.10.12.10.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 10 Feb 2010 12:10:55 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NfIvm-0005CW-7A; Wed, 10 Feb 2010 21:13:02 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Feb 2010 21:12:58 +0100
Message-Id: <1265832780-19939-7-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1265832780-19939-6-git-send-email-rep.dot.nop@gmail.com>
References: <1265832780-19939-1-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-2-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-3-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-4-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-5-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-6-git-send-email-rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.220.225
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 6/8] busybox: remove orphaned patch checksums
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Feb 2010 20:13:36 -0000

These http download patches are not in use anymore.
Just keep checksums for 1.7.2 (those are mentioned in the .bb)

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 conf/checksums.ini |   32 --------------------------------
 1 files changed, 0 insertions(+), 32 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 075b5eb..494f850 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -3682,34 +3682,6 @@ sha256=e4f5bc9be311a746bd37f5607d3c225462d7d9294e8b3c692f9a39717b65d843
 md5=c17e047d1a6a3f3188de929dc8582e01
 sha256=58eb43e7e781a6b61e452fa36fa03198ef44c742da80c8a1b60be073e4ab949b
 
-[http://busybox.net/downloads/fixes-1.11.1/busybox-1.11.1-basename.patch]
-md5=f7780f73d3338b17d5f2eedbe76132de
-sha256=0f3129eff8420f2e3da237a95dbb6234ef380ac4343cb192eccd69fe8c840c7b
-
-[http://busybox.net/downloads/fixes-1.11.1/busybox-1.11.1-tar.patch]
-md5=fb01aea02faf4c5107292454745806ff
-sha256=6a045d34561b8548ae08ca7d0803d77fc2b70bdfc61793aa0a99e59a91059443
-
-[http://busybox.net/downloads/fixes-1.13.2/busybox-1.13.2-depmod.patch]
-md5=7c9dfb5dcd66a1d6e837e72ad0cb05d4
-sha256=35e3854599a074ce1b47872ab1b97a625ed7d1ab3345b918f7f60524f5e390c5
-
-[http://busybox.net/downloads/fixes-1.13.2/busybox-1.13.2-init.patch]
-md5=7afb3a1b474742bc198b3c8450ab9a7e
-sha256=39a8efb5a50c56feb733e519365b4e188c25c0e925a1a63cc1ace9735a80100f
-
-[http://busybox.net/downloads/fixes-1.13.2/busybox-1.13.2-mdev.patch]
-md5=a72d169e9545e26257032e0e367feb95
-sha256=fd4a64c6a83e07586de0360258162c5bf431f164b3980301185743e4029940df
-
-[http://busybox.net/downloads/fixes-1.13.2/busybox-1.13.2-modprobe.patch]
-md5=b2b9d0992b055816077ec9e0e4ee7775
-sha256=ba540cad8a029ff2eec7b078e31a308f408c074a13160aa7eba80f5ca18ee703
-
-[http://busybox.net/downloads/fixes-1.13.2/busybox-1.13.2-tar.patch]
-md5=90d093817855bc63ad16fbb8524f80df
-sha256=9427fa9b45f3c322bf4fe2463c99c972e6ae03df630899b38be4f29133708a0e
-
 [http://busybox.net/downloads/fixes-1.7.2/busybox-1.7.2-ash.patch]
 md5=4149857c0b2c7f3d52a1f2cec5d7778d
 sha256=73706e7d77144a6270da02ede61cde3c2e3b0e716d879737ac9d478b29233ba9
@@ -3726,10 +3698,6 @@ sha256=5117584a563c512b68cd9678d3cf54e6186f5a062836398791385f8ed73cca86
 md5=c211189556c59a2665af45bffe5a5878
 sha256=f44c3c2d7d9b3fc8a5f9fb6ac587ae4170d2515d72f9e76deb8c071ce9847abe
 
-[http://busybox.net/downloads/fixes-1.9.1/busybox-1.9.1-lineedit.patch]
-md5=9e5d99b89d79dd117310ee675322d9f2
-sha256=3fe138dc567d0fcda304f89523686aaec2f83c9193403cfc68d1ba32fa554511
-
 [http://downloads.sourceforge.net/bvi/bvi-1.3.1.src.tar.gz]
 md5=b9d77c57bda2e019207a1874d9bb4dea
 sha256=c94dbfa293cbc61b8571d025e90fd1f06a34f8d4e5b11a59856bfc1f13014de3
-- 
1.6.5



