Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RW30P-0006vF-6s for openembedded-devel@lists.openembedded.org;
	Thu, 01 Dec 2011 10:32:37 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RW2ts-0001ke-OK for openembedded-devel@lists.openembedded.org;
	Thu, 01 Dec 2011 10:25:52 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Dec 2011 10:25:52 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Dec 2011 10:25:52 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 01 Dec 2011 10:25:39 +0100
Message-ID: <jb7h6j$ek$1@dough.gmane.org>
References: <jb5vpp$c8o$1@dough.gmane.org>
	<20111201080837.GB17111@novatech.datenfreihafen.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <20111201080837.GB17111@novatech.datenfreihafen.org>
X-Enigmail-Version: 1.3.3
Subject: Re: OE-core based java layer?
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
X-List-Received-Date: Thu, 01 Dec 2011 09:32:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 01-12-11 09:08, Stefan Schmidt schreef:
> Hello.
> 
> On Wed, 2011-11-30 at 20:22, Koen Kooi wrote:
>> 
>> Beagleboard.org has moved to the OE-core metaverse to build the
>> factory images and we need java support to stay feature compatible with
>> OE classic.
>> 
>> Are there already people working on such a thing or should I just go
>> ahead and add a meta-java to the meta-oe repo and start importing
>> recipes one-by-one?
> 
> Henning already did it. https://github.com/woglinde/meta-java/
> 
> I was able to build openjdk-6 from it.

I've found a common theme for this week: It works if you follow the README,
but noone actually reads a README :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7XSBMACgkQMkyGM64RGpFb9gCfV34u1uP26A7os77pXJwdnZWd
77wAn1aWEKIqEftpwVFqzVRVeCvoGf2V
=veMI
-----END PGP SIGNATURE-----



