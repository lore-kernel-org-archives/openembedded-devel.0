Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1ILHMf-0002Zo-IX
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Aug 2007 13:48:41 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 4FBB028C013; Wed, 15 Aug 2007 13:45:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_NJABL_DUL,RCVD_IN_PBL,RCVD_IN_SORBS_DUL,
	REPTO_OVERQUOTE_THEBAT autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180191029.adsl.alicedsl.de [85.180.191.29])
	by srv043.dedi23.de (Postfix) with ESMTP id 913EC28C012;
	Wed, 15 Aug 2007 13:45:40 +0200 (CEST)
Date: Wed, 15 Aug 2007 13:48:17 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.3) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1468519352.20070815134817@vanille-media.de>
To: Vamsi <pvamsikris@gmail.com>
In-Reply-To: <8852460a0708150423j3c6a949bue5b17b379b43e78c@mail.gmail.com>
References: <8852460a0708150423j3c6a949bue5b17b379b43e78c@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: BitBake Compilation errors
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
X-List-Received-Date: Wed, 15 Aug 2007 11:48:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Vamsi wrote:
>  I could resolve the issue with a different version of bitbake. I was
> getting this issue with the bitbake 1.8.2 when i moved on to the
> latest one it disappeared.

I'm sorry, but downgrading to 1.8.2 is not an advisable mid-term
solution, since you will miss important features -- I'd rather suggest
following Richard's advice and upgrading your python-sqlite2 package.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



