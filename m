Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HeBHi-0006za-QN
	for openembedded-devel@openembedded.org; Wed, 18 Apr 2007 16:37:26 +0200
Received: from [130.89.6.69] (vpn006069.vpn.utwente.nl [130.89.6.69])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l3IEbIox014702 for <openembedded-devel@openembedded.org>;
	Wed, 18 Apr 2007 16:37:19 +0200
Message-ID: <46262D1F.3080301@dominion.kabel.utwente.nl>
Date: Wed, 18 Apr 2007 07:37:19 -0700
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <46209B2D.4060902@dominion.kabel.utwente.nl>
In-Reply-To: <46209B2D.4060902@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Cairo 1.4.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Apr 2007 14:37:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
> Hi,
> 
> Cairo 1.4.4 was just released containing a ton of bugfixes, but I urge you not to add it
> to OE. We applied Jorn's surface-cache patch throughout the 1.3.x and 1.4.x series to get
> a big performance boost on most of our platforms, but with cairo 1.4.4 the patch breaks
> compilation.
> 
> But there's hope! Behdad sent this email to cairo-dev last night:
> http://lists.freedesktop.org/archives/cairo/2007-April/010348.html

There's a git tree by Chris Wilson with a WIP patch:
http://gitweb.freedesktop.org/?p=users/ickle/cairo;a=shortlog;h=xlib-dpy-workqueue

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGJi0eMkyGM64RGpERAjGHAJ4qyt9aq1QlcIGJQZ/52++3pay0kACfagWU
AVvPMJtcKDdp5wRgvFtp41A=
=dAoy
-----END PGP SIGNATURE-----


