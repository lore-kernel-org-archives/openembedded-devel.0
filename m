Received: from [66.249.92.172] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JFX1v-0000Pj-Hg
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jan 2008 16:51:47 +0100
Received: by ug-out-1314.google.com with SMTP id i24so374043ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2008 07:51:47 -0800 (PST)
Received: by 10.67.20.11 with SMTP id x11mr3512398ugi.29.1200585106832;
	Thu, 17 Jan 2008 07:51:46 -0800 (PST)
Received: from ?89.252.38.142? ( [89.252.38.142])
	by mx.google.com with ESMTPS id 34sm2947655ugh.40.2008.01.17.07.51.44
	(version=SSLv3 cipher=OTHER); Thu, 17 Jan 2008 07:51:45 -0800 (PST)
Date: Thu, 17 Jan 2008 17:59:30 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <11488336.20080117175930@gmail.com>
To: "Mike (mwester)" <mwester@dls.net>
In-Reply-To: <00d201c8591b$02e350e0$6f01a8c0@mwester.net>
References: <E1JF7vM-0000k1-Mc@linuxtogo.org>
	<413710907.20080117131841@gmail.com>
	<478F4876.9030405@student.utwente.nl><1012527691.20080117145250@gmail.com>
	<fmnp24$rob$1@ger.gmane.org>
	<00d201c8591b$02e350e0$6f01a8c0@mwester.net>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev apm: turn off wifi cards before suspend so they are fully reloaded upon resume. closes 3664.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Jan 2008 15:51:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Mike,

Thursday, January 17, 2008, 5:09:52 PM, you wrote:

[]

> Actually, this is important to me as well.  I've deliberately distanced
> myself from these discussions on the mailing lists, but I've also withheld a
> number of commits for *EXACTLY* the reasons pointed out by Rolf.

> My last commit was the famous 2.6.23 ixp4xx kernel recipe - I'm quite 
> certain everyone remembers that.  It too turned into what I've been seeing
> lately on this list (and on the angstrom list).  Mickey's comment on this
> thread is the sort of helpful, constructive criticism that will result in
> people becoming better OE developers.  The comments by some others, however,
> are the sort of comments that just result in me maintaining my own personal
> set of changes to OE -- it's just easier on my blood-pressure to deal with
> my own private overlay than to endure the guantlet of hyper-critical, 
> condescending, superiority-laden emails that have characterized some of the
> past responses to my (and other's) commits.

> I doubt that my contributions are of particular interest to the general
> population, but I hardly suspect that I'm alone in this -- which makes it
> rather probable that OE is missing some other, really valuable, 
> contributions from those who have just "walked away" because they fear their
> bitbake recipes do not meet the level of god-like perfection demanded by a
> certain small-but-very-vocal group of developers.

> C'mon folks -- teach me.  Don't beat me.

  IMHO, the problem here is not how to make it more comfortable for
individual developers to contribute to OE - that's big question in
itself, but answers to it are mostly bound to general properties of
OpenSource projects (the bigger they become, the steeper participation
curve, unfortunately ;-( ).

  IMHO, the talk is about how to be on the same direction, and even
steering, where OE goes. There're many meta-level changes are being
done to OE, and it's hard for everyone to be current with all of them.
Yet even more important meta-changes cannot be done literally for
years (packages staging for example), because of lack participation
and inertness of developers.

  With all that in mind, IMHO, it's not too productive to keep silent
instead of participating in communication, and actual meta-work. And
per well-known rules of nature, law of compensation comes into play -
if someone keeps silent, someone has to be more vocal; if someone
thinks and finds that it's easiser to do less that otherwise would
be possible, someone else thinks and finds that more has to be done.



> JMO.  That and 10 USD will get you a cup of coffee.

> Mike (mwester)


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



