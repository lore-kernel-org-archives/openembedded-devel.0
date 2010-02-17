Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nhpv2-0000tt-CF for openembedded-devel@lists.openembedded.org;
	Wed, 17 Feb 2010 20:50:47 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NhpsT-0005Hy-7h for openembedded-devel@lists.openembedded.org;
	Wed, 17 Feb 2010 20:48:05 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2010 20:48:05 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2010 20:48:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 17 Feb 2010 20:47:43 +0100
Message-ID: <hlhh4u$gh0$1@ger.gmane.org>
References: <ac9c93b11001300235y22a60e82qf35d712b8323807d@mail.gmail.com>	<hk12nm$sdo$1@ger.gmane.org>
	<hlhc1p$t19$1@ger.gmane.org>	<ac9c93b11002171058o7f48b417yee87d06da09c7577@mail.gmail.com>	<hlhf2a$aei$1@ger.gmane.org>
	<ac9c93b11002171140r54616c87t24667b2fefb129a1@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100212 Shredder/3.0.2pre
In-Reply-To: <ac9c93b11002171140r54616c87t24667b2fefb129a1@mail.gmail.com>
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
X-List-Received-Date: Wed, 17 Feb 2010 19:50:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 17-02-10 20:40, Frans Meulenbroeks wrote:
> 2010/2/17 Koen Kooi <k.kooi@student.utwente.nl>:
> On 17-02-10 19:58, Frans Meulenbroeks wrote:
>>>> 2010/2/17 Koen Kooi <k.kooi@student.utwente.nl>:
>>>> On 30-01-10 11:47, Rolf Leggewie wrote:
>>>>>>> Frans Meulenbroeks wrote:
>>>>>>>> Wouldn't it be cleaner to rename ANGSTROM_EXTRA_INSTALL to e.g.
>>>>>>>> DISTRO_EXTRA_INSTALL ?
>>>>>>>
>>>>>>> This has been discussed before, but not changed.  I think it made sense
>>>>>>> back then and I think it makes sense now.
>>>>>>>
>>>>>>> I believe there is even a better name than DISTRO_EXTRA_INSTALL to be
>>>>>>> found for the variable.  Maybe IMAGE_EXTRA_INSTALL?
>>>>
>>>> of all the ways to solve it, you just had to go out of your way to annoy
>>>> people.
>>>>
>>>>> I BEG YOUR PARDON
>>>>
>>>>> I did not make the change, actually I have not even seen it. I think
>>>>> you owe me an apology for this.
>>>>> I also would like to get the opinion of the TSC on the above accusation.
> 
> Please pay attention, I responded to rolfs mail, not yours
> 
>> You are quoting only from my email and have edited all of Rolfs' text
>> away, so although technically you might be responding to his email, by
>> keeping only my text you create the impression that the reaction is
>> towards me.

I am not, this was Rolfs mail:

- -----------

Frans Meulenbroeks wrote:
> > Wouldn't it be cleaner to rename ANGSTROM_EXTRA_INSTALL to e.g.
> > DISTRO_EXTRA_INSTALL ?
This has been discussed before, but not changed.  I think it made sense
back then and I think it makes sense now.

I believe there is even a better name than DISTRO_EXTRA_INSTALL to be
found for the variable.  Maybe IMAGE_EXTRA_INSTALL?

- -----------

So that's 2 lines by you, 4 lines by rolf, and I included them all, with
proper quotation levels.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLfEffMkyGM64RGpERAuMPAJ96ERFwAYIhR+eC3JphENgeTtO2rwCfU6yZ
BPP4J17PFllKuh18Lsqc0vw=
=C9Ex
-----END PGP SIGNATURE-----



