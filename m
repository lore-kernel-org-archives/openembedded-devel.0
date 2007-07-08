Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1I7SOK-0003T5-Dc
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Jul 2007 10:45:16 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id C828E28C013; Sun,  8 Jul 2007 10:38:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ****
X-Spam-Status: No, score=4.3 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_NJABL_DUL,RCVD_IN_PBL,RCVD_IN_SORBS_DUL,
	REPTO_OVERQUOTE_THEBAT autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180146103.adsl.alicedsl.de [85.180.146.103])
	by srv043.dedi23.de (Postfix) with ESMTP id 2BD0828C012
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Jul 2007 10:38:35 +0200 (CEST)
Date: Sun, 8 Jul 2007 10:39:45 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.3) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1415629734.20070708103945@vanille-media.de>
To: Koen Kooi <openembedded-devel@lists.openembedded.org>
In-Reply-To: <f6q30v$s2$1@sea.gmane.org>
References: <513012886.20070708041151@gmail.com> <f6q30v$s2$1@sea.gmane.org>
MIME-Version: 1.0
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
X-List-Received-Date: Sun, 08 Jul 2007 08:45:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

>>    Now with formfactor around, I guess it would be nice to use
>> consistent variable names for the same info. Marcin still suggested to
>> use MACHINE_ prefix for build-time (i.e. machine config) variables.
>> So, the exact topic of this RFC is adding
>> 
>> MACHINE_DISPLAY_WIDTH_PIXELS=
>> MACHINE_DISPLAY_HEIGHT_PIXELS=
>> 
>> to machine configs.

+1 from me for that.

> We can add those without adding formfactor. But what will those setting be for e.g. an
> nslu2 or efika board?

0 -- what else? :D

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



