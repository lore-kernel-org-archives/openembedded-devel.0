Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@hrw.one.pl>) id 1IHzMx-0000p9-04
	for openembedded-devel@openembedded.org; Mon, 06 Aug 2007 11:59:23 +0200
Received: (qmail 2198 invoked by uid 813007); 6 Aug 2007 09:56:58 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 6 Aug 2007 09:56:58 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 6 Aug 2007 11:56:46 +0200
User-Agent: KMail/1.9.7
References: <46A711DB.6000205@dominion.kabel.utwente.nl>
	<46A895A1.7040400@dominion.kabel.utwente.nl>
In-Reply-To: <46A895A1.7040400@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Message-Id: <200708061156.47211.openembedded@hrw.one.pl>
Subject: Re: Activating autotools updates
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
X-List-Received-Date: Mon, 06 Aug 2007 09:59:23 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia czwartek, 26 lipca 2007, Koen Kooi napisa=B3:
> After multiple success reports I'd like to propose the following
> timeline:

> 20070816: make pkgconfig-native 0.22 the default

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
Revision: c575740a3b6935cc9e85bcc4e6f3cec52b4c4028
Ancestor: 12b138279c360841bb21419b7866a60b4a10932c
Author: koen@openembedded.org
Date: 2007-08-05T12:28:40
Branch: org.openembedded.dev

Added files:
         packages/pkgconfig/pkgconfig.inc
Modified files:
         packages/pkgconfig/pkgconfig-native_0.22.bb
         packages/pkgconfig/pkgconfig_0.15.0.bb
         packages/pkgconfig/pkgconfig_0.22.bb

ChangeLog:

pkgconfig: sync with poky
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D

This changeset enabled pkg-config 0.22 in OE as this removed=20
DEFAULT_PREFERENCE =3D "-1" from recipe. Anyway it should work - in Poky we=
=20
(OpenedHand) use it since Poky Linux 3.0 'blinky' was released.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

  Any smoothly functioning technology will have the appearance of magic.
  		-- Arthur C. Clarke




