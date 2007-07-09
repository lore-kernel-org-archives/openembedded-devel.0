Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1I7zVq-0006Z0-U1
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jul 2007 22:07:14 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 5982628C013; Mon,  9 Jul 2007 22:00:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: **
X-Spam-Status: No, score=3.0 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_NJABL_DUL,RCVD_IN_PBL,REPTO_OVERQUOTE_THEBAT autolearn=no 
	version=3.1.7-deb
Received: from PROMETHEUS (e180163073.adsl.alicedsl.de [85.180.163.73])
	by srv043.dedi23.de (Postfix) with ESMTP id CFC0028C012;
	Mon,  9 Jul 2007 22:00:21 +0200 (CEST)
Date: Mon, 9 Jul 2007 22:01:36 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.3) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <849361116.20070709220136@vanille-media.de>
To: Richard Purdie <rpurdie@rpsys.net>
In-Reply-To: <1183996538.5757.55.camel@localhost.localdomain>
References: <513012886.20070708041151@gmail.com> <f6q30v$s2$1@sea.gmane.org>
	<128309124.20070709154303@gmail.com>
	<1183996538.5757.55.camel@localhost.localdomain>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] Adding screen dimensions to machine configs
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
X-List-Received-Date: Mon, 09 Jul 2007 20:07:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

To summarize:

It looks like we can agree to adding information to the
MACHINE_DISPLAY_ namespace.

However, we're undecided regarding the semantics. Some of think the
physical hardware information need to be there, some of us want the
logical (including kernel-level gfx hardware rotation), some of us
want a high-level meaning.

How do we proceed now? Collect more arguments in favour or against or
shall we vote? Who is having a voice?

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



