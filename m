Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q2hyl-0003YM-CW for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 11:41:23 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q2hwy-0000Vc-KG for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 11:39:32 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 11:39:32 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 11:39:32 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 24 Mar 2011 11:39:19 +0100
Message-ID: <imf70n$dcv$1@dough.gmane.org>
References: <cover.1300961186.git.Martin.Jansa@gmail.com>
	<1300962537.3795.26.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1300962537.3795.26.camel@mattotaupa>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 0/7] Checksums and LIC_FILES_CHKSUMs
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
X-List-Received-Date: Thu, 24 Mar 2011 10:41:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 24-03-11 11:28, Paul Menzel wrote:
> Am Donnerstag, den 24.03.2011, 11:09 +0100 schrieb Martin Jansa:
>> Mostly checksums and LIC_FILES_CHKSUMs
> 
> I have never heard of 'LIC_FILES_CHKSUM'.
> 
>         $ git grep 'LIC_FILES'
>         recipes/htop/htop_0.9.bb:LIC_FILES_CHKSUM = "file://COPYING;md5=c312653532e8e669f30e5ec8bdc23be3"
>         recipes/lighttpd/lighttpd_1.4.28.bb:LIC_FILES_CHKSUM = "file://COPYING;md5=e4dac5c6ab169aa212feb5028853a579"
>         recipes/ofono/ofono.inc:LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
>         recipes/wpa-supplicant/wpa-supplicant-0.7.inc:LIC_FILES_CHKSUM = "file://../COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
> 
> It looks like this is something from Pkoy [1]. So is this for the merge
> with Yocto?

This is for http://cgit.openembedded.org/cgit.cgi/meta-openembedded/

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNix9XMkyGM64RGpERAoqnAJ4gdzyAl8FYrGE6sX26swBFFpdaMQCcCFpH
9EVH8PewwCg1yyXOJkYpZoc=
=Lvdu
-----END PGP SIGNATURE-----



