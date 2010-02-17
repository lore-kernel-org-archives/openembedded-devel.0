Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NhoYt-0004wW-Ch for openembedded-devel@lists.openembedded.org;
	Wed, 17 Feb 2010 19:23:50 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NhoWI-0006Id-Tz for openembedded-devel@lists.openembedded.org;
	Wed, 17 Feb 2010 19:21:06 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2010 19:21:06 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2010 19:21:06 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 17 Feb 2010 19:20:43 +0100
Message-ID: <hlhc1p$t19$1@ger.gmane.org>
References: <ac9c93b11001300235y22a60e82qf35d712b8323807d@mail.gmail.com>
	<hk12nm$sdo$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100212 Shredder/3.0.2pre
In-Reply-To: <hk12nm$sdo$1@ger.gmane.org>
X-Enigmail-Version: 1.0.1
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: {RFC] console-image.bb
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
X-List-Received-Date: Wed, 17 Feb 2010 18:23:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 30-01-10 11:47, Rolf Leggewie wrote:
> Frans Meulenbroeks wrote:
>> Wouldn't it be cleaner to rename ANGSTROM_EXTRA_INSTALL to e.g.
>> DISTRO_EXTRA_INSTALL ?
> 
> This has been discussed before, but not changed.  I think it made sense
> back then and I think it makes sense now.
> 
> I believe there is even a better name than DISTRO_EXTRA_INSTALL to be
> found for the variable.  Maybe IMAGE_EXTRA_INSTALL?

of all the ways to solve it, you just had to go out of your way to annoy
people.

A simple IMAGE_EXTRA_INSTALL += ANGSTROM_EXTRA_INSTALL would have done
the job, but no, lets create more work for people, break existing docs
and especially ignore what the maintainer of the recipes said.

Way to go
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLfDN7MkyGM64RGpERAk0eAKCxLVowYlE4h9ls/kmdCcbj4uZesACfZxa0
VPWpTNi7tN+GxEfF/BYBf5Q=
=0Idf
-----END PGP SIGNATURE-----



