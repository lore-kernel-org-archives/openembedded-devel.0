Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1IHZ3m-0001tM-1A
	for openembedded-devel@openembedded.org; Sun, 05 Aug 2007 07:53:50 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id BD95028C013; Sun,  5 Aug 2007 07:49:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_NJABL_DUL,RCVD_IN_PBL,RCVD_IN_SORBS_DUL,
	REPTO_OVERQUOTE_THEBAT autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180134222.adsl.alicedsl.de [85.180.134.222])
	by srv043.dedi23.de (Postfix) with ESMTP id 0DA4D28C012
	for <openembedded-devel@openembedded.org>;
	Sun,  5 Aug 2007 07:49:18 +0200 (CEST)
Date: Sun, 5 Aug 2007 07:51:31 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.3) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1111189595.20070805075131@vanille-media.de>
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
In-Reply-To: <46B488C3.4080306@dominion.kabel.utwente.nl>
References: <E1IH6Wi-0002Ri-S3@linuxtogo.org>
	<623121068.20070804154926@vanille-media.de>
	<46B488C3.4080306@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Subject: Re: [oe-commits] org.oe.dev psplash: make openmoko psplash openmoko specific, not machine specific
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
X-List-Received-Date: Sun, 05 Aug 2007 05:53:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1

> Dr. Michael Lauer schreef:
>> koen commit wrote:
>>> psplash: make openmoko psplash openmoko specific, not machine specific
>> 
>> mmh   I did it on purpose that way. Didn't you read my comment in the
>> changelog?

> Yes: "psplash: add OpenMoko branding".

Sorry, I meant the comment in the actual bbfile, which was:

# fic-gta01 for now, until we have an openmoko override

> Could you explain why you want *every* distro and *every* target image using psplash on
> that device having a 'openmoko' splash?

Like written in the bbfile, it was a temporary solution. If we don't
accept org.openembedded.dev as a place where we can experiment with
things, then we might as well start an unstable branch
(org.openembedded.realdev?)

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



