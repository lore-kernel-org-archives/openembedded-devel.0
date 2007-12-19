Received: from [83.151.25.170] (helo=vanille-media.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mickey@vanille-media.de>) id 1J4yg3-0005Fd-S0
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Dec 2007 14:09:35 +0100
Received: by vanille-media.de (Postfix, from userid 65534)
	id 2D8FB28C013; Wed, 19 Dec 2007 13:57:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: **
X-Spam-Status: No, score=2.6 required=5.0 tests=AWL,BAYES_00,RCVD_IN_PBL,
	RCVD_IN_SORBS_DUL,REPTO_OVERQUOTE_THEBAT autolearn=no 
	version=3.1.7-deb
Received: from PROMETHEUS (e180157080.adsl.alicedsl.de [85.180.157.80])
	by vanille-media.de (Postfix) with ESMTP id 6D50228C012;
	Wed, 19 Dec 2007 13:57:15 +0100 (CET)
Date: Wed, 19 Dec 2007 14:04:33 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.29) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1163024816.20071219140433@vanille-media.de>
To: Paul Sokolovsky <pmiscml@gmail.com>
In-Reply-To: <1187652493.20071219133208@gmail.com>
References: <1187652493.20071219133208@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] BogoFeeds reloaded
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
X-List-Received-Date: Wed, 19 Dec 2007 13:09:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Paul Sokolovsky wrote:
> So, you set FEED_LOCAL_BASE_URI to the root of deploy dir as exported
> by Apache, and - voila - you get nice collection of per-arch local feeds in
> the image.

Excellent. A nice, non-invasive, utterly practical solution.

I like it.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



