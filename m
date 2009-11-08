Received: from [209.85.217.227] (helo=mail-gx0-f227.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N790U-0002Nr-56
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Nov 2009 15:44:45 +0100
Received: by gxk27 with SMTP id 27so1020855gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Nov 2009 06:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=m8l92KwfFrrBgkQ3WhjSDZX7tgsoFKt4/jdvOfn1qwE=;
	b=jla08ptQfTIrB2l4FyqZAK0bUcktX4RsVHWtn3tI+wQkMm5s+stugNwQuPWTUtGstl
	XMSSztKV0kQODnlSmx2hJtF8tu7pEe5sh1M+66Fl1jgzvdVOyWVD9V2oVP9gwo2YoMze
	2nRyuLI8AgwikIcJ67lcwzUcrXuZKpBYyqXJA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=mYBUVpBJqFJTXprx47FnmcflyOBMuWrbxfmYD6xsMKJH7IDMyKlKooMoN1kNaJ18qc
	SRZVvkBSZOOAAjM2yyAQki47xH8HuRPCZ2vrP97N5x2Bs9fgoey5SNYyjjjJ50CQTPad
	Wy0nwmzQFFbIYIg8Wzwxgle9EkTwkGPNty4kc=
MIME-Version: 1.0
Received: by 10.101.141.9 with SMTP id t9mr5700390ann.188.1257691406063; Sun, 
	08 Nov 2009 06:43:26 -0800 (PST)
In-Reply-To: <hd6k2l$7lv$1@ger.gmane.org>
References: <ac9c93b10911061238p366f65edqeff04b25c872015f@mail.gmail.com>
	<hd4qpq$ee0$1@ger.gmane.org> <1257682982.26962.14.camel@opal>
	<hd6ggj$tf3$1@ger.gmane.org>
	<ac9c93b10911080608y6db44dache5b521eb64fafe2d@mail.gmail.com>
	<hd6k2l$7lv$1@ger.gmane.org>
Date: Sun, 8 Nov 2009 15:43:26 +0100
Message-ID: <ac9c93b10911080643s1ac602a9t3ecc0283da45f6b4@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.227
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: what to do with wrong checksum
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
X-List-Received-Date: Sun, 08 Nov 2009 14:44:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

2009/11/8 Koen Kooi <k.kooi@student.utwente.nl>:
> On 08-11-09 15:08, Frans Meulenbroeks wrote:
>>
>> Without making a comment on the commit message:
>>
>> As stated before the 3.33 version is clearly mentioned as "latest
>> development version" on http://xmltwig.com/xmltwig/
>> The last stable version is 3.32
>> This project decided to provide snapshots (or whatever you want to
>> call it) of the new version. In this case 3.33. Their choice.
>
> 3.33 is a version. A version is a point, not a distance. If it's a snapshot
> than you should call is twig-snapshot, twig-3.33rc1 or whatever.
> Replacing a versioned tarball weekly is *bad*, since you (as upstream
> maintainer) don't know what the "3.33" is your users are complaining about.
> And note that *nowhere* on that page it is stated that the development
> version keeps getting updated. And for that matter it also doesn't say 3.32
> is any better.

Note that I am only relaying what the dev told me and that it by no
means reflect my personal opinion.

And indeed they do not mention that the unstable version can change,
nor that the stable won't change.
It might be that cpan has some rules for not updating stable versions
so it might be that pulling from cpan is better. I don't know cpan and
its way of working well enough to make a statement about that.

--- My personal $ 0.02:
If I want to reuse something from the web, I'm happy that I can get
it, as it saves me work.
If it is not fully the way I want it, I try to convince or educate
them to do things differently.
If they won't, either I have to live with it or avoid that specific
piece of software.
Making snide remarks in a public area only creates irritation and
frustration and does not help./
--- End of my $ 0.02 (and someday I'll learn how to insert a euro
symbol in my emails :-) )

Frans.


