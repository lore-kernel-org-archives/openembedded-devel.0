Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QhO57-0008CG-9R for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jul 2011 17:44:05 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QhO1E-0000Rd-J9 for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jul 2011 17:40:04 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jul 2011 17:40:04 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jul 2011 17:40:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 14 Jul 2011 17:39:20 +0200
Message-ID: <ivn2j8$68o$2@dough.gmane.org>
References: <cover.1310656986.git.paul.eggleton@linux.intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
In-Reply-To: <cover.1310656986.git.paul.eggleton@linux.intel.com>
X-Enigmail-Version: 1.2
Subject: Re: [meta-oe] [PATCH 0/3] minor cleanup
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
X-List-Received-Date: Thu, 14 Jul 2011 15:44:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 14-07-11 17:25, Paul Eggleton schreef:
> Tidy up a few things in meta-openembedded.
> 
> The following changes since commit
> 7a8b1010e850b0338f05eacf181e78462355eac6:
> 
> icon-naming-utils: Inherit perlnative (2011-07-13 09:01:16 +0200)
> 
> are available in the git repository at: 
> git://git.openembedded.org/meta-openembedded-contrib paule/cleanup 
> http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/cleanup
>
>  Paul Eggleton (3): Drop PRIORITY variable pango: remove inherit of
> flow-lossage.bbclass

These 2 don't apply anymore after the cleanup I did today, could you
please rebase them?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOHw2oMkyGM64RGpERAp8AAKC8LQJUbhHkKH4nRB/YVe86TacojQCgtBs8
pEaN1xqrZI4ILCMGpxtlhfE=
=RXrT
-----END PGP SIGNATURE-----



