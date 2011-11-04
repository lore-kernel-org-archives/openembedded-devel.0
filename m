Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RMN9A-00074t-2b for openembedded-devel@lists.openembedded.org;
	Fri, 04 Nov 2011 18:01:40 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RMN3B-0004nz-BE for openembedded-devel@lists.openembedded.org;
	Fri, 04 Nov 2011 17:55:29 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Nov 2011 17:55:28 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Nov 2011 17:55:28 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 04 Nov 2011 17:55:16 +0100
Message-ID: <j915dk$4rp$1@dough.gmane.org>
References: <1320399536-9588-1-git-send-email-Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <1320399536-9588-1-git-send-email-Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.3.2
Subject: Re: [PATCH] mplayer2: import from OE-classic
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
X-List-Received-Date: Fri, 04 Nov 2011 17:01:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 04-11-11 10:38, Martin Jansa schreef:
> * taken from 1a91fc4b705b0c4f45eb088a2f7aea01ebc9c98e * dropped V4L1,
> largefile, xvmc * added libass * added LIC_FILES_CHKSUM * upgraded to
> latest SRCREV * moved glamo patch to meta-openmoko layer

I did some more fixes, it still doesn't build for armv7a or if you use
- --as-needed, but to get parsing to work again I pushed it, OE-core style ;)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOtBj0MkyGM64RGpERAsC0AJ96GU31nRYnk5b9YXMMMYDdytS3tACgu9cB
I7SHKc1LjGCRba1yX295//c=
=MfO5
-----END PGP SIGNATURE-----



