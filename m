Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@rkmorris.us>) id 1QE015-0002Mf-S2
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Apr 2011 16:10:28 +0200
Received: from server ([unknown] [71.164.183.134]) by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LK5002IDR4YLL10@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sun,
	24 Apr 2011 08:07:47 -0500 (CDT)
Received: from server (127.0.0.1) by server (Axigen)
	with ESMTPSA id 329F04; Sun, 24 Apr 2011 08:07:44 -0500
Received: from [192.168.1.2] by rkmorris.us with HTTP; Sun,
	24 Apr 2011 08:07:43 -0500
From: Russell Morris <openembedded@rkmorris.us>
Date: Sun, 24 Apr 2011 08:07:43 -0500
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Message-id: <1303650463701271500@rkmorris.us>
Importance: Normal
MIME-version: 1.0
X-AxigenVirus-Level: 1
X-AxigenSpam-Level: 1
Subject: Build Warnings (Angstrom-2010.x)
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
X-List-Received-Date: Sun, 24 Apr 2011 14:10:28 -0000
Content-type: text/plain
Content-transfer-encoding: quoted-printable
Content-disposition: inline

Hi,

I have noted that when I run builds for this distro I end up with a lot of =
warnings near the start (added below). Is this expected / normal, and what =
can I do to address these (as not only are they a bit confusing, I'm of cou=
rse worried that the right items are being pulled in to the build)?

NOTE: angstrom DOES NOT support bluez-utils because bluez-utils 3.x has bee=
n replaced by bluez4
NOTE: angstrom DOES NOT support libiconv because the glibc builtin iconv re=
placement is used
NOTE: angstrom DOES NOT support ffmpeg because libav is the preferred multi=
media library
NOTE: angstrom DOES NOT support libiconv because the glibc builtin iconv re=
placement is used
NOTE: angstrom DOES NOT support hotplug-ng because hotplug functionality is=
 provided by udev
NOTE: angstrom DOES NOT support ffmpeg because libav is the preferred multi=
media library
NOTE: angstrom DOES NOT support ffmpeg because libav is the preferred multi=
media library
NOTE: angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been =
replaced by bluez4
NOTE: angstrom DOES NOT support hotplug2 because hotplug functionality is p=
rovided by udev
NOTE: angstrom DOES NOT support linux-hotplug because hotplug functionality=
 is provided by udev
NOTE: angstrom DOES NOT support fso-apm because regular apmd is good enough
NOTE: angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been =
replaced by bluez4
NOTE: angstrom DOES NOT support linux-hotplug because hotplug functionality=
 is provided by udev
NOTE: angstrom DOES NOT support bash-noemu because doesn't work on the targ=
et
NOTE: angstrom DOES NOT support hotplug-ng because hotplug functionality is=
 provided by udev
NOTE: angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been =
replaced by bluez4
NOTE: angstrom DOES NOT support xcursor-watchonly-theme because xcursor-tra=
nsparent-theme is good enough
NOTE: angstrom DOES NOT support libiconv because the glibc builtin iconv re=
placement is used
NOTE: angstrom DOES NOT support ipkg because ipkg has been superseded by op=
kg
NOTE: angstrom DOES NOT support ffmpeg because libav is the preferred multi=
media library
NOTE: angstrom DOES NOT support bluez-utils because bluez-utils 3.x has bee=
n replaced by bluez4
done.h

Thanks!

... Russell



