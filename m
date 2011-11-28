Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RV1xW-0002qy-2T for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 15:13:26 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RV1r3-00041R-Ab for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 15:06:45 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2011 15:06:45 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2011 15:06:45 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 28 Nov 2011 15:06:30 +0100
Message-ID: <jb04h6$241$1@dough.gmane.org>
References: <CA+M6bX=PYZ+2vb32ZmT3SirqHdKpCtD90QqtHhQiWSp38f1kVA@mail.gmail.com>	<1322476245.26081.89.camel@phil-desktop>	<1322478479.26287.15.camel@ted>	<CAP9ODKqJdi_fNhBN7QZambbSRtE6w8z--EYRYoypT1Mm5AV6gw@mail.gmail.com>
	<4ED38DA1.8060802@balister.org> <4ED38E5E.9060201@balister.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <4ED38E5E.9060201@balister.org>
X-Enigmail-Version: 1.3.3
Subject: Re: Documentation problems
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
X-List-Received-Date: Mon, 28 Nov 2011 14:13:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 28-11-11 14:36, Philip Balister schreef:
> On 11/28/2011 08:33 AM, Philip Balister wrote:
>> On 11/28/2011 06:16 AM, Otavio Salvador wrote:
>>> On Mon, Nov 28, 2011 at 09:07, Richard Purdie < 
>>> richard.purdie@linuxfoundation.org> wrote:
>>> 
>>>> Rather than fork off the Yocto docs for OE's needs, it would be
>>>> nice to see if there was a way we could share the documentation.
>>>> 
>>> 
>>> I fully agree with that.
>>> 
>>> The work would be much easier if all that could be shared.
>>> 
>>> AFAIK, using docbook it is possible to use macros to expand for
>>> branding and also conditional to output text so this could be done in
>>> a single repository.
>>> 
>> 
>> We need to be really careful how all the pieces get branded. There is 
>> way too much confusion already, without referring people to the "Yocto 
>> Instructions" to use OE-core + layers.
> 
> Just to be really clear .....
> 
> Also, not I am not opposed to a unified documentation set, just that it 
> is clear to people what things are called.

I started composing an email listing a lot of the phrases we need to avoid
("yocto builds <foo>"), but I deleted it since previous attempts have been
met with deafening silence. As I said during the GA: an excellent task for
the board.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7TlWIACgkQMkyGM64RGpGP3QCgqT0MHXqB1XsNLTEq5zHiPTSo
/CUAnR0FpleNrCBkRnDSzA0eLRzGG0bp
=ErdT
-----END PGP SIGNATURE-----



