Received: from [72.14.220.152] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dbaryshkov@gmail.com>) id 1KzArf-0002M8-5A
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Nov 2008 15:02:07 +0100
Received: by fg-out-1718.google.com with SMTP id l26so2048061fgb.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Nov 2008 06:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=UamwqrAqdM/t7HxLuAXs7y9/p1Hb1n1VkQ/QfRi1n8s=;
	b=UHhS9MNOmDG8+FrlSgDmL3nPY+j1otGsiVSybSEl6POFp33SoN0nh3C4AYxA3JKhBT
	Hgl6D7WJub0rq2pFuDnrYR0+5/+mIQHbt7XWq+rU54Oy/Ch4u0OXl1wY/O0av80yMD2c
	uVI/kjKTog/Nb7k/qBQg8guhUd5cXzb1lxXno=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=E6QbVkTAzNB+roQREUK5XBYb0xIp4xsYOBRP9jabHkoyngqhud6CpLH9n5VUokEUmK
	AMvCRce9U/alGYpMDpNGKOoa/5ptAbZYEjKqlVjs+mjI536BTm2uTYgWDwlTOR4SimHn
	17JMpy32u3OfGu7VxgtwCkLru39eiv5vdht0c=
Received: by 10.86.100.19 with SMTP id x19mr2062603fgb.18.1226237339310;
	Sun, 09 Nov 2008 05:28:59 -0800 (PST)
Received: from localhost.localdomain (ppp89-110-5-254.pppoe.avangarddsl.ru
	[89.110.5.254])
	by mx.google.com with ESMTPS id l12sm8088339fgb.6.2008.11.09.05.28.57
	(version=SSLv3 cipher=RC4-MD5); Sun, 09 Nov 2008 05:28:58 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Nov 2008 16:28:02 +0300
Message-Id: <1226237296-11012-2-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1226237296-11012-1-git-send-email-dbaryshkov@gmail.com>
References: <1226237296-11012-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>
Subject: [PATCH] checksums.ini: correct wrong checksums
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
X-List-Received-Date: Sun, 09 Nov 2008 14:02:07 -0000

Signed-off-by: Dmitry Baryshkov <dbaryshkov@gmail.com>
---
 conf/checksums.ini |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index bf39454..80131ea 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -8303,8 +8303,8 @@ md5=15de3830b751818a54a42899bd3ae72c
 sha256=5fdaf9af5ac4f75c0215d000b82b128fd054a582f81cc4f039a1e7fe69335ebb
 
 [http://gpephone.linuxtogo.org/download/gpephone/libchenabler-0.1/libchenabler-0.1.tar.gz]
-md5=f29e1e63fcc55e3ae4e81f5ee9dd7bdd
-sha256=448a3ab76109664bb6bd8bcc2c62d957c7d44b52e39c37d91b3b73b5cfe35a3f
+md5=866fd13611a8de946428db1df9be8468
+sha256=74def55ba6a61e966e0873a4081fd3dd65089b94b837810d3bc056221d7e41c7
 
 [http://repository.maemo.org/pool/bora/free/source/libconic_0.13.tar.gz]
 md5=f852e61c2700b5bc571a730c6516e4ce
@@ -9127,8 +9127,8 @@ md5=54935c6cff42df2f1daada267b701392
 sha256=18f0e2df191219c29b47dc12b4b06b5be7eaeef34b3436156547e5a9f4eb51c1
 
 [http://gpephone.linuxtogo.org/download/gpephone/libmsgenabler-1.0/libmsgenabler-1.0.tar.bz2]
-md5=53417c192cff3e32fb1d7b839201a04d
-sha256=8a58b9a9eb8cae0dc15453d7737050a3b241eb1030797f1559b4bbb5aff061e6
+md5=32f04482d3905f05a4f36ac946e7f95d
+sha256=c8568dbd5d3ffa200bf81ffbc7baf94902b41998d5c65455a1fbadce15db9953
 
 [http://ftp.musicbrainz.org/pub/musicbrainz/libmusicbrainz-2.1.2.tar.gz]
 md5=88d35af903665fecbdee77eb6d5e6cdd
@@ -10215,12 +10215,12 @@ md5=de958cdb8d00e74792dd69f3c945b037
 sha256=371f8133db705bde6c2f79cccb0b1a1f626a0d94bf41acceba5d76a69155f057
 
 [http://gpephone.linuxtogo.org/download/gpephone/liblipsevent-0.1/lips_event-0.1.tar.gz]
-md5=bd92cf7fae640c7807b53d082bfe1d92
-sha256=d0941b9947be08be440716c888b58cc6d088a214debefebe7bca99b84f387c02
+md5=1fd0f41f9676ef0c882921bc37628d07
+sha256=7182cf3f63e11e7ea6c6a994f9e70ef3bf6e430a5db643f5b29a0fd0996ddfd5
 
 [http://gpephone.linuxtogo.org/download/gpephone/libim-0.2/lips_im-0.2.tar.gz]
-md5=4430d106ffc651c861374d729ffcd4c3
-sha256=31bfd0d68dc0cfdaf22c26295c8fc4b65a508d0e615daf8a43f032f2a701f2b7
+md5=375091bb5df956f0049962defad3cbbc
+sha256=381d88261fa307ffa97edab6ba8488533b9fb45cccc5ae6cda5ccb64ef65adc0
 
 [http://downloads.sourceforge.net/lirc/lirc-0.8.0.tar.gz]
 md5=596e05980f75372fa998d50eb1dcade0
-- 
1.5.6.5



