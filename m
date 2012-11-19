Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TaVvs-0003sS-J8 for openembedded-devel@lists.openembedded.org;
	Mon, 19 Nov 2012 19:18:56 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TaViS-0004BY-Nt for openembedded-devel@lists.openembedded.org;
	Mon, 19 Nov 2012 19:05:04 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Nov 2012 19:05:04 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Nov 2012 19:05:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 19 Nov 2012 18:59:10 +0100
Message-ID: <k8ds18$id4$3@ger.gmane.org>
References: <cover.1353345006.git.paul.eggleton@linux.intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
In-Reply-To: <cover.1353345006.git.paul.eggleton@linux.intel.com>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-networking][PATCH 0/8] Networking recipes
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
X-List-Received-Date: Mon, 19 Nov 2012 18:18:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 19-11-12 18:11, Paul Eggleton schreef:
> The following changes since commit
> b69b6e04f12b2fc45a3ebac8c741bda41fea6409:
> 
> netperf: import from oe-classic and upgrade to 2.6.0 (2012-11-19 11:18:30
> -0500)
> 
> are available in the git repository at:
> 
> git://git.openembedded.org/meta-openembedded-contrib paule/networking 
> http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/networking
>
>  Paul Eggleton (8): tftp-hpa: add from OE-Classic, update and tidy up 
> tunctl: add from OE-Classic and tweak quagga: add from OE-Classic, update
> and tidy-up radvd: add from OE-Classic, update and tidy up vblade: add
> from OE-Classic, update and tidy up xl2tpd: add from OE-Classic, update
> and tidy up proftpd: add from meta-baryon mtr: add from OE-Classic,
> update and tidy up

Most of the initscripts will break if you set $prefix="" in your distro.conf.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQqnNuMkyGM64RGpERAm/GAJ9/vff0dDvJMor3nwO9Gn94p6I0tgCfVQ8d
2pr46MnFVAwTX5BICuG5ziQ=
=BZC/
-----END PGP SIGNATURE-----



