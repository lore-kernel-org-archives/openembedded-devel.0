Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OelTq-0005cV-Iy
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 11:02:15 +0200
Received: by bwz10 with SMTP id 10so663784bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 02:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=I/AumU7Kz9psPvgpx6uXXdNsAF+/vXSLx8OMECR//XY=;
	b=qAEAKsX+jiEInWIB1r5adliS2M8GTzp+Gijbsnx4yEWFb9DRg5ZrVXuhz+V5v9GT2k
	ArxHIvY+wAVosWQlSxC8HVbmqcr0gmPTDZ3zekHeuIAQEiLhyFYpPFvLpEYC23JpSH/O
	Hhii9icyVMQqzGzMxqU6uXahPOjxYEFe2HYkI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=jrFjk2vLXms/Wrt5Z0thcblwkUO4PAsqq45w3dowxV7iiTPI/fA2jbg3m8hLYC0whH
	wOf9mm1b1/7M726H9G3BKPP01u4OpMh3eu8u9SaKCvJZ74njF4P4z9gD4NDpLcK6UX1E
	z7mbFCj/FkSG6NNSqtTBDsJT5uVBYuFHdEQDw=
MIME-Version: 1.0
Received: by 10.204.79.221 with SMTP id q29mr990832bkk.49.1280480516531; Fri, 
	30 Jul 2010 02:01:56 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Fri, 30 Jul 2010 02:01:56 -0700 (PDT)
In-Reply-To: <i2u36t$cl1$1@dough.gmane.org>
References: <AANLkTimk_y-ntnLZpXfa_biLEcX_vO_Lk5PQXWPJcuec@mail.gmail.com>
	<i2rik7$ds1$1@dough.gmane.org> <4C516EF8.3080804@balister.org>
	<AANLkTikZQB39U7kUv9-0v-3gysX=tYFuwUiq3ygXJzAL@mail.gmail.com>
	<i2u23e$97d$1@dough.gmane.org>
	<AANLkTimUYuJBUa5Hz=N_dM-DOe6qPoCDbqCEs2LHTpab@mail.gmail.com>
	<i2u36t$cl1$1@dough.gmane.org>
Date: Fri, 30 Jul 2010 11:01:56 +0200
Message-ID: <AANLkTinOtQF5wr_V6nnQeTveDoFX37kZoQ8yjLCXoE61@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: OE recipe tree quality
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
X-List-Received-Date: Fri, 30 Jul 2010 09:02:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/30 Koen Kooi <k.kooi@student.utwente.nl>

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 30-07-10 10:34, Frans Meulenbroeks wrote:
> > 2010/7/30 Koen Kooi <k.kooi@student.utwente.nl>
> >
> > On 30-07-10 09:21, Esben Haabendal wrote:
> >>>> On Thu, Jul 29, 2010 at 2:07 PM, Philip Balister <philip@balister.org
> >
> > wrote:
> >>>>>
> >>>>>
> >>>>> On 07/29/2010 05:45 AM, Koen Kooi wrote:
> >>>>>>
> >>>>>> -----BEGIN PGP SIGNED MESSAGE-----
> >>>>>> Hash: SHA1
> >>>>>>
> >>>>>> On 29-07-10 10:50, Frans Meulenbroeks wrote:
> >>>>>>>
> >>>>>>> Dear all,
> >>>>>>>
> >>>>>>> Given the discussions on quality that sometimes pop up (and also
> >>>>>>> triggered
> >>>>>>> by Robert's message), I decided to kick off a bitbake -k world.
> >>>>>>
> >>>>>> Could you first explain to me why 'bitbake world' is a good way to
> >>>>>> measure quality?
> >>>>>>
> >>>>>> I would think that building something like console-image and looking
> at
> >>>>>> the following would be a much better metric:
> >>>>>>
> >>>>>> * does it build?
> >>>>>> * are all the rootfs types working?
> >>>>>> * does the image do what it is supposed to do?
> >>>>>> * Are all the licenses of the output packages correct?
> >>>>>> * Do the output packages have any spurious deps?
> >>>>>> * Is the content of the output packages correct?
> >>>>>> * Are there any known CVEs in the resulting packages?
> >>>>>> * Did packaged-staging do its job?
> >>>>>> * What kind of QA errors and warnings were raised?
> >>>>>> * Did all recipes pass recipe_sanity?
> >>>>>> * Did all recipes conform to oe-stylize.py?
> >>>>>>
> >>>>>> etc
> >>>>>>
> >>>>>> I would actually advocate removing the 'world' feature from
> bitbake/OE
> >>>>>> to stop people from wasting time on looking at bitbake world and
> have
> >>>>>> them fix actual problems.
> >>>>>
> >>>>> bitbake world seems to be the source of pointless listserv
> discussions.
> > Does
> >>>>> it serve any purpose?
> >>>>
> >>>> Pointless or not really depends on how you look at quality.
> >>>>
> >>>> If you look at it as you, Koen and other OE long-timers, yes, it looks
> >>>> rather pointless to have bitbake world.
> >>>> But for those of us who have a different view on what quality is, then
> >>>> bitbake world serves a purpose.
> >
> > As Thomas points out, as soon as you start blacklisting things (which
> > actually increases quality), bitbake world doesn't work anymore.
> >
> >
> >> Blacklisting does *NOT* increase quality. It just hides the problem and
> as
> >> such it is ostrich behaviour.
>
> You're saying that making a choice to only support bluez4 and disallow
> linking to random bluez versions does not increase quality? The bluez
>

It increases the quality of the distro, not the overall quality of OE.


> people are quite clear on this, pick a version and stick with it.
>

You're hitting the nail on head with this. One of the problems of OE is that
we want to support too many versions at the same time.
dev head should not have two versions of bluez in the first place.
The development process should be that there are stable releases that are
used for production work and an unstable release or dev head that can be
used for further developments.
What is happening now is that people are abusing dev head and aim to use it
as production version which IMHO is bad.
dev head should aim at moving forward. E.g. latest stable could use bluez3
and dev head could then move to bluez4.

So please explain to me why following upstream advice and making things
> deterministic doesn't increase quality?
> You seem to be implying that the bluez developers are a bunch of
> ostriches for keeping the API compatible, no?
>

No, not at all. I know it is desirable to keep APIs compatible, and I also
know that sometimes there are reasons to break compatibility (and as an
inbetween there is upwards compatibility).
And for the record: I did not make any statement on bluez or its developers.

The problem is entirely at our side, by deciding to maintain multiple
variants of a package in dev head.

BTW and blacklisting is only a side observation on why things fail.
It would still be good to fix the dependency issues (and actually I would
but most of them seem to be in the maemo/openmoko/e17 area, an area where I
have neither expertise in nor hardware to test things).

Frans

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMUpAcMkyGM64RGpERAjsTAJ4mtLOVTbW/j/YvrAUfMgJbFmKPDQCfTz9b
> D9h1U+Cqg3L9yC3CheQSYr8=
> =Nj6f
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

