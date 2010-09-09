Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1Otl8B-00045k-Ve
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 19:41:52 +0200
Received: by eyb7 with SMTP id 7so1125987eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Sep 2010 10:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=HbY3BM7+t+o/j0ldMjVcbkE+GvWtbXBbzPVhUfWd9xo=;
	b=LlGPR2df54urcRtvpxCTH2Iuh/m0rv61cDQBB/YHEZdzJCmwS/NEAdzcNgcNlDe82C
	GzwXx/0odbvmNR/mBflXR3j8Qkz574ThS+pXn7kN+z26ovSNFiWzFtRDdiwwYULp6orL
	1hA2Cwp7Jg8flPL7zcZIvTTEnRIqVTkYzFqUA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=s44ebgkXAFunco9Xm7w7B5pV5tmS3DBltJjhrT1fNrn8PN6U9M9IZFAzjwFw6EPmcL
	MrAMVDfEDuQks6rCPW9oV9TQvASSslIE29xlvRbikyVCjx3CBhgs6jiAc9XU72mAr/dK
	XLUkvnahZAx0wzC4kucO7a0OzFCqvIGIfujSw=
MIME-Version: 1.0
Received: by 10.216.168.202 with SMTP id k52mr2086237wel.105.1284054071175;
	Thu, 09 Sep 2010 10:41:11 -0700 (PDT)
Received: by 10.216.58.197 with HTTP; Thu, 9 Sep 2010 10:41:11 -0700 (PDT)
In-Reply-To: <4C8678B7.8010002@mentor.com>
References: <AANLkTinU39HjKWb9=VMiSa=R2YA_9BxPDctiW1ire48C@mail.gmail.com>
	<AANLkTikk1sce-dOHW_uVOO3m+XPx1ZjapvcNAAHiXwnS@mail.gmail.com>
	<AANLkTikkJod_2MTGN4B+8Q4wS74v9Z=nEBqrucUrcYjv@mail.gmail.com>
	<AANLkTikZuBMiU2H8m3M97xFwcQE2GCdQ_2Q=TSM4b23-@mail.gmail.com>
	<AANLkTi=eX15FWkO+Fux8UpNv9tXkTVtkYrd=t3c_==2k@mail.gmail.com>
	<4C86593A.7000006@mentor.com>
	<AANLkTi=AL6HCYtK7CuCwzeTo7WW2QvfT8p9s8R73gVsO@mail.gmail.com>
	<4C8678B7.8010002@mentor.com>
Date: Thu, 9 Sep 2010 10:41:11 -0700
Message-ID: <AANLkTintciCwf80MCvJ15JvcJRWNmdB8a9u+u=2kyXu-@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Perl modules I can not get to build, libdbd-sqlite-perl libversion-perl
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
X-List-Received-Date: Thu, 09 Sep 2010 17:41:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 7, 2010 at 10:39 AM, Tom Rini <tom_rini@mentor.com> wrote:
> J. L. wrote:
>>
>> On Tue, Sep 7, 2010 at 8:24 AM, Tom Rini <tom_rini@mentor.com> wrote:
>>>
>>> Graham Gower wrote:
>>>>
>>>> On 3 September 2010 09:13, J. L. <vwyodapink@gmail.com> wrote:
>>>
>>> [snip]
>>>>>
>>>>> and the other is honestly above me at the moment as I do not grasp
>>>>> using devshell yet and how to work with in there, let alone properly
>>>>> lay out a program recipe and then patch it to work properly. Once I
>>>>> grasp things more I hope to be a help and not such a hindrance, I
>>>>> welcome any tips links or anything to point to how to fix either and =
I
>>>>> will try more on more with those pointers and if successful post the
>>>>> results and maybe a patch or post the failure.
>>>>
>>>> Read the OE manual. Read the Bitbake manual. Read .bb files. Read
>>>> .conf files. Read .bbclass files. Read Bitbake sources. Send patches.
>>>> Add time. Repeat. =3D=3D expert!
>>>
>>> I'd just like to add in that while it's great (really, I mean it), you'=
re
>>> reporting problems, if you can reproduce them in vanilla OE with
>>> something
>>> like MACHINE=3Dqemuarm and DISTRO=3Dangstrom-2008.1 (or DISTRO=3Dminima=
l) or
>>> similar, that will help rule out a lot of concern on our part and give =
a
>>> testcase we can all easily try out.
>>
>> OK thanks Tom I will try and read more on how to do that. Have not
>> done anything with qemu yet. But what I get now and correct if I am
>> wrong by OE vanilla you mean fresh directly off the dev branch no
>> other sub tree correct? then modify my .conf to to the settings you
>> listed above? If I am way off dont worry about taking the time to
>
> Correct.
>
>> explain in detail I will just read about it. I feel I have become an
>> annoyance on the boards from my lacking knowledge. Would showing the
>> recipe I build for my gumstix help? Its now building but not with
>> everything I want and some programs are broken, but its very close the
>> closest I have gotten so far. Any who thanks for replying and giving
>> me more info on how to help you guys help me. I do appreciate
>> everyones help and input a bunch.
>
> We're happy to have a problem report, really. =A0It's just that since yes=
,
> you're working with more than just the vanilla tree we want to be certain
> that the problem is in the vanilla tree and not a conflict in having
> additional overlays and such available.
>
> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Just got done building my image with the vanilla tree as you requested
and I still have basically the same results, the only major difference
is now my gnome image gives a password I have no clue of to root but
my enlightenment image built and worked the same from the overo tree
as the vanilla dev OE tree as well as still failing in the same
manners. The gnome image was the only one that added another issue to
my build. Hope that may help, is there any more I can do to help?
Should I try like once a week building on the overo tree and vanilla
tree and post the differences if any or? Thanks for your time and
pointers

JL


