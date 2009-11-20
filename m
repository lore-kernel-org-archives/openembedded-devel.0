Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1NBRIV-0002aY-HT
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 12:05:07 +0100
Received: from homiemail-a22.g.dreamhost.com (caiajhbdcagg.dreamhost.com
	[208.97.132.66])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 006E7178A89
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2009 03:03:40 -0800 (PST)
Received: from [192.168.1.154] (unknown [195.190.181.110])
	by homiemail-a22.g.dreamhost.com (Postfix) with ESMTPA id DCAEB1A807E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2009 03:03:35 -0800 (PST)
Message-ID: <4B067785.50600@SSpaeth.de>
Date: Fri, 20 Nov 2009 12:03:33 +0100
From: Sebastian Spaeth <Sebastian@SSpaeth.de>
Organization: ETH Zurich
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.7
OpenPGP: id=C827A062
X-SA-Exim-Connect-IP: 66.33.216.122
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [Fwd: [Shr-Devel] [PATCH] ILLUME_CONFIG is now also set by a variable]
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
X-List-Received-Date: Fri, 20 Nov 2009 11:05:07 -0000
X-Groupsio-MsgNum: 14517
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigD7274FB97E310A2C167ACEA1"

--------------enigD7274FB97E310A2C167ACEA1
Content-Type: multipart/mixed;
 boundary="------------040101040205050405040505"

--------------040101040205050405040505
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

See attached patch. We'd love to replace the default illume config with
our distro-specific version, so this will make the config RDEPENDS
overridable from our distro conf. Is such a change acceptable for OE?

spaetz

--------------040101040205050405040505
Content-Type: message/rfc822;
 name="[Shr-Devel] [PATCH 1/2] ILLUME_CONFIG is now also set by a variable.eml"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="[Shr-Devel] [PATCH 1/2] ILLUME_CONFIG is now also set by a v";
 filename*1="ariable.eml"

Return-Path: <shr-devel-bounces@lists.shr-project.org>
X-Original-To: Sebastian@sspaeth.de
Delivered-To: sebastian--sspaeth.de@homiemail-mx7.g.dreamhost.com
Received: from montecristo.dreamhost.com (fltr-in2.mail.dreamhost.com [208.97.132.72])
	by homiemail-mx7.g.dreamhost.com (Postfix) with ESMTP id 9E8B8CF3E8
	for <Sebastian@sspaeth.de>; Fri, 20 Nov 2009 03:00:10 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by montecristo.dreamhost.com (Postfix) with ESMTP id 35670940B2
	for <Sebastian@sspaeth.de>; Fri, 20 Nov 2009 03:00:10 -0800 (PST)
X-DH-Virus-Scanned: Debian amavisd-new at montecristo.dreamhost.com
X-Spam-Flag: NO
X-Spam-Score: 3.5
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 tagged_above=-999 required=4 tests=[BAYES_99=3.5]
Received: from deathwish.dreamhost.com ([208.97.132.72])
	by localhost (montecristo.dreamhost.com [208.97.132.134]) (amavisd-new, port 10024)
	with ESMTP id gYFYnSyxAOwx for <Sebastian@sspaeth.de>;
	Fri, 20 Nov 2009 03:00:09 -0800 (PST)
Received: from bamse.bearstech.com (bamse.bearstech.com [78.40.125.60])
	by deathwish.dreamhost.com (Postfix) with ESMTP id EE6B194138
	for <Sebastian@sspaeth.de>; Fri, 20 Nov 2009 03:00:06 -0800 (PST)
Received: from bamse.bearstech.com (localhost [127.0.0.1])
	by bamse.bearstech.com (Postfix) with ESMTP id 6ED2FD8643;
	Fri, 20 Nov 2009 12:00:04 +0100 (CET)
Received: from mail-fx0-f225.google.com (mail-fx0-f225.google.com
	[209.85.220.225])
	by bamse.bearstech.com (Postfix) with ESMTP id 97CF4D859D
	for <shr-devel@lists.shr-project.org>;
	Fri, 20 Nov 2009 12:00:01 +0100 (CET)
Received: by fxm25 with SMTP id 25so3756951fxm.6
	for <shr-devel@lists.shr-project.org>;
	Fri, 20 Nov 2009 03:00:01 -0800 (PST)
Received: by 10.216.88.85 with SMTP id z63mr354746wee.129.1258714801274;
	Fri, 20 Nov 2009 03:00:01 -0800 (PST)
Received: from localhost.localdomain (89-139-170-173.bb.netvision.net.il
	[89.139.170.173])
	by mx.google.com with ESMTPS id q9sm2627672gve.0.2009.11.20.03.00.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 20 Nov 2009 03:00:00 -0800 (PST)
From: Tom Hacohen <tom@stosb.com>
To: shr-devel@lists.shr-project.org
Date: Fri, 20 Nov 2009 12:55:58 +0200
Message-Id: <1258714559-16508-1-git-send-email-user@tompc>
X-Mailer: git-send-email 1.6.5.3
Subject: [Shr-Devel] [PATCH 1/2] ILLUME_CONFIG is now also set by a variable
X-BeenThere: shr-devel@lists.shr-project.org
X-Mailman-Version: 2.1.9
Precedence: list
List-Id: "SHR Developers discussions \(technical\)"
	<shr-devel.lists.shr-project.org>
List-Unsubscribe: <http://lists.shr-project.org/mailman/listinfo/shr-devel>,
	<mailto:shr-devel-request@lists.shr-project.org?subject=unsubscribe>
List-Archive: <http://lists.shr-project.org/pipermail/shr-devel>
List-Post: <mailto:shr-devel@lists.shr-project.org>
List-Help: <mailto:shr-devel-request@lists.shr-project.org?subject=help>
List-Subscribe: <http://lists.shr-project.org/mailman/listinfo/shr-devel>,
	<mailto:shr-devel-request@lists.shr-project.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: shr-devel-bounces@lists.shr-project.org
Errors-To: shr-devel-bounces@lists.shr-project.org

---
 recipes/tasks/task-x11-illume.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/tasks/task-x11-illume.bb b/recipes/tasks/task-x11-illume.bb
index 8b813b4..9af914f 100644
--- a/recipes/tasks/task-x11-illume.bb
+++ b/recipes/tasks/task-x11-illume.bb
@@ -10,6 +10,7 @@ inherit task
 
 # Default illume theme
 ILLUME_THEME ?= "e-wm-theme-illume"
+ILLUME_CONFIG ?= "e-wm-config-illume"
 
 RDEPENDS_${PN} = "\
   task-x11-server \
@@ -17,6 +18,6 @@ RDEPENDS_${PN} = "\
 #  xserver-kdrive-splash-illume \
   \
   e-wm \
-  e-wm-config-illume \
+  ${ILLUME_CONFIG} \
   ${ILLUME_THEME} \
 "
-- 
1.6.5.3

_______________________________________________
Shr-devel mailing list
Shr-devel@lists.shr-project.org
http://lists.shr-project.org/mailman/listinfo/shr-devel

--------------040101040205050405040505--

--------------enigD7274FB97E310A2C167ACEA1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAksGd4YACgkQVYX1jMgnoGIywQCdH6MypD6OoH+iDU4gJLyKuGG+
zYYAoIg0QW+zVQWpf+76ojLxd87HMDEM
=SM/Y
-----END PGP SIGNATURE-----

--------------enigD7274FB97E310A2C167ACEA1--
