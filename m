Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q1Ttg-0001al-DN
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Mar 2011 02:27:07 +0100
Received: by fxm19 with SMTP id 19so5036575fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Mar 2011 18:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=BwNE5jCyyTM3R+GWMRiqO3Dqns5iywfsJOT+A74/5s0=;
	b=oAZK1KaqHpH8h6HsmHyTWsJZZY9OBppcyPPXF/beFyGNYjwyFtZhhLnGzS/5WGbdph
	FmTexms5W+xDQEyfo7sIXLlR07FKw6HWx+U8u1Mk9Pjp2uDZE/3VBxHtC/YFnqiXgoF7
	30C91/x9RgrdTF9S4qkMi7rst8sNX0bI7fzbY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=mryl2wmHeSpiDZbebCBIhlL3g+GNZYT8bIneBByeATq9nKFgEje0PSi7aA9JLriAU3
	vtkadBr3YGZM223QSICOGjyrPZvO/1orkPu1n1oUdAXShxwlRasCrZ3fTKVqfFszvqLN
	ij5WjGk+wcpzB56rqLFUvmyc4c4+ixisrbo5I=
Received: by 10.223.15.141 with SMTP id k13mr4295543faa.30.1300670713209; Sun,
	20 Mar 2011 18:25:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.109.12 with HTTP; Sun, 20 Mar 2011 18:24:43 -0700 (PDT)
In-Reply-To: <AANLkTineDL=wJ=DiPHLVVjT5=Wzo2A=tDo-Nh7f2E8cx@mail.gmail.com>
References: <20110311081950.GG7353@excalibur.local>
	<1300385432.2298.33.camel@saphir> <1300396447.30423.2113.camel@rex>
	<AANLkTi=9DUeh3eyaW=fQciA_Qk51yvqbBP_792n8fwQD@mail.gmail.com>
	<1300443329.9054.53.camel@phil-desktop>
	<1300496638.30423.2249.camel@rex>
	<AANLkTi=s9L+Q8k9ds3BiSZj7MC1BOe8=1jWoObi2qu02@mail.gmail.com>
	<4D8644E1.4040808@gmail.com>
	<AANLkTineDL=wJ=DiPHLVVjT5=Wzo2A=tDo-Nh7f2E8cx@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 Mar 2011 18:24:43 -0700
Message-ID: <AANLkTimm+TuKG8UafkxzuNLqyW+V+WgOH083q_PRMdF+@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OE Bugzilla Future
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
X-List-Received-Date: Mon, 21 Mar 2011 01:27:07 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Mar 20, 2011 at 2:08 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2011/3/20 Khem Raj <raj.khem@gmail.com>:
>> On 3/19/2011 1:28 AM, Frans Meulenbroeks wrote:
> [...]
>>>
>>> Well, I do feel it is one of them, and that is the maintainer of the
>>> package (who might be the original author).
>>>
>>> To me being the maintainer of a recipe says that one cares about a
>>> recipe and tries to maintain it (as the word says :-) )
>>> Maintainership comes with responsibilities. If people do not want to
>>> take these responsibilities then they should not list themselves as
>>> maintainer.
>>> I have seen too many incidents where someone does not care about a
>>> package or bugs submitted to it, but if someone else steps in and
>>> fixes things, then suddenly the original author or maintainer feels
>>> they are stepped onto their toes, and react hostile.
>>
>> Its always good to get reviews from people who have prior experience even if
>> it comes in ways you don't like since in the end it makes the software
>> better. A little attitude adjustment is however needed sometimes :).

It was from personal experiences, I do that myself time to time and
move on. I thought I would share

>
> May I nominate that last sentence for understatement of the year?


>>
>>>
>>> Btw this is the main reason I stopped trying to fix bugs that do not
>>> affect me (apart from the recipes I maintain).
>>
>> Thats pretty selfish view of world I must say in a community of volunteers
>> :)
>
> Sorry but the smiley escapes me.
>
> If you feel it is selfish, that is your opinion.
>
> I prefer to call it self-protection.
> I have no interest any more to get rude comments. It brought too much
> frustration and irritation.
> And as my work apparently not appreciated, I decided to cut back on my
> effort, also because I dio not have a home project any more that uses
> OE.
>
> Bash a volunteer often enough and at some point he'll not be
> volunteering any more.



> What OE really needs is a more positive atmosphere towards each other.
>

It is very positive if you ask me everyone I interact with is always
encouraging and helpful to contribute in best of spirits


> Frans.
>
> PS: another reason to wind down my effort is the yocto migration I see
> going on.
> I have no interest to become an unpaid resource for Intel and the
> other LF member companies.
>

Yes its your time and only you should decide where you want to spend it best.


I would not respond further to this matter. This thread is on
bugzilla's future and its future so I will leave it to refocus on
topic.

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


