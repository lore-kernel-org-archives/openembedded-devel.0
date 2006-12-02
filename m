Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mickey@vanille-media.de>) id 1GqbHf-0005BB-HF
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Dec 2006 21:16:27 +0100
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id CA0EB28C022; Sat,  2 Dec 2006 21:13:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.1.7 (2006-10-05) on srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=RCVD_IN_NJABL_DUL,
	RCVD_IN_SORBS_DUL autolearn=no version=3.1.7
Received: from PROMETHEUS (e180154036.adsl.alicedsl.de [85.180.154.36])
	by srv043.dedi23.de (Postfix) with ESMTP id 5397E28C021;
	Sat,  2 Dec 2006 21:13:12 +0100 (CET)
Date: Sat, 2 Dec 2006 21:15:47 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.85.03) UNREG / CD5BF9353B3B7091
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <27383573.20061202211547@vanille-media.de>
To: "Alan Carvalho de Assis" <acassis@gmail.com>
In-Reply-To: <37367b3a0612021013p700b017bmdaa382eb76527c8e@mail.gmail.com>
References: <37367b3a0612021013p700b017bmdaa382eb76527c8e@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org, Vladimir <vovan888@gmail.com>
Subject: Re: New palm environment
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
X-List-Received-Date: Sat, 02 Dec 2006 20:16:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Alan Carvalho de Assis wrote:
> Dear developers,
> I want know if is of worth start a new project to develop a palm/phone
> environment using FLTK toolkit.

No :) (but see below)

> GPE and Opie are powerful projects, but some devices with small
> footprint and slow processors don't work very well with it.

I agree. GPE and Opie have both a lot of problems, but considering their
history, both projects went a long and winding way to get there.
By starting something new you may start up with a clean and small
core, but eventually you will find that to suit the requirements you
have to add more and more stuff. At the end of the day you may be
reinventing GPE or Opie, which doesn't sound like a good task.

> Some possible toolkit are: FLTK2, pixil or minigui. We think FLTK is a
> good option, because it has some modern features and still small and
> fast.
> I want know what you think about it?

I don't think the UI toolkit is the reason that GPE and Opie are
sluggish. I think both contain a lot of code from people whose
contributions were the first after they started programming for
embedded systems.

If you really want to start something new, go ahead and do it. It's a
fantastic learning experience! But please, do yourself a favour and
wait a bit more until the OpenMoko folks and the Access folks go live
with their platforms -- perhaps there is something where you could
jump on the bandwagon.

Of course, jumping on the bandwagon is not that honorable as being the
inventor of something, but at the end of the day, it may help to get
things actually done, and that's what all want, don't we? :)

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



