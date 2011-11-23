Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1RTLkv-0004wD-Pw
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Nov 2011 23:57:30 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 3F7B13156088
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2011 23:42:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id rV9cQyfWI0n4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2011 23:42:43 +0100 (CET)
Received: from [172.22.22.61] (drms-4d0150b5.pool.mediaWays.net [77.1.80.181])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id AD96B3156083
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2011 23:42:43 +0100 (CET)
Message-ID: <4ECD76E2.3040001@opendreambox.org>
Date: Wed, 23 Nov 2011 23:42:42 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20111031 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<CAMKF1sr6mM0_iYu_1vfEGbUYNqaj2hK2vpdsHqCTkoSdrHyJOA@mail.gmail.com>
	<CACW_hTYcHF6RXuW3prEO2cR+UYCFFvdtoH1d6DetY-6pCmT6qA@mail.gmail.com>
	<CAMKF1srRnHd4C7XsEdZ80HcKuc7ioLC_+2J4NO3=bChoCw2k-Q@mail.gmail.com>
In-Reply-To: <CAMKF1srRnHd4C7XsEdZ80HcKuc7ioLC_+2J4NO3=bChoCw2k-Q@mail.gmail.com>
Subject: Re: Plans for OE classic future
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
X-List-Received-Date: Wed, 23 Nov 2011 22:57:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 23.11.2011 23:25, Khem Raj wrote:
> On Wed, Nov 23, 2011 at 1:18 PM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> 2011/11/23 Khem Raj <raj.khem@gmail.com>
>>
>>> On Thu, Oct 27, 2011 at 3:53 AM, Mats K=C3=A4rrman <Mats.Karrman@trit=
ech.se>
>>> wrote:
>>>> Hi,
>>>>
>>>> Are there any plans for new releases and/or maintenance branches of =
OE
>>> classic?
>>>>
>>>
>>> 2011.03-maintenance is the last release of OE classic. As long as the
>>> branch is maintained
>>>
>>> _
>>>
>>> Related: I noticed TSC plans to discuss on whether or not to make oe
>> classic read only.
>>
>> I'd like to suggest leaving it open for those of us that are still usi=
ng
>> it.
>=20
> 2011.03-maintenance branch is maintained and that would be place to go.
>=20
>=20
>> For instance I have still products that are based on OE classic. If th=
ere
>> is a problem that is of a generic nature, I'm more than happy to submi=
t
>> patches so others in the same situation can benefit from it.
>> (actually I have one pending with a new version of netsnmp; the curren=
t
>> recipe does not build with uclibc, whereas the latest version of netsn=
mp
>> does; found/fixed this today, but haven't had time to make a commit)
>>
>> And if there is no interest any more it'll eventually die. But as of n=
ow I
>> do see people working on/with it (see the commit log).
>=20
> those fixes are intended for 2011.03-maintenance which go into master a=
nd then
> get cherry-picked

So master needs to stay open in order to get patches there first before
being cherry-picked into 2011.03-maintenance, right?

I also don't like the idea to make it read-only. Those who already
switched to oe-core are free to just ignore the classic master branch.
Others should still be able to push bugfixes etc, if they care enough
about it.

Regards,
Andreas


