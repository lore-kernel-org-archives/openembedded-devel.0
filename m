Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PInZb-0005ZC-K5
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 20:21:41 +0100
Received: by yxd5 with SMTP id 5so1422287yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 11:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=W3JEoZ5Un1SdlsE8toZZJNxzhkbgS0I6U9J+pSdMF9Q=;
	b=tPHr/YXhfSqYtv70QRFRhTlJS1/G3Z/kCCcn0qFWHsUMqOrQPnKNJji3nKkJzGBTeq
	FIwSq2LB12YGVgmDv8Zfme97XGy4gbGDiFpSRjRIwkWcPCVGRzyt3VefehBo8At5YndH
	mMMvzIRdiekBZkQOHOcDxaKMoJs+3Aeh6Z88o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=hrm6FcFAyAwgkJpYqVj/xr2bErYKNUvq+Aa8nlIFQ0ir5x2twzGtrvSC3VrZVjgtyT
	zAZcR3wV0z5eIhbwRYz0HLK/AVO8ig1ks+zaXntEJ71bMuIsYIeifK5AgoL8CJG5sWq1
	M3IDNTOtaCuf+gZ8arBAsJxg/wijta3QRTEbI=
Received: by 10.90.99.8 with SMTP id w8mr12052184agb.0.1290021631172; Wed, 17
	Nov 2010 11:20:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Wed, 17 Nov 2010 11:20:11 -0800 (PST)
In-Reply-To: <4CE3A6DE.2070203@xora.org.uk>
References: <AANLkTi=4sU4238+b8zyJJ35VCyJB2ysestx9N=_my697@mail.gmail.com>
	<ic06a8$uft$1@dough.gmane.org> <4CE3A6DE.2070203@xora.org.uk>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Nov 2010 11:20:11 -0800
Message-ID: <AANLkTi=JETd6A8XPA9+MiyeUzZYioP8b29NxWH=6fOxc@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Preparing for release - Freeze on master
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
X-List-Received-Date: Wed, 17 Nov 2010 19:21:41 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 17, 2010 at 1:56 AM, Graeme Gregory <dp@xora.org.uk> wrote:
> On 17/11/2010 09:12, Koen Kooi wrote:
>> On 16-11-10 19:20, Khem Raj wrote:
>> > Hello All,
>>
>> > In order to get to the 2010.12 release, I would like to request to
>> > stop pushing any changes to master until release. Please keep your
>> > changes in you local tree ready for when the window
>> > opens again after the release.
>>
>> At OEDEM we agreed that the release would pick a tested branch tag to
>> avoid such a draconic freeze.
>>
> I must say I am puzzled why the freeze when git supports branches. In
> the past we have just picked a point branched then cherry picked
> anything interesting that went into org.openemedded.dev until release date.
>

I guess wrong choice of words, I should have said caution. We can use
branch to solidify release thats ok
given we have enough people testing it out and working on it which I
am a bit doubtful can happen. Thats why
slowing down a bit on commits for a bit, tag the release and keep going.


> Graeme
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


