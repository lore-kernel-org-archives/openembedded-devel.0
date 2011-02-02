Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PkYUx-0003s4-E8
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Feb 2011 09:55:35 +0100
Received: by iwn8 with SMTP id 8so7634685iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Feb 2011 00:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=Png0IgAak0c0o6R/NLk7+6+um425qFFWIITFlcU8CtY=;
	b=vPdUvn/PAD8cflI7UZVUfMCN6X+48BofwaqyOFq9bAowfhW0n3iSF5Ok/NkqnO8FAy
	TSFzBDY2L06g9NP5jM7dLBfz2MhIQyBsg4YrdlUnad7V+8PwsP+Lee+L/YsY4ctg9z3p
	b/P+i6udrhyqrO0qFbPDDJiaQJk1ItknVHUjA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=YLoIl7fIGls9SiTof5cye0FxwbJ5mc24Cujz2UNenRzQYi9EfAcCfdOKa7aGs5+rcE
	qLNJKyeKq6K6GNxeY8oOPyFEOWj4MYNxs7dt+QiG5p0zDr3WmXd/bzB61s2EoxSriE5f
	ZNUb7iHVk2hf0uhBsLcE+6OHJffq6gU5kT0so=
MIME-Version: 1.0
Received: by 10.231.207.66 with SMTP id fx2mr9600724ibb.108.1296636879515;
	Wed, 02 Feb 2011 00:54:39 -0800 (PST)
Received: by 10.231.36.68 with HTTP; Wed, 2 Feb 2011 00:54:39 -0800 (PST)
In-Reply-To: <1296601177.13501.21530.camel@rex>
References: <1296483034.13501.13046.camel@rex> <ii96l0$tm$1@dough.gmane.org>
	<4D48258D.7050302@mentor.com>
	<AANLkTikaogwbHhYiG3rGJ2z17SAyEO3zYCMpsujU2tmf@mail.gmail.com>
	<AANLkTinmEV8NVzz0fxP+sK+Ji6bUO2E-sV9noOcxsdwM@mail.gmail.com>
	<4D484FED.10603@balister.org>
	<AANLkTi=KqA0bXAbuu8VDJz14L9DiHguRLNYWth1R6wMY@mail.gmail.com>
	<4D487BA0.5080101@opensimpad.org>
	<1296601177.13501.21530.camel@rex>
Date: Wed, 2 Feb 2011 09:54:39 +0100
Message-ID: <AANLkTi=T8Aq51yb7Hv2eEzKHDPS1xQc2SsNCnQeKGxMF@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Wed, 02 Feb 2011 08:55:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/2/1 Richard Purdie <rpurdie@rpsys.net>:
> On Tue, 2011-02-01 at 22:31 +0100, Bernhard Guillon wrote:
>> On 01.02.2011 21:08, Frans Meulenbroeks wrote:
>> > ... a team that
>> > is chosen by the community is much more empowered to make decisions.
>> >
>> +1
>>
>> In my opinion it is very important in the current situation to have a vote.
>
> Just please keep in mind what this looks like to the outside world.
>
> So far various amounts of bad timing, unfortunate circumstances and the
> rules have meant that 2-4 months on we could appear to be going around
> in circles and unlikely to make a "real" decision soon (at least six
> weeks for a vote).
>
> Yocto talks to people commercially and 3-5 months to make some decisions
> (not implement, just make the decisions) would be commercial suicide to
> a business.
>
> I accept this takes as long as it takes and I'm not going to even
> attempt to rush anything but OE isn't doing its perception much good to
> be brutally honest.
>
> On the plus side I know there are positive moves afoot too so its not
> all doom and gloom but its worth keeping the above in mind.
>
> Cheers,
>
> Richard
>
Richard, I agree with you.
I feel we could have made more progress, but things take the time they need.

I am not against an interim TSC, but I would like to see some openness
of the board on how they feel they should move forward. Guess it'll be
after FOSDEM though (if I interpreted Graeme's message properly).
I can imagine we do not want to waste another 6 weeks or so on voting
for a new TSC, but I think it is desirable that the way forward is
clear for and backed by the community.

Best regards, Frans.


