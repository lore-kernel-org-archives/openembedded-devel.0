Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1IFfJ4-0000EC-68
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jul 2007 02:09:46 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id AD43B28C014; Tue, 31 Jul 2007 02:05:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_NJABL_DUL,RCVD_IN_PBL,RCVD_IN_SORBS_DUL,
	REPTO_OVERQUOTE_THEBAT autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180169072.adsl.alicedsl.de [85.180.169.72])
	by srv043.dedi23.de (Postfix) with ESMTP id E1C0C28C012;
	Tue, 31 Jul 2007 02:05:56 +0200 (CEST)
Date: Tue, 31 Jul 2007 02:07:58 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.3) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1688461606.20070731020758@vanille-media.de>
In-Reply-To: <52752373.20070731020230@vanille-media.de>
References: <1185839805.7719.103.camel@localhost.localdomain>
	<52752373.20070731020230@vanille-media.de>
MIME-Version: 1.0
Cc: openembedded-devel <openembedded-devel@openembedded.org>,
	bitbake-dev <bitbake-dev@lists.berlios.de>,
	=?iso-8859-15?Q?Henryk_Pl=F6tz?= <henryk@openmoko.org>,
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
X-List-Received-Date: Tue, 31 Jul 2007 00:09:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Dr. Michael Lauer wrote:
>> c) how to migrate to these changes in OE.dev

> Who has actually used SRCDATE = now? I know I did.

Ok, upon rereading the challenge seems to change the pinpointed SRCDATEs
in sane-srcdates.inc while making sure that the upgrade path still
works (i.e. lexical comparison), right?

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



