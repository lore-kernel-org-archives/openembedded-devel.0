Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1IFfDm-0008U6-Gf
	for openembedded-devel@openembedded.org; Tue, 31 Jul 2007 02:04:18 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id E231B28C013; Tue, 31 Jul 2007 02:00:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_NJABL_DUL,RCVD_IN_PBL,RCVD_IN_SORBS_DUL,
	REPTO_OVERQUOTE_THEBAT autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180169072.adsl.alicedsl.de [85.180.169.72])
	by srv043.dedi23.de (Postfix) with ESMTP id 20DF028C012;
	Tue, 31 Jul 2007 02:00:29 +0200 (CEST)
Date: Tue, 31 Jul 2007 02:02:30 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.3) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <52752373.20070731020230@vanille-media.de>
To: Richard Purdie <rpurdie@rpsys.net>
In-Reply-To: <1185839805.7719.103.camel@localhost.localdomain>
References: <1185839805.7719.103.camel@localhost.localdomain>
MIME-Version: 1.0
Cc: openembedded-devel <openembedded-devel@openembedded.org>,
	=?iso-8859-15?Q?Henryk_Pl=F6tz?= <henryk@openmoko.org>,
	bitbake-dev <bitbake-dev@lists.berlios.de>,
	openembedded-devel@lists.openembedded.org
Subject: Re: The future of "svnnow"
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
X-List-Received-Date: Tue, 31 Jul 2007 00:04:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Awesome work -- I'm impressed!

This is yet another example of how good the BitBake core architecture
is.

> Comments and discussion are very welcome. At the very least we need to
> agree:

> a) this is the right approach

+1 from me.

> b) how much of the outstanding task list we need to complete before 1.8.8

1,2,4

> c) how to migrate to these changes in OE.dev

Who has actually used SRCDATE = now? I know I did.

> and due to the invasive nature of some of the changes, testing, testing,
> testing!

Sure thing.

Thanks a lot Richard!

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



