Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>)
	id 1PDPbV-0007oF-Bj; Tue, 02 Nov 2010 23:45:22 +0100
Received: by ywo32 with SMTP id 32so4731416ywo.6
	for <multiple recipients>; Tue, 02 Nov 2010 15:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type;
	bh=JjT3p9wwadjB7AjnHOAQ+4TRB/gD92984Pl0BHP3wu4=;
	b=GofsWaSzma6RlmjdVKACVfM+98GsqN+gFWf+DSubTDo22hWnjiI5IpnlFPE+GiISTg
	tzwCIW77jVfC+w4uVslt8wZKLqgYXKrRHoLSBOOG5lDqiZsDDPlZ/CS+JzpvpoTEj3se
	KcRFxN1GPiRpBh1UxkEgC0xdRfbiUzuQIxLYY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=DOK0Q2n+lG9HzTlLGQokTsqUt+XwJKpYj+aVK5jDbLDHIqzTT4L0aOt4r7F5Wi1lql
	tFVPj5mI3dltL/mopMP3mxKigwXTAOEifaK/5O70NGbgzQe4hCoQX99Cgp76AwAds9tV
	qoyFNjgM5yc9Vfq/Sw+9X6xj42JxonJ7QFD7E=
Received: by 10.91.27.32 with SMTP id e32mr2124585agj.37.1288737868973; Tue,
	02 Nov 2010 15:44:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.135.18 with HTTP; Tue, 2 Nov 2010 15:44:08 -0700 (PDT)
In-Reply-To: <1288736649.28481.2564.camel@rex>
References: <4CD01D52.5020607@balister.org>
	<1A82C1C5-1657-4642-B4F5-5EFCA799D1DC@dominion.thruhere.net>
	<1288736649.28481.2564.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Nov 2010 15:44:08 -0700
Message-ID: <AANLkTinNvbyAmqZ3A7ARB8EDTza-kVokqJw9M8VNWuFJ@mail.gmail.com>
To: openembedded-members@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: OpenEmbedded and the Yocto Project
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
X-List-Received-Date: Tue, 02 Nov 2010 22:45:22 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 2, 2010 at 3:24 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Tue, 2010-11-02 at 15:42 +0100, Koen Kooi wrote:
>> Op 2 nov 2010, om 15:16 heeft Philip Balister het volgende geschreven:
>>
>> > The Linux Foundation has announced the Yocto Project (based partly
>> > on OpenEmbedded), http://yoctoproject.org/.
>> >
>> > The OpenEmbedded eV board is pleased to see more people using
>> > OpenEmbedded and would like to develop a long term partnership with
>> > the Yocto Project.
>> >
>> > The eV board would like the OpenEmbedded Community to start
>> > discussing the Yocto Project and help develop a long term plan to
>> > advance the goals of both projects. This process should result in a
>> > Voting Proposal that the OpenEmbedded eV can vote on.
>>
>> Before we go vote on stuff, I propose to try to work on relatively
>> small focussed projects together to see how our goal and way of
>> working match the yoctoproject ones. Things like tinderbox upgrades,
>> buildbot integration and BSP splitting come to mind. The minutes Leon
>> sent today reflect that a well.
>
> I'm more than happy to talk about what we're doing with Yocto, why and
> what the differences are between Poky and OpenEmbedded. I covered a lot
> of areas at OEDEM but I appreciate this didn't reach the people who
> weren't there and I would like those people to understand what we're
> doing too.
>
> I'm not sure what the best forum is to have those discussions. I can
> answer emails or we could do something more interactive on IRC or
> similar, I'm open to ideas really...
>

host a webinar may be multiple times

> Cheers,
>
> Richard
>
>
>
>
>
>
> _______________________________________________
> Openembedded-members mailing list
> Openembedded-members@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-members
>


