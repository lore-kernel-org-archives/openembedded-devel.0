Return-Path: <asselsm@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5B02F6011F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Nov 2015 14:35:56 +0000 (UTC)
Received: by wmec201 with SMTP id c201so101187734wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Nov 2015 06:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=gBPmYNMirAUqKuZ5X+C46OSQYHy3KN1IJtlH1kHYDto=;
	b=n8Kw4DisYppBCJorOYStLLUwmdgODwjeTgawH4+bqhSQn1aC7I/H8QGWDu9yx82LUs
	I5H6NZiwzZuVlgK6hdGr1bJExCMDP82+y9luWhFP6rTwPSAMfB/CgXnpxd4nXx6T3nbL
	Ftx/WBWOeGjY2edWoluIBb1inqw8MZbvTpmxlnXReHrBy0GLXGxJNmzjslLIAPzE/GDg
	atBGYoro1f9UUfkbn2Sk/j59Dg30hfb110CXdGbJF0wyUiq81oH+2Pzl+JiGZeiSxRMr
	bv9+z/w/LxDUv/YaloLFihvig68l67EXVokCnJCN1fSHHkghVuStnNT0HLy9bluqr7mW
	u14w==
MIME-Version: 1.0
X-Received: by 10.28.30.14 with SMTP id e14mr16494566wme.83.1448721357085;
	Sat, 28 Nov 2015 06:35:57 -0800 (PST)
Reply-To: mark.asselstine@windriver.com
Sender: asselsm@gmail.com
Received: by 10.194.59.176 with HTTP; Sat, 28 Nov 2015 06:35:57 -0800 (PST)
In-Reply-To: <20151125081151.GB10430@ad.chargestorm.se>
References: <1448298827-9195-1-git-send-email-mark.asselstine@windriver.com>
	<CANx9H-CvQgaxGKO11JOT=cZJiSLh7_1tz-Dh-xS=TOO9FvZBfQ@mail.gmail.com>
	<20151125081151.GB10430@ad.chargestorm.se>
Date: Sat, 28 Nov 2015 09:35:57 -0500
X-Google-Sender-Auth: qzkfhpw1Nsq3hXrvZYomDpiZzZg
Message-ID: <CAPuovEK6bunjwoeNZmZPeXRQ2CV6XbtAovU=puhPSamOU1R=Uw@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH] python-cryptography, python-cryptography-vectors: uprev
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 28 Nov 2015 14:35:57 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 25, 2015 at 3:11 AM, Anders Darander <anders@chargestorm.se> wrote:
> * Tim Orling <ticotimo@gmail.com> [151124 19:00]:
>
>> We have never carried a license in meta-python, rather we use the
>> common-licenses from oe-core (
>> http://git.openembedded.org/openembedded-core/tree/meta/files/common-licenses
>> ).
>
> Does the Unicode license exist under another name in oe-core? Otherwise,
> I'd assume that Mark did the right thing to add it here.

I will look around to see that it is not duplication. I will also try
to assess the number of projects out there that might eventually be
added to oe that would warrant us putting this in 'common-licenses'
off the bat.

Mark

>
> Cheers,
> Anders
>
>> Regards,
>
>> --Tim
>
>> On Mon, Nov 23, 2015 at 9:13 AM, Mark Asselstine <
>> mark.asselstine@windriver.com> wrote:
>
> --
> Anders Darander, Senior System Architect
> ChargeStorm AB / eStorm AB
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

