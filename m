Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1IIXAM-00054y-PH
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Aug 2007 00:04:39 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 0C13A28C013; Tue,  7 Aug 2007 23:59:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_NJABL_DUL,RCVD_IN_PBL,RCVD_IN_SORBS_DUL,
	REPTO_OVERQUOTE_THEBAT autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180177247.adsl.alicedsl.de [85.180.177.247])
	by srv043.dedi23.de (Postfix) with ESMTP id 61F8F28C012
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Aug 2007 23:59:45 +0200 (CEST)
Date: Wed, 8 Aug 2007 00:02:06 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.3) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1848954397.20070808000206@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1186489672.5653.28.camel@localhost.localdomain>
References: <03d301c7d853$58ec39f0$6e01a8c0@twilight>
	<200708070822.03530.openembedded@hrw.one.pl>
	<1186476730.5653.6.camel@localhost.localdomain>
	<0cf301c7d8d3$4d422cb0$6e01a8c0@twilight>
	<1186489672.5653.28.camel@localhost.localdomain>
MIME-Version: 1.0
Subject: Re: STAGING_LIBDIR_NATIVE needed in bitbake.conf
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
X-List-Received-Date: Tue, 07 Aug 2007 22:04:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

> In fact this raises the question of whether that should be set globally?

+1 for setting it globally. We may encounter more packages like that
and then it makes sense to have the "guideline" right from the start.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



