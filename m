Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1Iv0tt-0006zT-9C
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2007 02:30:41 +0100
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 8F39C28C013; Thu, 22 Nov 2007 02:22:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=5.0 tests=AWL,BAYES_00,RCVD_IN_PBL,
	RCVD_IN_SORBS_DUL,REPTO_OVERQUOTE_THEBAT autolearn=no 
	version=3.1.7-deb
Received: from PROMETHEUS (e180128148.adsl.alicedsl.de [85.180.128.148])
	by srv043.dedi23.de (Postfix) with ESMTP id 4BF1428C012;
	Thu, 22 Nov 2007 02:22:02 +0100 (CET)
Date: Thu, 22 Nov 2007 02:28:19 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.29) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <14810200560.20071122022819@vanille-media.de>
To: "Mike (mwester)" <mwester@dls.net>
In-Reply-To: <008f01c82b8a$89c8ab50$6e01a8c0@twilight>
References: <20071119120819.GA17788@lenovo><C7148B94-6A92-42DE-BF35-75B409DAA8E7@selfish.org><4741FB41.7080602@trolltech.com>
	<1195551213.6337.9.camel@localhost.localdomain>
	<008f01c82b8a$89c8ab50$6e01a8c0@twilight>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: The truth about OE team being afraid of 'make' (was: Getting Started -Makefile)
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
X-List-Received-Date: Thu, 22 Nov 2007 01:30:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Mike (mwester) wrote:
> I ask the OE team why are they are philosophically opposed to driving
> bitbake with make?

Ok, seems now's a good time to tell you. Because that's where we came
from back in 2002 -- from a Makefile-centric buildroot called
OpenZaurus that didn't scale at all (which is inherent to the
buildroot approach).

We are so glad that by inventing OpenEmbedded and BitBake we have left
this stoneage of building distributions behind.

Getting back to the 'make' command reminds us of the painful past before we had
OE.

Then again, it could be just a paranoia of me, Chris Larson, and
Holger Schurig ;)

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



