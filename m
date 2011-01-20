Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PfuOB-0002dQ-Nf
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Jan 2011 14:18:03 +0100
Received: by iwn8 with SMTP id 8so628665iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jan 2011 05:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=uK3yzIRyH1OypwquKv6AT8UXS1Jv1SC3hoGpIkkzCg8=;
	b=e4r3w3YlsbdSyFaKczN6LEnaKtu5bB/Ryw4Bn6KLC9TDX+T6c39DO30UasmN5IE+OD
	X8gJnaTQ3lg1d/MJZKD1xWvN4uyTA/xyzCfJF621hPVz9coaUlEGxk5rWEzSvtbfflZL
	TD8RIfGsC0gn5RkHU5guUbZD1YgLBNGV2nMt8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Pkgz6uJZ8JOWG0Ob5sg8PE825VSTnyN8GmKV++LMXzoVpYnIUMHaMurUjHgkjn6TyC
	i7ChFYzjv7E+IA/H9cQreq2MvngkgmNjXQIveaftcW0s6QwCiqXWzp3a6ifJfkKKNV42
	nqnec4ouqcFJbGxPOnZS+AeHRdr8StW0s1wSc=
MIME-Version: 1.0
Received: by 10.231.39.74 with SMTP id f10mr2508752ibe.84.1295529402665; Thu,
	20 Jan 2011 05:16:42 -0800 (PST)
Received: by 10.231.213.234 with HTTP; Thu, 20 Jan 2011 05:16:42 -0800 (PST)
In-Reply-To: <4D3816BC.1010605@xora.org.uk>
References: <1295027350.14388.6527.camel@rex>
	<AANLkTi=QXykmerKTJJgCNDbqSE18_3Jhqj1utKmf1Ynw@mail.gmail.com>
	<4D353F81.50301@xora.org.uk>
	<AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>
	<4D35C5C3.60205@mentor.com> <ih4s84$gbj$1@dough.gmane.org>
	<4D35FC8B.1090404@mentor.com>
	<AANLkTinHP=9S6tAFdiWHfk8zZi0MhvfNTgW71Ugx++9w@mail.gmail.com>
	<AANLkTi=aMnnfnaQZNLpZW_8MUWq_jckou9tr_bA8NBY6@mail.gmail.com>
	<4D36A64E.9060804@xora.org.uk>
	<AANLkTi=8uKvujKLqG2cw3h3gLmmcU=KNfdmSwB5imfsH@mail.gmail.com>
	<1295436662.2540.14.camel@scimitar>
	<AANLkTik9-k_euvDGZd+CFfQ9LyxD_7mubpVxPqyEsEVU@mail.gmail.com>
	<4D36FE98.3070606@mwester.net>
	<AANLkTimMHd-eH9tEL1tUtoUKa+zwX4+9kUdT3k_NP9nG@mail.gmail.com>
	<AANLkTimyPb-4pLrbF4ZeFwnh+9WyZtcPY1uXeYBnwUqQ@mail.gmail.com>
	<AANLkTinRKmmzUT-6T6_cGR+HHrB6hYFYhdS4GuZHRS+Z@mail.gmail.com>
	<AANLkTin8mbWMymQyNeuf8dtEy6McUJQYTKfhuUgR3Mf8@mail.gmail.com>
	<4D3816BC.1010605@xora.org.uk>
Date: Thu, 20 Jan 2011 14:16:42 +0100
Message-ID: <AANLkTikJML8fawT9pBNH69V==E-4zDtMaTtsxPGQj07d@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Yocto Project and OE - Where now?
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
X-List-Received-Date: Thu, 20 Jan 2011 13:18:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/1/20 Graeme Gregory <dp@xora.org.uk>:
> On 20/01/2011 10:20, Frans Meulenbroeks wrote:
>>
>> And as said before, as a package maintainer I try to follow upstream
>> and support what upstream supports.
>> I do not want to take over the role of upstream wrt the package maintenance.
>> As a package maintainer I feel it as my task to make sure the version
>> from upstream builds in the OE environment, and ideally patches are
>> only there to deal with cross build issues, although every once in a
>> while a local bugfix is added.
>> That is how I see the role of a package maintainer, but others might
>> see things differently.
>> (btw for toolchain related things I can imagine we want to retain
>> older versions for a longer time, especially when there are functional
>> changes (I'm especially thinking about autohell))
>> And apologies if I sketch the things black and white, but at least
>> that makes things clear.
>> But also when it becomes to package maintainers tasks there is a gray area.
>>
> But this is part of the issue, this sort of working is fine for packages
> you maintain, but you try and force your opinions on which packages are
> relevant to other package maintainers. Go forth and do what you want
> with your own little area but at least give some consideration that I
> might actually be maintaining the recipes you class as junk.

Ehm, no. I don't want to enforce things onto others, and if you feel
you want to maintain 5 versions be my guest (assuming you maintain
them well)
And it is not up to me to give a classification of the work of others.
Then again I do not like it if people force maintenance work onto me
by pinning a version that I as a package maintainer feel should be
expired (for good reasons).

The real issues at hand are:
- we have quite a lot of recipes that were added at some point in time
but that are not maintained, apart from maybe sometimes getting a
small bug fix from someone actually passing by or caused by a global
change (e.g. adding md5sum's)
- maintainership of recipes is often unclear, so if there is an issue
it is unclear who to contact. To give an example: openssl: the last 15
commits in recipes/openssl are done by 10 different people.
MAINTAINERS does not list a maintainer for openssl. (and yeah, I know
I can send to the ML or contact the last committer)
- some maintainers don't do a very good job in maintaining, especially
when it comes to expiring old stuff, leaving a recipe that is not
fetchable, does not patch or does not build (sometimes because an .inc
file was modified and the patch works on the latest version, but older
versions are build let alone tested). I seem to recall a list from
Martin with some 1000 recipes on it that did not fetch or patch.
(actually not sure about the number). Updating also seems to be
lacking. Some action was taken then, but if I recall correctly this
was never completed.I

To get back at how well things are maintained, let us as an example
look at openssl again.

I've expired a number of versions that had known security
vulnerabilities last august. This gave a lot of flak as I accidently
deleted a version that was pinned (openssl_0.9.8m.bb). One of the
things observed at that time was that this version had CVE's and that
newer versions were available (9n and 9o). Currently (almost half a
year later) openssl is at 0.9.8q but OE is still at 0.9.8m.
I would have expected a maintainer would have taken action (and yes in
case of CVE's, I would suggest that the old versions with the security
issues are retired).
And I know way too well that we all are busy and have limited time,
but I would have hoped that someone would have taken action. And no,
it is not going to be me, I took enough heat on openssl last summer
and decided not to touch the recipe with a pole, but I would have
appreciated it that the people who gave me a hard time then at least
would have brought the recipe to 9o.
I explicitly mentioned .9o on aug 16.

Quote:
seems a good plan to upgrade to 0.9.8o though as it fixes some
security vulnerabilities

But that did not lead to action and at that point it seemed better for
me not to touch openssl at all (although I feel a security
vulnerability in something like openssl is quite serious).

And this is something that starts to irritate me in OE. apparently
there is always time to shoot the messenger who comes with suggestions
on how to improve, and to bash at people that at least try to resolve
some issues but the silence is deafening when it comes to actually
doing things.

And apologies if I sound a little bit sour.

Frans.


