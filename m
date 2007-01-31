Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HCAEp-0003PS-53
	for openembedded-devel@openembedded.org; Wed, 31 Jan 2007 08:50:39 +0100
Received: from [130.89.6.46] (vpn006046.vpn.utwente.nl [130.89.6.46])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l0V7oaLr008755 for <openembedded-devel@openembedded.org>;
	Wed, 31 Jan 2007 08:50:36 +0100
Message-ID: <45C04A4A.3070207@dominion.kabel.utwente.nl>
Date: Wed, 31 Jan 2007 08:50:34 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <467450.36829.qm@web15206.mail.cnb.yahoo.com>
In-Reply-To: <467450.36829.qm@web15206.mail.cnb.yahoo.com>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Trouble with building "libbonoboui" ?
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
X-List-Received-Date: Wed, 31 Jan 2007 07:50:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

zechao wang schreef:
> Hello everyone, i get some trouble when building the package of "libbonoboui"!
> At first, i build a old version (2.10.0) of "libbonoboui", and i get the Error Message: ' .../staging/arm-poky-linux/include/gtk-2.0/gtk/gtkstatusbar.h:68: error: parse error before "GMemChunk" '
> 
> I search the reason, some one said that it's caused by "glib-2.0", for the "glib-2.0" is too new. Glib is a basic package, and i couldn't change it. 
> 
> So i rebuild the libbonoboui with a new version(2.14.0), but the Error is still.
> 
> Please help, thanks very much...

More than one person has given you the solution to *all* the problems you posted about on
this and the gpe list. Either follow that advice, or stop posting. You're *very* close to
getting your email address blocked at the oe and gpe mailinglists.

It isn't rocket science, reading email and following instructions, but it seems it's too
hard for you. Maybe you should considering re-doing primary school?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFwEpKMkyGM64RGpERArCvAKCDlOYZLaVqWDBYDfrKoGm2v2Us2gCfTYDf
t/BtDvfEcDIbBzt5z0xkOFA=
=oBH7
-----END PGP SIGNATURE-----


