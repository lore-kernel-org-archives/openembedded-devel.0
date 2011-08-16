Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QtJ8P-00011B-38 for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 14:52:45 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QtJ3x-0008Hf-FS for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 14:48:09 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2011 14:48:09 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2011 14:48:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 16 Aug 2011 14:47:56 +0200
Message-ID: <j2dots$cu3$1@dough.gmane.org>
References: <cover.1313496291.git.anders@chargestorm.se>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
In-Reply-To: <cover.1313496291.git.anders@chargestorm.se>
X-Enigmail-Version: 1.2
Subject: Re: [meta-oe][PATCH v2 0/2] Import ckermit recipe
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
X-List-Received-Date: Tue, 16 Aug 2011 12:52:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 16-08-11 14:05, Anders Darander schreef:
> 
> Ckermit is useful, not least as an alternative to lrzsz for serial port file-transfer (it has been a lot more robust in a number of cases).
> 
> This patch series imports the ckermit recipe from oe-dev. Thereafter, ckermit gets updated to the latest version, which also has the licensed change to BSD 3-clause.
> 
> V2: * Rebasing on the latest OE-version * Make sure that the patch is a rename, not add/delete pair.

Thanks, I q'd these after the binutils 2.20 patches, so they will go in after that completes its test build.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOSmb8MkyGM64RGpERAuPWAKCcgNTz/DvNGbx1DkFgs80sPLYwIwCeJ7OM
Ml3wIw3XHY9XLfdGJUdWA/I=
=kgBP
-----END PGP SIGNATURE-----



