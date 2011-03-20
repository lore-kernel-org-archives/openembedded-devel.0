Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Q1PtD-0004ys-I4
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Mar 2011 22:10:19 +0100
Received: by iyb26 with SMTP id 26so5944685iyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Mar 2011 14:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=TJOkRTCFCxnpEn7KveBZTRCcoHTgeIUfzIiXRDvnUws=;
	b=nbt/hfvpzWTZEMAJhmpTUKGuiVRc5j5OFhIUk74df/wqXxVrm3pKPHpxJaE6cSyI+R
	daN9MiKm1H/yQwlTyZfWa5nfrN18tDYVcHnA8iD7aU+1iAFvQic6ACz40Sg3ru2mJ86t
	A6s2vgmomWsBuyXBvzCiweNqLGSzUqeLTR9io=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=VAdsMbQ8Xpe4AH18ZYKa/5Awr44iSi835mugXgNtRIzQo3c3bZqkkxUcs1kbbsajvd
	bsA81a+MT6Tfb2KY/UHJWSgm3SuZlBNyJETT6xoER6iS/emnOKX2ZN8wEPvdJd5IDRs9
	Mqd7XW1Bfg+R5ewjbrKU7wukIbFPMjjin279I=
MIME-Version: 1.0
Received: by 10.42.153.3 with SMTP id k3mr5430118icw.457.1300655310828; Sun,
	20 Mar 2011 14:08:30 -0700 (PDT)
Received: by 10.231.13.69 with HTTP; Sun, 20 Mar 2011 14:08:30 -0700 (PDT)
In-Reply-To: <4D8644E1.4040808@gmail.com>
References: <20110311081950.GG7353@excalibur.local>
	<1300385432.2298.33.camel@saphir> <1300396447.30423.2113.camel@rex>
	<AANLkTi=9DUeh3eyaW=fQciA_Qk51yvqbBP_792n8fwQD@mail.gmail.com>
	<1300443329.9054.53.camel@phil-desktop>
	<1300496638.30423.2249.camel@rex>
	<AANLkTi=s9L+Q8k9ds3BiSZj7MC1BOe8=1jWoObi2qu02@mail.gmail.com>
	<4D8644E1.4040808@gmail.com>
Date: Sun, 20 Mar 2011 22:08:30 +0100
Message-ID: <AANLkTineDL=wJ=DiPHLVVjT5=Wzo2A=tDo-Nh7f2E8cx@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
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
X-List-Received-Date: Sun, 20 Mar 2011 21:10:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/3/20 Khem Raj <raj.khem@gmail.com>:
> On 3/19/2011 1:28 AM, Frans Meulenbroeks wrote:
[...]
>>
>> Well, I do feel it is one of them, and that is the maintainer of the
>> package (who might be the original author).
>>
>> To me being the maintainer of a recipe says that one cares about a
>> recipe and tries to maintain it (as the word says :-) )
>> Maintainership comes with responsibilities. If people do not want to
>> take these responsibilities then they should not list themselves as
>> maintainer.
>> I have seen too many incidents where someone does not care about a
>> package or bugs submitted to it, but if someone else steps in and
>> fixes things, then suddenly the original author or maintainer feels
>> they are stepped onto their toes, and react hostile.
>
> Its always good to get reviews from people who have prior experience even if
> it comes in ways you don't like since in the end it makes the software
> better. A little attitude adjustment is however needed sometimes :)

May I nominate that last sentence for understatement of the year?
>
>>
>> Btw this is the main reason I stopped trying to fix bugs that do not
>> affect me (apart from the recipes I maintain).
>
> Thats pretty selfish view of world I must say in a community of volunteers
> :)

Sorry but the smiley escapes me.

If you feel it is selfish, that is your opinion.

I prefer to call it self-protection.
I have no interest any more to get rude comments. It brought too much
frustration and irritation.
And as my work apparently not appreciated, I decided to cut back on my
effort, also because I dio not have a home project any more that uses
OE.

Bash a volunteer often enough and at some point he'll not be
volunteering any more.
What OE really needs is a more positive atmosphere towards each other.

Frans.

PS: another reason to wind down my effort is the yocto migration I see
going on.
I have no interest to become an unpaid resource for Intel and the
other LF member companies.


