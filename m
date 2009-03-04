Received: from [64.18.0.26] (helo=exprod5og113.obsmtp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@gefanuc.com>) id 1LepYA-0001KZ-8T
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Mar 2009 12:46:11 +0100
Received: from source ([4.79.213.129]) (using TLSv1) by
	exprod5ob113.postini.com ([64.18.4.12]) with SMTP
	ID DSNKSa5pBkgZ8KaMEIQ/+8+yZ3wrBH4FliF9@postini.com;
	Wed, 04 Mar 2009 03:42:00 PST
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by Alpmlip06.e2k.ad.ge.com with ESMTP; 04 Mar 2009 06:41:55 -0500
Received: from ind-3n4b83jh1.amer.consind.ge.com (HELO [192.168.219.128])
	([3.138.54.81])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 04 Mar 2009 06:41:54 -0500
Message-ID: <49AE6924.2090903@gefanuc.com>
Date: Wed, 04 Mar 2009 11:42:28 +0000
From: Martyn Welch <martyn.welch@gefanuc.com>
Organization: GE Fanuc Intelligent Platforms Ltd.
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20090303204954.CCB9CE8008@amethyst.openembedded.net>	<1236119119.10602.62.camel@andromeda>
	<49ADB183.5070709@balister.org>	<1236120999.10602.70.camel@andromeda>
	<49AE5117.5020806@gefanuc.com>	<1236162102.10602.97.camel@andromeda>
	<golmkq$cve$1@ger.gmane.org> <1236165806.10602.102.camel@andromeda>
In-Reply-To: <1236165806.10602.102.camel@andromeda>
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
X-List-Received-Date: Wed, 04 Mar 2009 11:46:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Michael 'Mickey' Lauer wrote:
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
> 

But had a patch deleting multiple versions of a core package been posted to the mailing list, people would have had a chance to object. In some cases the effect that a patch will have can be quite evident enough by looking at it, the patch wouldn't necessarily have needed to actually have been applied.

Martyn

-- 
Martyn Welch MEng MPhil MIET (Principal Software Engineer)   T:+44(0)1327322748
GE Fanuc Intelligent Platforms Ltd,        |Registered in England and Wales
Tove Valley Business Park, Towcester,      |(3828642) at 100 Barbirolli Square,
Northants, NN12 6PF, UK T:+44(0)1327359444 |Manchester,M2 3AB  VAT:GB 729849476


