Received: from [151.189.21.50] (helo=mail-in-10.arcor-online.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <no2spam@nospam.arcornews.de>) id 1M5ejv-0007rn-LS
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 May 2009 13:41:11 +0200
Received: from mail-in-12-z2.arcor-online.net (mail-in-12-z2.arcor-online.net
	[151.189.8.29]) by mx.arcor.de (Postfix) with ESMTP id E26E728EE48
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 May 2009 13:33:59 +0200 (CEST)
Received: from mail-in-04.arcor-online.net (mail-in-04.arcor-online.net
	[151.189.21.44])
	by mail-in-12-z2.arcor-online.net (Postfix) with ESMTP id C9BE227944C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 May 2009 13:33:59 +0200 (CEST)
Received: from [192.168.1.12] (p5B3B31B9.dip.t-dialin.net [91.59.49.185])
	(Authenticated sender: leggewie@arcor.de)
	by mail-in-04.arcor-online.net (Postfix) with ESMTPSA id 85CDE33A663
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 May 2009 13:33:59 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mail-in-04.arcor-online.net 85CDE33A663
Message-ID: <4A0FF622.40609@nospam.arcornews.de>
Date: Sun, 17 May 2009 13:33:54 +0200
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][STABLE] bitbake.conf: update GENTOO_MIRROR setting. (Closes: #5054)
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
X-List-Received-Date: Sun, 17 May 2009 11:41:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

From: Rolf Leggewie <oe-devel@rolf.leggewie.biz>

---

The old GENTOO_MIRROR URL is 404.  Patch should go to .dev and then to
.stable

   conf/bitbake.conf |    2 +-
   1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 95ee9c6..5d4ec2b 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -508,7 +508,7 @@ E_URI = "http://enlightenment.freedesktop.org/files"
   FREEBSD_MIRROR = "ftp://ftp.freebsd.org/pub/FreeBSD/"
   FREEDESKTOP_CVS = "cvs://anoncvs:anoncvs@anoncvs.freedesktop.org/cvs"
   FREESMARTPHONE_GIT = "git://git.freesmartphone.org"
-GENTOO_MIRROR =
"http://distro.ibiblio.org/pub/linux/distributions/gentoo/distfiles"
+GENTOO_MIRROR = "http://distfiles.gentoo.org/distfiles"
   GNOME_GIT = "git://git.gnome.org"
   GNOME_MIRROR = "http://ftp.gnome.org/pub/GNOME/sources"
   GNU_MIRROR = "ftp://ftp.gnu.org/gnu"



