Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OelZK-0005YZ-OV
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 11:07:55 +0200
Received: by bwz10 with SMTP id 10so666317bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 02:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=LtHf8rUu+dcEHhh2Zh1ei2oamG3vlZjGDgvHOMXp460=;
	b=oFyhVCC6ip4Nf0818Df1wY7Xoij2lVA1TRKw2lGB9QbMvw2hFvi0HNMGiSqdCmMvWS
	muoMyv+vZqM4UxhbhjidgZmLa8ncziel0fs5Tpi1Ukdjm6GR51gREkObXw7pIyr95s/s
	y8Q3P58j4J8Q+1IRdjwJ48agH4VPjgS76a0Gk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Wg36cAC3We6MIg5blHqMsGpyaDes+/VWdcRSR7dAv5U1g8Zi8Rux9PFC9YtrHXecCR
	PCyicZCqKpmanHg0DrNXFpqfY354+K1pNAybkW68RaSa/GOLz2zdoSpHM192MmKlyvNH
	bnH1vN6D0eDC5QkhewrUD2VmD5JymiqS8B108=
MIME-Version: 1.0
Received: by 10.204.46.73 with SMTP id i9mr918126bkf.156.1280480852472; Fri, 
	30 Jul 2010 02:07:32 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Fri, 30 Jul 2010 02:07:32 -0700 (PDT)
In-Reply-To: <4C5293A0.70802@xora.org.uk>
References: <AANLkTimk_y-ntnLZpXfa_biLEcX_vO_Lk5PQXWPJcuec@mail.gmail.com>
	<i2rik7$ds1$1@dough.gmane.org> <4C516EF8.3080804@balister.org>
	<AANLkTikZQB39U7kUv9-0v-3gysX=tYFuwUiq3ygXJzAL@mail.gmail.com>
	<i2u23e$97d$1@dough.gmane.org> <4C528DC6.9060408@xora.org.uk>
	<AANLkTi=TVh2WE6zsN3wYUBBy-sN-zvhCKvHem9J1E1CD@mail.gmail.com>
	<4C5293A0.70802@xora.org.uk>
Date: Fri, 30 Jul 2010 11:07:32 +0200
Message-ID: <AANLkTi=6zRL-+P-2jZzhgZXoMVSY-XdaBCW=JnNqmJom@mail.gmail.com>
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
X-List-Received-Date: Fri, 30 Jul 2010 09:07:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/30 Graeme Gregory <dp@xora.org.uk>

>  On 30/07/10 09:48, Frans Meulenbroeks wrote:
> > 2010/7/30 Graeme Gregory <dp@xora.org.uk>
> >
> >>  On 30/07/10 09:22, Koen Kooi wrote:
> >>> On 30-07-10 09:21, Esben Haabendal wrote:
> >>>> On Thu, Jul 29, 2010 at 2:07 PM, Philip Balister
> >>> <philip@balister.org> wrote:
> >>>>>
> >>>>> On 07/29/2010 05:45 AM, Koen Kooi wrote:
> >>>>>> -----BEGIN PGP SIGNED MESSAGE-----
> >>>>>> Hash: SHA1
> >>>>>>
> >>>>>> On 29-07-10 10:50, Frans Meulenbroeks wrote:
> >>>>>>> Dear all,
> >>>>>>>
> >>>>>>> Given the discussions on quality that sometimes pop up (and also
> >>>>>>> triggered
> >>>>>>> by Robert's message), I decided to kick off a bitbake -k world.
> >>>>>> Could you first explain to me why 'bitbake world' is a good way to
> >>>>>> measure quality?
> >>>>>>
> >>>>>> I would think that building something like console-image and
> >>> looking at
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
> >> bitbake/OE
> >>>>>> to stop people from wasting time on looking at bitbake world and
> have
> >>>>>> them fix actual problems.
> >>>>> bitbake world seems to be the source of pointless listserv
> >>> discussions. Does
> >>>>> it serve any purpose?
> >>>> Pointless or not really depends on how you look at quality.
> >>>> If you look at it as you, Koen and other OE long-timers, yes, it looks
> >>>> rather pointless to have bitbake world.
> >>>> But for those of us who have a different view on what quality is, then
> >>>> bitbake world serves a purpose.
> >>> As Thomas points out, as soon as you start blacklisting things (which
> >>> actually increases quality), bitbake world doesn't work anymore.
> >>> That alone should be enough to kill it.
> >> Time to jump in the cage here.
> >>
> >> "Quality" is achieved by comparing a set of known specifications against
> >> a known data set. In the software case this means we need a good set of
> >> specifications which we are testing against. We also need to know in
> >> detail what we are testing against this set of specifications.
> >>
> >> bitbake world meets neither of these criteria. You have no idea what
> >> your testing against, you also have no idea what you are submitting for
> >> test. A random selection of 8500 files in OE. It also doesn't take into
> >> account known combinations which always fail. Angstrom took care of
> >> these known failures by creating the concept of a blacklist.
> >>
> >> In fact if you tell me bitbake world fails, I would actually suggest
> >> that is a test pass, it is an expected fail.
> >>
> >> Graeme
> >>
> >> Actually I expect it to fail, but I am eager to learn which recipes
> fail.
> > And yes, it might well be that this is not a good test. If you have
> > suggestions for a better test that tests all our recipes feel free to
> speak
> > up.
> >
> > The dependency analysis of bitbake world already showed that there are
> > several issues (as listed above).
> > E.g. there are apparently dependencies on non existing recipes.
> > Instead of shooting the messenger and killing the tool it would be better
> > to  resolve these (by either fixing them as I have seen JaMa did for some
> > recipes in the past) or by removing the recipes.
> > Keeping them around as junk does not improve things.
> >
> > And failure of bitbake -k world is not necessarily bad. At least it will
> > give some insight in the weak spots.
> >
> More interesting to me would be an algorithm more like.
>
> while recipe in recips/*.bb; do
>    rm -rf tmp/ ; bitbake recipe
> done
>
> with the test noting if the fail is due to a blacklisted dependency, a
> totally missing dependency (recipe been deleted sometime in past) or an
> actual compile fail due to a missing DEPENDS entry somewhere in the tree.
>
> But this is going to burn CPU time like never before.
>
> Graeme
>
>
Graeme,

Definitely an interesting test. Actually with packaged staging this might
become manageble.
I would not mind running such a test, even if it takes a week or so.

I guess it is hard to do this for older versions of recipes though.
afaik bitbake -b will not build things one depends on and bitbake recipe
will take either the pinned version or otherwise the last one a non-negative
DEFAULT_PREFERENCE.

Frans.

>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

