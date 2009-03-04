Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1LepGD-0000pf-RF
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Mar 2009 12:27:38 +0100
Received: from [192.168.1.105] (e180183108.adsl.alicedsl.de [85.180.183.108])
	by drlauer-research.com (Postfix) with ESMTP id 4F9B9584168
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2009 12:48:08 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <golmkq$cve$1@ger.gmane.org>
References: <20090303204954.CCB9CE8008@amethyst.openembedded.net>
	<1236119119.10602.62.camel@andromeda> <49ADB183.5070709@balister.org>
	<1236120999.10602.70.camel@andromeda> <49AE5117.5020806@gefanuc.com>
	<1236162102.10602.97.camel@andromeda>  <golmkq$cve$1@ger.gmane.org>
Organization: Vanille-Media
Date: Wed, 04 Mar 2009 12:23:26 +0100
Message-Id: <1236165806.10602.102.camel@andromeda>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
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
X-List-Received-Date: Wed, 04 Mar 2009 11:27:40 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Mittwoch, den 04.03.2009, 11:54 +0100 schrieb Koen Kooi:
> On 04-03-09 11:21, Michael 'Mickey' Lauer wrote:
> > Am Mittwoch, den 04.03.2009, 09:59 +0000 schrieb Martyn Welch:
> >> "Review" is defined as posting it on the mailing lists and getting positive agreement from two or more core developers.
> >
> > Let me propose these kinds of patches being promoted in an unstable
> > branch rather than via mailing list. This eases testing and playing
> > around with the patch.
> 
> Patches posted to the mailinglist get more eyes on them.

More eyes but less actual testing, since it involves patching your
current tree to be able to see the effects.

> > Although there were 0 comments (among those none in favour, but also
> > none against), I still think that org.oe.{stable,testing(dev),unstable}
> > with a strict only-cherry-picking-from-right-to-left-allowed policy
> > would improve our workflow and overall stability.
> 
> That will just boil down to people only using stable or testing

All but those who actually work on the branch -- which sounds like a
good thing to me, since that's what stable and testing are about.

-- 
:M:



