Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TRW5c-0001UO-6S for openembedded-devel@lists.openembedded.org;
	Fri, 26 Oct 2012 00:39:48 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TRVsg-0003aA-DS for openembedded-devel@lists.openembedded.org;
	Fri, 26 Oct 2012 00:26:26 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2012 00:26:26 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2012 00:26:26 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 26 Oct 2012 00:26:04 +0200
Message-ID: <k6ce9q$6ec$1@ger.gmane.org>
References: <CABcZANmC_c-fZMBHH4tc7gvJdrs_UPoFhn19X+T1E7beqRbXLQ@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
In-Reply-To: <CABcZANmC_c-fZMBHH4tc7gvJdrs_UPoFhn19X+T1E7beqRbXLQ@mail.gmail.com>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-browser] Question regarding status of chromium recipes
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
X-List-Received-Date: Thu, 25 Oct 2012 22:39:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 25-10-12 20:01, Chris Larson schreef:
> Greetings,
> 
> I'm wondering if the chromium recipes in this layer have ever been build
> tested. As far as I can tell, both 19 and 20 are missing dependencies on
> udev (libudev), gtk+, and gconf, and 20 also wants the openssl headers.
> 19 also fails due to an attempt to build/link a native tool requiring
> libxi, so it seems it can't be built without x11 headers on the build
> machine (along with the odd ld.gold requirement). Given these issues, I
> figured I'd throw out a contact email and try to determine if perhaps the
> OSSystems folks have local changes that never made it into the public
> layer, or if the recipes just didn't get a great deal of testing.
> 
> Thanks, I'd appreciate any input on their status :)

Nice timing, I just received a request for a working chromium build and I
ran into similar if not the same issues :)



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQibx8MkyGM64RGpERAuWWAJ9ooRxIMeMmyWCAT5gCkfYjrx05NwCgso/G
hWVMQT8AZkx2MOXqsr+xARc=
=2i+V
-----END PGP SIGNATURE-----



