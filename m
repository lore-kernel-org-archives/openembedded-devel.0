Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>)
	id 1PkMXM-0002fL-37; Tue, 01 Feb 2011 21:09:16 +0100
Received: by iyj18 with SMTP id 18so6583085iyj.6
	for <multiple recipients>; Tue, 01 Feb 2011 12:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=IW8qixJ8+Nn7YYeMeJ975EqQS7NwAvJPHVTmApm2fwA=;
	b=AKbbXZrp2ua/WLppoPhMJLNk9rgYdCK2oSf3wBs7IJhRQekQPltCXZW8HSEypmSNMu
	fCgDYOzsH7waBxuD2z1D/tevWYOXYxKK5fzrfeZLxERgEmPPXpLgfudzSPjK6v8KMy7t
	wxdH52AL10yumlu1Z9+K1nq0/ggjEhGdTcJwc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=GMORBpr6tCEhGweuUYYqovumPqW+4s6IlsdVUvEvkmK11O/LXndfLIReLqwyHqxvxv
	51Vqa1R4278ffQ3wOs+DxSVdKCT4A+WG23rFYxaHVXdUPJR7rzc4oEJjDrgDJppH45R0
	e6X4Jje2QMzvtJWU0p3fjRClPjVpj0lIzeiDE=
MIME-Version: 1.0
Received: by 10.231.166.205 with SMTP id n13mr8849407iby.58.1296590900331;
	Tue, 01 Feb 2011 12:08:20 -0800 (PST)
Received: by 10.231.36.68 with HTTP; Tue, 1 Feb 2011 12:08:20 -0800 (PST)
In-Reply-To: <4D484FED.10603@balister.org>
References: <1296483034.13501.13046.camel@rex> <ii96l0$tm$1@dough.gmane.org>
	<4D48258D.7050302@mentor.com>
	<AANLkTikaogwbHhYiG3rGJ2z17SAyEO3zYCMpsujU2tmf@mail.gmail.com>
	<AANLkTinmEV8NVzz0fxP+sK+Ji6bUO2E-sV9noOcxsdwM@mail.gmail.com>
	<4D484FED.10603@balister.org>
Date: Tue, 1 Feb 2011 21:08:20 +0100
Message-ID: <AANLkTi=KqA0bXAbuu8VDJz14L9DiHguRLNYWth1R6wMY@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	openembedded-members@lists.openembedded.org, board@openembedded.org
Subject: Re: OE TSC
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
X-List-Received-Date: Tue, 01 Feb 2011 20:09:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/2/1 Philip Balister <philip@balister.org>:
> On 02/01/2011 11:43 AM, Frans Meulenbroeks wrote:
>>
>> I think the call for candidates should be on the members list, and the
>> voting also should be done by the members.
>
> Frans, we need to get an interim TSC in place to help with the Yocto
> integration work. It will also give the membership a chance to see them in
> action before we have to vote on them.
>
> I would like some feedback from the members about how long a TSC term should
> be and if we should stagger the positions. We can use this feedback to
> determine when to replace the appointed TSC with an elected one.
>
> My personal thoughts are have the initial appointment be long enough to get
> the Yocto/OE integration in good shape.
>
> Philip

Philip, is this your personal view or are your representing the board in this?

In the start post Richard wrote:
"The TSC is not self electing so we're going to hand this issue over to
the board at this point to determine the way forward."

I have not seen any communication from the board on this (but of
course there is always the chance I missed it, most days oe+poky+yocto
email seem to be > 100 mails), unless your mail is on behalf of the
board.

I feel the board has a responsibility on stating the procedure that
will be followed on this.
I see people putting themselves forward as candidates, but I have not
even seen a call for candidates, or a period during which people can
candidate themselves, or any indication on how they will be selected.

And while I agree that we need a team to work on the oe <-> yocto
cooperation (or maybe collaboration is a better word), but a team that
is chosen by the community is much more empowered to make decisions.

Wrt the TSC term: from the oedem 2010 minutes:
"- January 7th 2010 TSC meeting minutes mentions the yearly TSC re-election."
It might e a good idea move to a longer term and staggered election.
(e.g. half of the TSC stepping down in a year). I feel we can have
this discussion also at a later time.

Best regards, Frans.


