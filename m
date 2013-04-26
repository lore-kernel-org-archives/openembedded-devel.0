Received: from mail-pa0-f54.google.com ([209.85.220.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UVmHT-0003a4-4g
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Apr 2013 19:18:03 +0200
Received: by mail-pa0-f54.google.com with SMTP id fa11so2594866pad.41
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2013 10:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NbDBMRURhPXmzbTrAyNXxk/rlCLkQ0rfoXYMIdLKx5I=;
	b=Orf/iAZ/7dWP4R/qrIE6s0EJBK0CrfzSGB+kobdtnyUR9I9oNW5fks4EuHO/I/p2Vf
	e3R4e6cIb37AVx0LFLpn7U7B4BgD7gQpUR6DKyHekXAW4qzvAS+K9qjjDx24J1PFqo+d
	Gv6UFIlVBNsgtm6X3HyLOXGQsI8+X/lJ/pnO8OS4mSVmiNoB27u3rre15BtP2gI1Qlqb
	7oB3Hq6EyuF8bcLANGjDztPlS84pS+SL5ru44wiPXFwCghlihKQVW0CXuMsZrKUyaRDJ
	8AkYFwZ9XzWPUvnu14j+MNcfxDhgJ78fsM3c3BLugAq/JEQoBbM1uzU+P92CQJhCtZmu
	spVA==
X-Received: by 10.66.20.7 with SMTP id j7mr36053986pae.142.1366995609238;
	Fri, 26 Apr 2013 10:00:09 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	cq1sm12403246pbc.13.2013.04.26.10.00.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 26 Apr 2013 10:00:08 -0700 (PDT)
Date: Fri, 26 Apr 2013 19:00:19 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130426170019.GA3199@jama>
References: <1366206552-14452-1-git-send-email-schnitzeltony@googlemail.com>
	<1366206552-14452-2-git-send-email-schnitzeltony@googlemail.com>
	<kkm9v0$mrc$1@ger.gmane.org>
	<CALbNGRRXN5L-TmjUW9e4MxKi-a_jgX=2p17xXPzS+-nt5Q4HUQ@mail.gmail.com>
	<20130418082201.GL26007@jama>
	<CALbNGRTfQh7iBf=8XceW1mJ2mCttp4ccB77p9o9LtMkS0kMYUQ@mail.gmail.com>
	<20130418110026.GO26007@jama>
	<CALbNGRSzmogd602cGauf1hE_c=SMQSaEo-R1hJQyn524dLkCaw@mail.gmail.com>
	<CALbNGRS7+a2+_9G0H8LZkhvj9YA7k6pSW=GEQmhweVRgyyMPnQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRS7+a2+_9G0H8LZkhvj9YA7k6pSW=GEQmhweVRgyyMPnQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-gnome 2/2] libnotify: update to 0.7.5 and drop libnotify3
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
X-List-Received-Date: Fri, 26 Apr 2013 17:18:05 -0000
X-Groupsio-MsgNum: 44441
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline

--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2013 at 02:45:47PM +0200, Andreas M=FCller wrote:
> On Thu, Apr 18, 2013 at 1:24 PM, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
> > On Thu, Apr 18, 2013 at 1:00 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
> >> On Thu, Apr 18, 2013 at 11:53:45AM +0200, Andreas M=FCller wrote:
> >>> On Thu, Apr 18, 2013 at 10:22 AM, Martin Jansa <martin.jansa@gmail.co=
m> wrote:
> >>> > On Thu, Apr 18, 2013 at 08:58:24AM +0200, Andreas M=FCller wrote:
> >>> >> On Wed, Apr 17, 2013 at 4:01 PM, Koen Kooi <koen@dominion.thruhere=
=2Enet> wrote:
> >>> >> > -----BEGIN PGP SIGNED MESSAGE-----
> >>> >> > Hash: SHA1
> >>> >> >
> >>> >> > Op 17-04-13 15:49, Andreas M=FCller schreef:
> >>> >> >> removing tests drops dependencies on gtk
> >>> >> >>
> >>> >> >> Tested by:
> >>> >> >>
> >>> >> >> * building nautilus3 (the only recipe found depending on libnot=
ify3) *
> >>> >> >> running xfce-based image and checked notififations
> >>> >> >
> >>> >> > The problem with libnotify was (is?) that it removed some API th=
at GNOME 2.x
> >>> >> > depends on and later introduced API that GNOME 3.x depends on, h=
ence the 2
> >>> >> > recipes. Do all the GNOME 2.x bits build against this new libnot=
ify? The
> >>> >> > error was a build break, so it things build, they are likely to =
work :)
> >>> >> >
> >>> >> > regards,
> >>> >> >
> >>> >> > Koen
> >>> >> >
> >>> >> Martin's world shall let us know
> >>> >
> >>> > My slaves are looking forward to serve..
> >>> >
> >>> > It's in queue, but still jenkins is 40+ hours behind, so I'll let y=
ou know later..
> >>> >
> >>> I started and additional test. At least zenity fails for API change
> >>> but seems not a big deal to fix. Will send follow up patches.
> >>
> >> I guess that to test this properly I should cleansstate both libnotify
> >> or do build from scratch, because I cannot know which one won
> >> into-the-sysroot race during last build.
> >>
> >> --
> > 1. I think yes
> > 2. I found build faults for gnome-power-manager zenity
> > gnome-settings-daemon - hope to fix these until tomorrow.
> >
> > Andreas
>=20
> Now after looking into it I suggest to forget these patches. Between
> 0.6.1 and 0.7.x not only the API changed but also the GObject
> interface. The properties
>=20
> attach-widget
> status-icon
>=20
> were removed. This will cause unpredictable results for applications
> using them. The only chance I see is to put them back but this seems
> more efforts and deep understanding the difference between gtk+ and
> gtk3.

yes seems like there is quite a few build issues

here are last 3 world builds with this change applied:
qemux86:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30423_042257.log/
qemux86-64:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30424_014915.log/
qemuarm
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30425_025239.log/

ERROR: Task 5529
(/home/jenkins/oe/shr-core-branches/shr-core/meta-openembedded/meta-gnome/r=
ecipes-gnome/libgnome/libgnomecanvas_2.26.0.bb,
do_compile) failed with exit code '1'
| gnome-canvas-rich-text.c:2150:2: error: implicit declaration of function =
'gtk_text_layout_draw' [-Werror=3Dimplicit-function-declaration]

ERROR: Task 8938
(/home/jenkins/oe/shr-core-branches/shr-core/meta-openembedded/meta-gnome/r=
ecipes-gnome/libgnome/libgnome_2.32.1.bb,
do_compile) failed with exit code '1'
| gnome-program.c:2067:2: error: implicit declaration of function
'g_atexit' [-Werror=3Dimplicit-function-declaration]

ERROR: Task 2143
(/home/jenkins/oe/shr-core-branches/shr-core/meta-openembedded/meta-gnome/r=
ecipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb,
do_compile) failed with exit code '1'
| notification-main.c:539:21: error: too many arguments to function
'notify_notification_new'

ERROR: Task 13041
(/home/jenkins/oe/shr-core-branches/shr-core/meta-openembedded/meta-gnome/r=
ecipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb,
do_compile) failed with exit code '1'
| notify.c:74:2: error: too many arguments to function
'notify_notification_new'

ERROR: Task 10197
(/home/jenkins/oe/shr-core-branches/shr-core/meta-openembedded/meta-gnome/r=
ecipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb,
do_compile) failed with exit code '1'
| gsd-a11y-keyboard-manager.c:612:64: error: too many arguments to
function 'notify_notification_new'

ERROR: Task 22117
(/home/jenkins/oe/shr-core-branches/shr-core/meta-openembedded/meta-gnome/r=
ecipes-gnome/epiphany/epiphany_2.30.6.bb,
do_compile) failed with exit code '1'
| downloader-view.c:340:7: error: too many arguments to function
'notify_notification_new'

ERROR: Task 9420
(/home/jenkins/oe/shr-core-branches/shr-core/meta-openembedded/meta-gnome/r=
ecipes-gnome/zenity/zenity_2.32.1.bb,
do_compile) failed with exit code '1'
| notification.c:187:11: error: implicit declaration of function
'notify_notification_new_with_status_icon'
[-Werror=3Dimplicit-function-declaration]

ERROR: Task 396
(/home/jenkins/oe/shr-core-branches/shr-core/meta-openembedded/meta-gnome/r=
ecipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb,
do_compile) failed with exit code '1'
| gpm-manager.c:488:3: error: too many arguments to function
'notify_notification_new'

> Andreas
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlF6sqMACgkQN1Ujt2V2gBwH+gCfVbSMflysSu8BJsyJW8E+9sI9
t4cAoLWfr3wY3xXVEwhdbx4P4DyCmUOL
=ba/e
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
