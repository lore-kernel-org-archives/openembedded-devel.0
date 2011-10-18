Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RGFK6-0007GI-36 for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 21:27:38 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RGFER-0004CD-Uw for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 21:21:47 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 21:21:47 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 21:21:47 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 18 Oct 2011 21:21:35 +0200
Message-ID: <j7kjjv$ud8$1@dough.gmane.org>
References: <359a5968f27008d6fcbaee5137c237bfcabd2579.1318946821.git.Martin.Jansa@gmail.com>
	<c4b964c5a17f463645b3e9cb7a8351bbe62eef9a.1318946821.git.Martin.Jansa@gmail.com>
	<1318949469.3538.34.camel@mattotaupa>
	<20111018162433.GJ20678@jama.jama.net>
	<j7ka5s$ioi$1@dough.gmane.org>
	<20111018165107.GA17242@jama.jama.net>
	<j7kb44$pmd$1@dough.gmane.org> <20111018173948.GA556@jama.jama.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <20111018173948.GA556@jama.jama.net>
X-Enigmail-Version: 1.3.2
Subject: Re: [meta-efl 3/3] lightmediascanner: Add version 0.4.4 (initial recipe)
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
X-List-Received-Date: Tue, 18 Oct 2011 19:27:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 18-10-11 19:39, Martin Jansa schreef:
> On Tue, Oct 18, 2011 at 06:56:36PM +0200, Koen Kooi wrote:
>>> because of eglibc or uclibc?
>> 
>> uclibc, the 'libc-glibc' override is true for both (e)glibc.
> 
> Ah OK,
> 
> -RDEPENDS_${PN}-test = "glibc-gconv-utf-16" 
> +RDEPENDS_${PN}-test_append_libc-glibc = "glibc-gconv-utf-16"

The branch has a space after the first quote, right?

> 
> tested on nokia900 and done in branch
> 
> Regards,
> 
> 
> 
> 
> _______________________________________________ Openembedded-devel
> mailing list Openembedded-devel@lists.openembedded.org 
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOndG/MkyGM64RGpERAsasAKCUMgJWC9EAxDVKVJRF3P5k3cC4AQCghk7g
9xAqFKNdmygRhd7vSRq2Yqs=
=ALWc
-----END PGP SIGNATURE-----



