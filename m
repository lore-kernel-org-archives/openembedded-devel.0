Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QC7IJ-0006JW-BJ for openembedded-devel@lists.openembedded.org;
	Tue, 19 Apr 2011 11:32:29 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QC7G0-0001vW-J5 for openembedded-devel@lists.openembedded.org;
	Tue, 19 Apr 2011 11:30:04 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2011 11:30:04 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2011 11:30:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 19 Apr 2011 11:25:58 +0200
Message-ID: <iojkf6$aka$2@dough.gmane.org>
References: <1303169791-19354-1-git-send-email-schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1303169791-19354-1-git-send-email-schnitzeltony@gmx.de>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH v3] u-boot_overo: current version does not boot / read expansion board ID.
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
X-List-Received-Date: Tue, 19 Apr 2011 09:32:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 19-04-11 01:36, Andreas Mueller wrote:
> Patches & settings were taken from [1] / branch overo.
> For more informations see [2].
> 
> Tests performed:
> * boot kernel 2.6.37 from SDCard
> * boot kernel 2.6.30 from NAND
> * variable manipulations setenv printenv savenv
> * NAND erase

NAK, you're going back to an older version without saying why.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNrVUmMkyGM64RGpERAsILAJ9RIKrQQ4uysJ54mpPXGgOfBi3IPQCffmS5
TMysr3kcU25LdpQgybSJH1E=
=vZ6g
-----END PGP SIGNATURE-----



