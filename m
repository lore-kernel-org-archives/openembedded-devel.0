Received: from [64.62.194.115] (helo=netgate.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <jim@netgate.com>) id 1HHT0N-0004w6-8h
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Feb 2007 23:53:39 +0100
Received: from [192.168.2.198] (rrcs-67-52-77-54.west.biz.rr.com [67.52.77.54])
	by netgate.com (Postfix) with ESMTP id 0B1B228006A;
	Wed, 14 Feb 2007 14:53:37 -0800 (PST)
In-Reply-To: <45D38F2C.1030700@dominion.kabel.utwente.nl>
References: <1171051575.3886.12.camel@localhost.localdomain>	<200702141311.17165.openembedded@hrw.one.pl>	<1171489223.1692.501.camel@localhost.localdomain>	<1171489873.11033.7.camel@localhost.localdomain>	<45D38BB9.5070709@am.sony.com>
	<96763D62-00DF-440D-8688-E237E1CE0BB8@netgate.com>
	<45D38F2C.1030700@dominion.kabel.utwente.nl>
Mime-Version: 1.0 (Apple Message framework v752.3)
Message-Id: <6385CB83-3092-471F-B579-BDD8A2A65133@netgate.com>
From: Jim Thompson <jim@netgate.com>
Date: Wed, 14 Feb 2007 12:53:21 -1000
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.752.3)
Cc: openembedded-devel@openembedded.org
Subject: Re: OE Booth during fosdem
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Feb 2007 22:53:40 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit


On Feb 14, 2007, at 12:37 PM, Koen Kooi wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Jim Thompson schreef:

>> Ya know, I'd consider donating hardware (see www.netgate.com for what
>> we have) and/or cash if someone would put up a
>> "build the bootable ISO so you can boot-n-install an OE image on a
>> HD on ye-olde-random PeeCee" set of patches, or even a recipe for  
>> same
>>
>> Or, equivalently, an image (complete with boot sector) that one could
>> DD onto a CF card or actual IDE drive that would boot a given root
>> image on ye-olde-PeeCee.
>>
>> OpenEmbedded would go a lot faster if people could experiment on
>> garden-variety PCs rather than go through the "fun" of getting it up-
>> n-running on more esoteric hardware.
>
> Marcin, Jamie, Phil, Gerwin and I are using OE to build for vairous  
> x86 machines
> (MACHINE={guinness,epia,x86). For some graphic pleasure:
> http://dominion.kabel.utwente.nl/koen/cms/madness

I know about the guinness and wrap MACHINEs.

What I'm looking for is a short-cut to getting a distro *onto* the disk.

Yes, I'm sure most people could "figure it out" with some time and  
effort, but what I want is to make it easier.

If OE would build an x86 disk image that could be 'dd'-ed to a CF  
card, then building OE images for Soekris or WRAP boards would be EZ.

If OE would build an x86 disk image that could be 'dd'-ed to an IDE  
drive (likely the same as above), then building OE images for  
"ordinary PCs" would be trivial.

If OE would build a bootable ISO image that could partition and label  
an attached IDE drive, then install the image *onto* that drive, ....  
well, I could see all *sorts* of uses for that.

And I'm willing to throw cash, hardware and time at this.

Yes, we sell WRAP boards, but I'm not looking to get a bunch-o-free  
development out of the process.  (We sell a Gateworks ixp42x board  
too, just to be perfectly honest.)

Years ago, I ran (and owned) 'musenki' (google for it or look here:  
http://he-colo.netgate.com/~jim/Musenki/.  We had build a  set of  
Motorola 8245/8241 boards, and I'd made linux run on them.  I  
remember spending a horrific amount of time with a (very) early  
version of "buildroot".  OE is so much more sophisticated that I'm a  
bit taken aback.

The OE learning curve is still quite steep, but I think it would be  
less steep with a) a bit more documentation and b) an EZ way to start  
creating "little distros" that
run on PCs using it.

Jim



