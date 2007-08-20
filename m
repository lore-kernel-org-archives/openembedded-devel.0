Received: from [209.85.198.185] (helo=rv-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <raj.khem@gmail.com>) id 1INBqU-0001iw-E2
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Aug 2007 20:19:22 +0200
Received: by rv-out-0910.google.com with SMTP id c24so981149rvf
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2007 11:18:26 -0700 (PDT)
Received: by 10.140.132.8 with SMTP id f8mr882505rvd.1187633906085;
	Mon, 20 Aug 2007 11:18:26 -0700 (PDT)
Received: from dhcp20.mvista.com ( [63.81.120.158])
	by mx.google.com with ESMTPS id k14sm889472rvb.2007.08.20.11.18.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 20 Aug 2007 11:18:25 -0700 (PDT)
Message-ID: <46C9DAE5.30309@gmail.com>
Date: Mon, 20 Aug 2007 11:18:13 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.3
Subject: Drop omap-2430-lcd patch.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Aug 2007 18:19:25 -0000
Content-Type: multipart/mixed; boundary="------------090304010105040706000301"

--------------090304010105040706000301
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello

This patch is no longer required as it has been committed upstream.
OK?


Thanks

- -Khem
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (Darwin)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFGydpRHnJKy6V6em4RAnPZAJ0SyBqDUDswrkHoAUN5pz5MVKnZ9gCeKLZZ
XkbYyJWTiQcs4K5PVpzaggM=
=7RiI
-----END PGP SIGNATURE-----

#
# old_revision [6951a4bf0c57a677b8f2cdf1144402fe1358e3e1]
#
# delete "packages/linux/linux-omap2-git/omap-2430-lcd.patch"
# 
# patch "conf/machine/include/tune-arm1136jf-s.conf"
#  from [5a3e5932acd2c4060744b80a29575afe2d4371c9]
#    to [3a32f71999f930e828ad32e4ce1e7af1b4dc9662]
# 
# patch "packages/linux/linux-omap2_git.bb"
#  from [ab62a543cf001bbe863e1adb93758519b57f7036]
#    to [51f14792a8bc6ce3690fa88f529d8b7a51ef40d9]
#
============================================================
--- conf/machine/include/tune-arm1136jf-s.conf	5a3e5932acd2c4060744b80a29575afe2d4371c9
+++ conf/machine/include/tune-arm1136jf-s.conf	3a32f71999f930e828ad32e4ce1e7af1b4dc9662
============================================================
--- packages/linux/linux-omap2_git.bb	ab62a543cf001bbe863e1adb93758519b57f7036
+++ packages/linux/linux-omap2_git.bb	51f14792a8bc6ce3690fa88f529d8b7a51ef40d9
@@ -7,7 +7,6 @@ SRC_URI = "git://source.mvista.com/git/l
 COMPATIBLE_MACHINE = "omap2430sdp"
 
 SRC_URI = "git://source.mvista.com/git/linux-omap-2.6.git;protocol=git \
-           file://omap-2430-lcd.patch;patch=1;pnum=1 \
            file://defconfig.eabi \
            file://defconfig"
 

--------------090304010105040706000301--
