Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>)
	id 1IW0Z0-0004Hp-Uv; Fri, 14 Sep 2007 04:05:46 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 4D4AF28C014; Fri, 14 Sep 2007 03:58:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_NJABL_DUL,RCVD_IN_PBL,RCVD_IN_SORBS_DUL,
	REPTO_OVERQUOTE_THEBAT autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180145041.adsl.alicedsl.de [85.180.145.41])
	by srv043.dedi23.de (Postfix) with ESMTP id 20F0028C012;
	Fri, 14 Sep 2007 03:58:43 +0200 (CEST)
Date: Fri, 14 Sep 2007 04:02:25 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.3) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <522721688.20070914040225@vanille-media.de>
To: Philip Balister <philip@balister.org>
In-Reply-To: <46E9D4BA.3080708@balister.org>
References: <8e53a5920709112139s1b54c4cdsdb27b0df1995399e@mail.gmail.com>
	<7215-66668@sneakemail.com> <8742-19702@sneakemail.com>
	<164986939.20070914021814@vanille-media.de>
	<46E9D4BA.3080708@balister.org>
MIME-Version: 1.0
Cc: Using OE <openembedded-users@lists.openembedded.org>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [oe-users] ERROR: function do_stage failed
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
X-List-Received-Date: Fri, 14 Sep 2007 02:05:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

cc'ing openembedded-devel, since we raise a significant issue here.

Philip Balister wrote:
> Can we remove the generic distro? I do not think anyone uses its it, and
> it just creates distractions for people.

I wouldn't like that and I'll tell you why. I added this distribution
configuration to have a conservative minimal distribution
configuration as a starting point for people to roll their own
distribution.

Now you probably would answer "they should just include Angstrom". As
much as I love the Angstrom initiative [heck, i co-founded it!], I
don't want it become the only viable option in OpenEmbedded. I want to
see us retaining a clear border where the packaging and machine configuration
metadata in OE ends and where the distribution starts.

The more Angstrom-specific hacks I see in OpenEmbedded, the more it
scares me, because this means once someone wants a lean-and-mean way
to compile a distro, he will run into lots of obstacles which --
in my opinion -- should rather be solved in a distribution-independent way.

I agree that the generic distro suffered from bitrot, but for the said
reasons I'd rather like it to be revived than to be removed.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



