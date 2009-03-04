Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LepY1-0001KE-8H
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 12:46:01 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LepTz-0002eJ-Qy
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 11:41:51 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 04 Mar 2009 11:41:51 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 04 Mar 2009 11:41:51 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 04 Mar 2009 12:41:43 +0100
Message-ID: <golpdn$mni$1@ger.gmane.org>
References: <20090303204954.CCB9CE8008@amethyst.openembedded.net>	<1236119119.10602.62.camel@andromeda>
	<49ADB183.5070709@balister.org>	<1236120999.10602.70.camel@andromeda>
	<49AE5117.5020806@gefanuc.com>	<1236162102.10602.97.camel@andromeda>
	<golmkq$cve$1@ger.gmane.org> <1236165806.10602.102.camel@andromeda>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090225 Shredder/3.0b3pre
In-Reply-To: <1236165806.10602.102.camel@andromeda>
Sender: news <news@ger.gmane.org>
Subject: Re: [oe-commits] Koen Kooi : angstrom 2009.X: bump automake-native to 1.10. 2 since some idiot deleted 1.10
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
X-List-Received-Date: Wed, 04 Mar 2009 11:46:01 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04-03-09 12:23, Michael 'Mickey' Lauer wrote:
> Am Mittwoch, den 04.03.2009, 11:54 +0100 schrieb Koen Kooi:
>> On 04-03-09 11:21, Michael 'Mickey' Lauer wrote:
>>> Am Mittwoch, den 04.03.2009, 09:59 +0000 schrieb Martyn Welch:
>>>> "Review" is defined as posting it on the mailing lists and getting positive agreement from two or more core developers.
>>> Let me propose these kinds of patches being promoted in an unstable
>>> branch rather than via mailing list. This eases testing and playing
>>> around with the patch.
>> Patches posted to the mailinglist get more eyes on them.
>
> More eyes but less actual testing, since it involves patching your
> current tree to be able to see the effects.

The current patch reviews have picked out a lot of potential bugs just 
by looking at it, which we would loose by going branch only.

Again, why are people so affraid of posting intrusive patches for review?

>>> Although there were 0 comments (among those none in favour, but also
>>> none against), I still think that org.oe.{stable,testing(dev),unstable}
>>> with a strict only-cherry-picking-from-right-to-left-allowed policy
>>> would improve our workflow and overall stability.
>> That will just boil down to people only using stable or testing
>
> All but those who actually work on the branch -- which sounds like a
> good thing to me, since that's what stable and testing are about.

But noone would be working on it, since they have better things to do 
than play guinnea pig. I for one wouldn't be working on it.

Something like userbranches like poky has would be a better idea, people 
still get a no-holds-barred playground and when things work properly 
they can merge it, maybe asking for advice before merging.

regards,

Koen




