Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QUOZQ-00055f-OM for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 21:37:40 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QUOWD-0004kH-Vf for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 21:34:21 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jun 2011 21:34:21 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jun 2011 21:34:21 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 08 Jun 2011 21:34:10 +0200
Message-ID: <isoiri$7c9$1@dough.gmane.org>
References: <0C757E680E33864AB113392C7E83F910BE5183@GSX300A.mxchg.m.corp>	<1307534514.2529.4780.camel@phil-desktop>	<0C757E680E33864AB113392C7E83F910BE5185@GSX300A.mxchg.m.corp>	<1307535707.2529.4783.camel@phil-desktop>	<0C757E680E33864AB113392C7E83F910BE5186@GSX300A.mxchg.m.corp>	<iso6bf$lu8$1@dough.gmane.org>	<0C757E680E33864AB113392C7E83F910BE5188@GSX300A.mxchg.m.corp>	<20110608165027.GA30722@excalibur.local>	<0C757E680E33864AB113392C7E83F910BE5189@GSX300A.mxchg.m.corp>
	<20110608172121.GB30722@excalibur.local>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <20110608172121.GB30722@excalibur.local>
X-Enigmail-Version: 1.0.1
Subject: Re: Amend recipes which do not contain a (new) target machine in COMPATIBLE_MACHINE
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
X-List-Received-Date: Wed, 08 Jun 2011 19:37:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08-06-11 19:21, Stefan Schmidt wrote:
> Hello.
> 
> On Wed, 2011-06-08 at 19:02, Hauser, Wolfgang (external) wrote:
>>> With archive you mean the release bracnh with all maintenance patches?
>>
>>> What packages do you
>>> see failing and whats your distro, etc?
>>
>> I took the tar file from OE git server (release-2011.03.tar.gz) and use
>> distribution angstom-2010x as a base for my own system.
> 
> OK so its the fixed release tarball without any patches we applied in
> the maintenance branch.
> 
> I'm using angstrom 2008 here but I think Koen does build both distros
> from 2011.03

I built 2008 from maintenance and 2010 from dev, but philip builds 2010
from maintenance for his product, so I know that's working
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN786yMkyGM64RGpERAvHJAJ9ZAy+xjxgM8AGZgAmJ6IPPjciDZwCgrmU5
gTaaaRG6y0/yvEAKT96E2rw=
=Qnmo
-----END PGP SIGNATURE-----



