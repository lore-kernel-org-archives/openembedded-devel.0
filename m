Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PJOEf-0002Yc-T1 for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 11:30:33 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PJODb-0004br-Qa for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 11:29:23 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Nov 2010 11:29:23 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Nov 2010 11:29:23 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 19 Nov 2010 11:29:11 +0100
Message-ID: <ic5jhn$iu7$1@dough.gmane.org>
References: <AANLkTi=4sU4238+b8zyJJ35VCyJB2ysestx9N=_my697@mail.gmail.com>	<ic06a8$uft$1@dough.gmane.org>
	<4CE3A6DE.2070203@xora.org.uk>	<ic0aj2$hqc$1@dough.gmane.org>	<AANLkTimdqZ1hdZNPN70LXd1WuJSn4pU2y=2C5tZs0-LT@mail.gmail.com>
	<1290074903.3183.202.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.15) Gecko/20101031 Shredder/3.0.11pre
In-Reply-To: <1290074903.3183.202.camel@mill.internal.reciva.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Preparing for release - Freeze on master
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
X-List-Received-Date: Fri, 19 Nov 2010 10:30:35 -0000
X-List-Received-Date: Fri, 19 Nov 2010 10:30:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 18-11-10 11:08, Phil Blundell wrote:
> On Wed, 2010-11-17 at 11:26 -0800, Khem Raj wrote:
>> Should we create a release branch before we release and solidify that ? 
> 
> Yes, please do that.  We discussed this issue at yesterday's TSC meeting
> (full minutes to follow shortly) and the consensus was that trying to
> enforce a complete freeze on master at short notice is not going to be
> practical.
> 
> Obviously the exact process you use is up to you, but I would suggest
> something along the lines of:
> 
> 1. make a stabilisation branch from some semi-arbitrary point, maybe one
> of the existing weekly test versions.

At OEDEM we decided that there would be no branch, only a tag, could the
TSC elaborate why they are going against that?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFM5lF3MkyGM64RGpERAr/pAJwIE46snPNsW42xpR6J3wKJGxpw0gCgkvhZ
MFR65AifpMR/v69fhN6JwNQ=
=aCtY
-----END PGP SIGNATURE-----



