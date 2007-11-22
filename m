Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1Iv0y8-000713-4z
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2007 02:35:04 +0100
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id BD98B28C015; Thu, 22 Nov 2007 02:26:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=5.0 tests=AWL,BAYES_00,RCVD_IN_PBL,
	RCVD_IN_SORBS_DUL,REPTO_OVERQUOTE_THEBAT autolearn=no 
	version=3.1.7-deb
Received: from PROMETHEUS (e180128148.adsl.alicedsl.de [85.180.128.148])
	by srv043.dedi23.de (Postfix) with ESMTP id B844D28C013;
	Thu, 22 Nov 2007 02:26:24 +0100 (CET)
Date: Thu, 22 Nov 2007 02:32:42 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.29) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <318150198.20071122023242@vanille-media.de>
To: Lorn Potter <lpotter@trolltech.com>
In-Reply-To: <474369E5.1020207@trolltech.com>
References: <20071119120819.GA17788@lenovo><C7148B94-6A92-42DE-BF35-75B409DAA8E7@selfish.org><4741FB41.7080602@trolltech.com>
	<1195551213.6337.9.camel@localhost.localdomain>
	<008f01c82b8a$89c8ab50$6e01a8c0@twilight>
	<474369E5.1020207@trolltech.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Getting Started -Makefile
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
X-List-Received-Date: Thu, 22 Nov 2007 01:35:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Lorn Potter wrote:
> Mike (mwester) wrote:
>> I ask the OE team why are they are philosophically opposed to driving
>> bitbake with make?  

> Perhaps because oe's predecessor - buildroot, used make. Someone deemed
> make not good enough to build filesystems, and they decided to try 
> something new.

> Have I go that right?

Bingo! The candidate gets 100 free runs of the bitbake command. See my
other mail for details ;)

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



