Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9D2146DAF9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 11:46:21 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so1328385eek.39
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 03:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=z3KUeg1S3GVWv8iMJOf4zjT5BqCVBkpB/cw/0s0i9V4=;
	b=vR4oDwzvlYugUTXGMsCWoAw7Uzc5fxpixgincChWRXCeMSge3jCkGy/D7pDj6lCdv6
	vOJiJfYrGjh1lPMaKyTRtIkBGMfl6WFnBmQrm3Z1wTVoEJl9S1IbAt7A9neZf3izuKVn
	7nchhWDhiN2D1EISFv+r3kJ/SjLqhHLRS4WW28twBfqqXiQov9lgmuHljhk68ytIDLZ6
	vHKqptJMzgdl226S3AdVwNfD+Zoff4eqc2xk3rMKKjTrJ/kLPoEQXMZ42QiCLwid6/wo
	wdsjJOuyEneUgpSyjz9nKmt5qwTp/9TYMWXUawNODlxxH23IvqQ1SPoTG2dTTi3D5tk8
	iLvg==
X-Received: by 10.14.109.71 with SMTP id r47mr13369927eeg.6.1393501582467;
	Thu, 27 Feb 2014 03:46:22 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u6sm15897130eep.11.2014.02.27.03.46.20 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Feb 2014 03:46:21 -0800 (PST)
Date: Thu, 27 Feb 2014 12:46:22 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140227114622.GB26981@jama>
References: <1393194140-24218-1-git-send-email-Martin.Jansa@gmail.com>
	<1393194140-24218-2-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1393194140-24218-2-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][meta-efl][PATCH 2/2] xf86-video-geode: Move to nonworking
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
X-List-Received-Date: Thu, 27 Feb 2014 11:46:23 -0000
X-Groupsio-MsgNum: 48399
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6jDZ2N1G6US2iTyc"
Content-Disposition: inline

--6jDZ2N1G6US2iTyc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 23, 2014 at 11:22:20PM +0100, Martin Jansa wrote:
> * according to http://www.openembedded.org/wiki/Bitbake_World_Status
>   it's broken at least since 2013-10-30 and nobody seems to care

Otavio: ping?

There is also that freerdp and libinih issue you said you'll look into, any=
 update?

WARNING: QA Issue: freerdp: Files/directories were installed but not shipped
  /usr/usr
  /usr/usr/lib
  /usr/usr/lib/freerdp
  /usr/usr/lib/freerdp/printer.so
  /usr/usr/lib/freerdp/rail.so
  /usr/usr/lib/freerdp/audin_alsa.so
  /usr/usr/lib/freerdp/rdpsnd.so
  /usr/usr/lib/freerdp/rdpsnd_pulse.so
  /usr/usr/lib/freerdp/audin.so
  /usr/usr/lib/freerdp/rdpdr.so
  /usr/usr/lib/freerdp/rdpdbg.so
  /usr/usr/lib/freerdp/cliprdr.so
  /usr/usr/lib/freerdp/tsmf_alsa.so
  /usr/usr/lib/freerdp/audin_pulse.so
  /usr/usr/lib/freerdp/scard.so
  /usr/usr/lib/freerdp/tsmf.so
  /usr/usr/lib/freerdp/rdpsnd_alsa.so
  /usr/usr/lib/freerdp/parallel.so
  /usr/usr/lib/freerdp/disk.so
  /usr/usr/lib/freerdp/tsmf_pulse.so
  /usr/usr/lib/freerdp/serial.so
  /usr/usr/lib/freerdp/drdynvc.so
  /usr/usr/lib/freerdp/.debug
  /usr/usr/lib/freerdp/.debug/printer.so
  /usr/usr/lib/freerdp/.debug/rail.so
  /usr/usr/lib/freerdp/.debug/rdpsnd.so
  /usr/usr/lib/freerdp/.debug/rdpdr.so
  /usr/usr/lib/freerdp/.debug/audin_alsa.so
  /usr/usr/lib/freerdp/.debug/rdpsnd_pulse.so
  /usr/usr/lib/freerdp/.debug/rdpdbg.so
  /usr/usr/lib/freerdp/.debug/audin.so
  /usr/usr/lib/freerdp/.debug/scard.so
  /usr/usr/lib/freerdp/.debug/audin_pulse.so
  /usr/usr/lib/freerdp/.debug/tsmf_alsa.so
  /usr/usr/lib/freerdp/.debug/tsmf.so
  /usr/usr/lib/freerdp/.debug/cliprdr.so
  /usr/usr/lib/freerdp/.debug/rdpsnd_alsa.so
  /usr/usr/lib/freerdp/.debug/parallel.so
  /usr/usr/lib/freerdp/.debug/drdynvc.so
  /usr/usr/lib/freerdp/.debug/tsmf_pulse.so
  /usr/usr/lib/freerdp/.debug/serial.so
  /usr/usr/lib/freerdp/.debug/disk.so

| Built target inihcpp
| make[1]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/armv5te-oe-linux-gnueabi/libinih/0.0+gitrAUTOINC+7a43a3655c-=
r3/build'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/bin/cmake -E cmake_progress_start /home/jenkins/oe/shr-core-branche=
s/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libinih/0.0+gitrAUTOINC=
+7a43a3655c-r3/build/CMakeFiles 0
| make -f CMakeFiles/Makefile2 preinstall
| make[1]: Entering directory `/home/jenkins/oe/shr-core-branches/shr-core/=
tmp-eglibc/work/armv5te-oe-linux-gnueabi/libinih/0.0+gitrAUTOINC+7a43a3655c=
-r3/build'
| make[1]: Nothing to be done for `preinstall'.
| make[1]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/armv5te-oe-linux-gnueabi/libinih/0.0+gitrAUTOINC+7a43a3655c-=
r3/build'
| Install the project...
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/bin/cmake -P cmake_install.cmake
| -- Install configuration: ""
| CMake Error at cmake_install.cmake:44 (FILE):
|   file INSTALL cannot find
|   "/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe=
-linux-gnueabi/libinih/0.0+gitrAUTOINC+7a43a3655c-r3/git/inih.pc".
|=20
|=20
| make: *** [install] Error 1
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_install (log file is located at /home/jenkins/=
oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libi=
nih/0.0+gitrAUTOINC+7a43a3655c-r3/temp/log.do_install.14568)
NOTE: recipe libinih-0.0+gitrAUTOINC+7a43a3655c-r3: task do_install: Failed

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6jDZ2N1G6US2iTyc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMPJY4ACgkQN1Ujt2V2gBxNhwCgtha4lqKyHTCGhufuvGEISKCp
iygAnjOA95W2JThc8ZxaUtrTjSQ8w/kG
=LF53
-----END PGP SIGNATURE-----

--6jDZ2N1G6US2iTyc--
