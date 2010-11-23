Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <robert@erafx.com>) id 1PKuPM-0003K1-7M
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 16:03:49 +0100
Received: by qwd6 with SMTP id 6so532874qwd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 07:02:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.224.41.8 with SMTP id m8mr5637445qae.161.1290524554732; Tue,
	23 Nov 2010 07:02:34 -0800 (PST)
Received: by 10.220.178.204 with HTTP; Tue, 23 Nov 2010 07:02:34 -0800 (PST)
X-Originating-IP: [24.165.208.114]
In-Reply-To: <AANLkTi=A2j2hR6xtdB+JVe7ktUZcS2gA5QOT_GbH-McL@mail.gmail.com>
References: <AANLkTim3cKQRr0e1VQRiLf=95jOHC5=TGPQfXbDoZCmj@mail.gmail.com>
	<icgjd2$7oa$1@dough.gmane.org>
	<AANLkTi=A2j2hR6xtdB+JVe7ktUZcS2gA5QOT_GbH-McL@mail.gmail.com>
Date: Tue, 23 Nov 2010 10:02:34 -0500
Message-ID: <AANLkTik5MzXj0ndLMxQvE9+MCkq=s8qOc7re1ZaWtGE4@mail.gmail.com>
From: Robert Foerster <robert@erafx.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: robert@erafx.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: BitBake parallel parsing testing
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
X-List-Received-Date: Tue, 23 Nov 2010 15:03:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

Bitbake 1.10: 3m2.185s
parallel-parsing (BB_NUM_PARSE_THREADS=num_cpu): 1m48.232s
parallel-parsing (BB_NUM_PARSE_THREADS=2*num_cpu): 1m1.869s

Parallel-parsing of recipes is excellent.  Well done, Chris.


On Tue, Nov 23, 2010 at 9:38 AM, Chris Larson <clarson@kergoth.com> wrote:

> On Tue, Nov 23, 2010 at 7:34 AM, Koen Kooi <k.kooi@student.utwente.nl>
> wrote:
> >> Thanks for your time, and do let me know what you think, either of the
> >> code, performance in general, or the new progress bar (shows an ETA),
> >> or anything else :)
> >
> > And don't forget to play with BB_NUMBER_PARSE_THREADS, it defaults to
> > the number of CPUs :)
>
> Indeed, thanks, Koen.  Don't know how I forgot to mention that :)
> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

