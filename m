Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Nmmuj-0003K7-Lh
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 12:38:57 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o23Ba2Od016975
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 3 Mar 2010 11:36:02 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16581-07 for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Mar 2010 11:35:50 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o23BZo8m016969
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 3 Mar 2010 11:35:50 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Wed, 03 Mar 2010 11:35:49 +0000
Message-ID: <1267616149.2259.4.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: TSC Meeting 2010/03/02
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
X-List-Received-Date: Wed, 03 Mar 2010 11:38:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

TSC Meeting 2010/03/02

We moved the time to Tuesday since I couldn't make Thursday.
Unfortunately Mickey couldn't make Tuesday due to a last minute meeting
but four of us met anyway to discuss various issues. The outcome of
various topics was:

Code of Conduct
===============

We agreed we need one but also that its outside the remit of what the
TSC should be discussing. We don't feel something heavy and draconian
with every action spelt out is a sensible idea but we should have some
guidelines behaviour can be judged against. In this respect we could do
a lot worse than adopt the Ubuntu CoC
(http://www.ubuntu.com/community/conduct).

We'd like to propose to the e.V. board and members that the Ubuntu CoC
should be adopted (wording adjusted to suit OE) by the OE e.V.

The one problem here is that we don't have a community council. The TSC
could serve as this but we'd prefer to split this work to a dedicated
group. We'd like to ask the members to discuss this and see what people
feel is the best thing to do.

Elections
=========

We agreed to hold TSC elections in April which means calling for
candidates soon. We'd like to see active people wanting to move OE
forward and would love to see come competition for the TSC places. Now
we've established the format and input required hopefully more people
will feel comfortable coming forward. For more information about what
the role involves please talk to any existing TSC member.

Angstrom
========

People do seem to use Angstrom as a target for certain discussions. The
people involved have got on and made a success of a distribution and
people should respect that. There are some customisations which could be
more generic so other people would be more comfortable using them. These
should be discussed and the Angstrom devs are amenable to that but
breaking Angstrom for the benefit of others isn't really fair.

Splitting Angstrom into its own directories (e.g. for images) is going a
full circle as Angstrom did have that and was coerced into merging
things. No solution will please everyone but before the TSC can get
involved, discussions need to happen with clear proposals. Angstrom is
not perfect but it has gone out there and achieved things which is worth
keeping in mind.

Developer Effort
================

Rather than discussions such as the above, how about injecting that
energy into adopting the new staging, BBCLASSEXTEND and -nativesdk code?

BBLayers
========

Mentioned briefly, no concerned we raised above those expressed already.
Having coherent layer handling is desirable and the bitbake team will
continue its work accordingly.

Other Business
==============

Apologies have been made to the TSC for my absence at the last meeting.
There was some confusion on my part over the protocols and I didn't 
think the meeting was happening.


Regards,

Your TSC

Graeme Gregory (XorA)
Koen Kooi
Chris Larson (kergoth)
Michael 'Mickey' Lauer (mickeyl)
Richard Purdie (RP)




