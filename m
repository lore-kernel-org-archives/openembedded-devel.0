Received: from [209.85.220.207] (helo=mail-fx0-f207.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1My1Q7-0005Uc-Ie
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Oct 2009 12:49:30 +0200
Received: by fxm3 with SMTP id 3so11137174fxm.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2009 03:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=FuumWmkMJlgjpBQTslLh7hmTdBnapPBe1/Lh7Hay6r8=;
	b=WzIeiP90qdQcUfTXxiauPNKbDoHYhrqPtgBXtOAP1i0EwbWckhejsD53kyvN5uzdHR
	mIzhZ8F16YyeXEhTcPIzQjIWI6xynaQMoXo3i196l/4tu5cS2U/uaIg+QzODDD96L5Vr
	zlsvpGTY8RsvExgBGeAR/X7X+8sZAtZKApvIQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=bFkmUzI406f7BzI+fngpSUwzpD0mld9LCGJQJcICMmvKCBZyDmgtx6C3iyIlbrioIk
	r/4hsHbJZtO8XXcb7VdrlMLZUz675vS2xY8O/Jrcj4idK+zEACeLo3RJlT1VMmwOPPwD
	eMbK6NLIS7DXtrxCIV0g0DZgh9ixNFmLBXfEM=
Received: by 10.103.125.28 with SMTP id c28mr3662808mun.64.1255517311530;
	Wed, 14 Oct 2009 03:48:31 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id y37sm2284567mug.34.2009.10.14.03.48.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 14 Oct 2009 03:48:30 -0700 (PDT)
From: "Martin.Jansa" <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Oct 2009 12:48:27 +0200
Message-Id: <1255517308-31136-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.5
X-SA-Exim-Connect-IP: 209.85.220.207
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 1/2] Missing few xorg checksums.ini
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
X-List-Received-Date: Wed, 14 Oct 2009 10:49:32 -0000

---
 conf/checksums.ini |   28 ++++++++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 097d63d..679e282 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -12758,6 +12758,10 @@ sha256=f3bc6747dba7d1a35cd125ca0bd4649f88704be211cf7e47d36b43c7f44ce803
 md5=6092cdb0a1225f95356ddbe6c2abaad5
 sha256=7000005ebbd07a28a71477d72bcb76c47064e043a4ead26fcf4d5af394ce19df
 
+[http://xorg.freedesktop.org/releases/individual/proto/kbproto-1.0.4.tar.bz2]
+md5=7f439166a9b2bf81471a33951883019f
+sha256=1baa29931313d0c3eb81dffd42662768cc76ce49ce94024d5fe32ef5a4e8603c
+
 [http://xorg.freedesktop.org/releases/X11R7.0/src/proto/kbproto-X11R7.0-1.0.2.tar.bz2]
 md5=403f56d717b3fefe465ddd03d9c7bc81
 sha256=abfea195d72a6355dddacaf1ca37187ba9e8ca271af4bf6c38efaba4023b36a4
@@ -13518,6 +13522,10 @@ sha256=6171e6bca4bd6333611bd9c63cccc8e8e412d876c72097f0dddc490a9df51d5a
 md5=3a8e06b25912ef339d70a8ba003da9b5
 sha256=eafff0157f2c7172214449d4b6b0c72328cad7026ecace226189b511791c5f75
 
+[http://xorg.freedesktop.org/releases/individual/lib/libXfont-1.4.1.tar.bz2]
+md5=4f2bed2a2be82e90a51a24bb3a22cdf0
+sha256=112bfc30820b98deec4c9914536c5aa2f8b5162bd2b0bdb342343168e06f7679
+
 [http://xorg.freedesktop.org/releases/X11R7.0/src/lib/libXfont-X11R7.0-1.0.0.tar.bz2]
 md5=955c41694772c9fd214e3e206f5d2178
 sha256=47d4de6986f6ca85bc48ecd76188d7f3f009e1aeb640008cab12ac5ca5896622
@@ -13550,6 +13558,10 @@ sha256=68b46f85caaf0b30c876bd983abe144c25755bee7532e8738ab7ebe29a428986
 md5=bc8881851f3bd8dcc625fac37350a1c6
 sha256=ce7688258af34c14af421bcfb306d4310245b727d2417ac968b7f6b2facfde8c
 
+[http://xorg.freedesktop.org/releases/individual/lib/libXft-2.1.14.tar.bz2]
+md5=254e62a233491e0e1251636536163e20
+sha256=700e9d594b81cad3dfd5fac4a5cfd0c4cf7780c812507ef04eb40139ebf5175e
+
 [http://xorg.freedesktop.org/releases/X11R7.0/src/lib/libXft-X11R7.0-2.1.8.2.tar.bz2]
 md5=c42292b35325a9eeb24eb0f8d3a6ec52
 sha256=0473d1db21968f05b39ff9832b18545ba6b93be76d2e61b04a14208c515680f3
@@ -13642,6 +13654,10 @@ sha256=2d5c5242b8417db6aa758e5be387de33385d9960ff21c801af7d6a4730b4fd0d
 md5=cd15ee542d9f515538b4462a6f79d977
 sha256=64701ae67ce5b0797307b75d8255bec3a0d371d0c50715ea618f5a68bcc92baa
 
+[http://xorg.freedesktop.org/releases/individual/lib/libXpm-3.5.8.tar.bz2]
+md5=38e58e72d476a74298a59052fde185a3
+sha256=02a77aaa32e6e335e1ee04aeb9ad1008045d98274d64ed33bc5fc6c3a3542c4c
+
 [http://xorg.freedesktop.org/releases/X11R7.0/src/lib/libXpm-X11R7.0-3.5.4.2.tar.bz2]
 md5=f3b3b6e687f567bbff7688d60edc81ba
 sha256=58bb490a8c97e8b7e57525f105378a65dc5f7571765aea6a8f473d93e8713807
@@ -13722,6 +13738,10 @@ sha256=0ddcb6f9dcffd4c4c896012bf82da350ff6f1550fb53a99327f21e483c39c8a2
 md5=de66ffb657aba64c9d6dbdeabb757f3e
 sha256=a6d5ba7573f5ec0f091095f01b51d1e671dd0f14acb5b8559cdf366e398a0230
 
+[http://xorg.freedesktop.org/releases/individual/lib/libXres-1.0.4.tar.bz2]
+md5=4daf91f93d924e693f6f6ed276791be2
+sha256=457f567a70ef8798cfb32f897ffa52c3f010923b07414b3a42277f56877572df
+
 [http://xorg.freedesktop.org/releases/X11R7.0/src/lib/libXres-X11R7.0-1.0.0.tar.bz2]
 md5=cc5c4f130c9305e5bd973fbb7c56a254
 sha256=b8f68d40797e1baadb77053f7834428894696cb345591f732c8c8c7e1ff1f3b8
@@ -28882,6 +28902,10 @@ sha256=256fd04cbd97b2b96e7ef808b6752561da855ded3835a1bb0d7acbe07758e924
 md5=acae8edeb05a406f7f60bcbb218a8f1d
 sha256=aaab4cbf19c73ded4785ba69cdd7ae23aaf103c7040559283f85fc1237dad6e6
 
+[http://xorg.freedesktop.org/releases/individual/proto/xf86miscproto-0.9.3.tar.bz2]
+md5=ca63bbb31cf5b7f37b2237e923ff257a
+sha256=45b8ec6a4a8ca21066dce117e09dcc88539862e616e60fb391de05b36f63b095
+
 [http://xorg.freedesktop.org/releases/X11R7.0/src/proto/xf86miscproto-X11R7.0-0.9.2.tar.bz2]
 md5=1cc082d8a6da5177ede354bedbacd4ed
 sha256=ed0190e3db4c07fe042cfc9d726e3806af83a2e6dfdbd832a7f8c225805bde5b
@@ -29890,6 +29914,10 @@ sha256=3f8cde77e8cbeb6d0a5f232b7a2ee51dd49b677916d52ab0986d320a5f9e8000
 md5=9c30b8e1709d5367beb7706146640c07
 sha256=c24d08939250f10238fd1b984707bfa0901ba9c55fa36b67d91eb12b500500aa
 
+[http://xorg.freedesktop.org/releases/individual/app/xrdb-1.0.6.tar.bz2]
+md5=8dd881cd5a7dcb6e456549817f0fb475
+sha256=8d062a3764665fcf22b14df4a5aca6af1e6d7d613296875b31b68e74ef66fc99
+
 [http://xorg.freedesktop.org/releases/X11R7.0/src/app/xrdb-X11R7.0-1.0.1.tar.bz2]
 md5=a3c1fd6f5391de7f810239a912d39fa5
 sha256=adf3f97fcb0d768e19058e94dd4aaec70ea61afa8077f6c6e99aa70bc8564e14
-- 
1.6.5



