Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RpKMU-0003qT-V4 for openembedded-devel@lists.openembedded.org;
	Mon, 23 Jan 2012 14:55:07 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RpKF0-0003wC-EA for openembedded-devel@lists.openembedded.org;
	Mon, 23 Jan 2012 14:47:22 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jan 2012 14:47:22 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jan 2012 14:47:22 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 23 Jan 2012 14:47:02 +0100
Message-ID: <jfjocm$edq$1@dough.gmane.org>
References: <1327304731-4251-1-git-send-email-schnitzeltony@gmx.de>
	<1327304731-4251-3-git-send-email-schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1327304731-4251-3-git-send-email-schnitzeltony@gmx.de>
X-Enigmail-Version: 1.3.4
Subject: Re: [meta-oe 3/3] gimp: initial add 2.6.11
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
X-List-Received-Date: Mon, 23 Jan 2012 13:55:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 23-01-12 08:45, Andreas Müller schreef:
> * based on oe-classic [1]-[2] * build tested incremental & from scratch
> in angstrom environment * run tested on overo
> 
> [1] http://cgit.openembedded.org/openembedded/tree/recipes/gimp/gimp.inc 
> [2]
> http://cgit.openembedded.org/openembedded/tree/recipes/gimp/gimp_2.6.8.bb

I
> 
get the following error when building from arm:

|
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/lib/libpangocairo-1.0.so:
file not recognized: File format not recognized
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFPHWTWMkyGM64RGpERAnuKAJ0cltOqGzu3dE7YKCp8LzhV54CQpwCdG4we
M6/m3dg0rzDKUYvgs0kULgo=
=aayv
-----END PGP SIGNATURE-----



