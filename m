Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mickey@vanille-media.de>) id 1IzMN0-0001MX-WD
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2007 02:14:43 +0100
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id F34D928C013; Tue,  4 Dec 2007 02:04:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=5.0 tests=AWL,BAYES_00,RCVD_IN_PBL,
	RCVD_IN_SORBS_DUL,REPTO_OVERQUOTE_THEBAT autolearn=no 
	version=3.1.7-deb
Received: from PROMETHEUS (e180131053.adsl.alicedsl.de [85.180.131.53])
	by srv043.dedi23.de (Postfix) with ESMTP id 166E228C012;
	Tue,  4 Dec 2007 02:04:26 +0100 (CET)
Date: Tue, 4 Dec 2007 02:11:10 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.29) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <443804680.20071204021110@vanille-media.de>
To: Richard Purdie <rpurdie@rpsys.net>
In-Reply-To: <1196552859.6697.28.camel@localhost.localdomain>
References: <1196552859.6697.28.camel@localhost.localdomain>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Packaged Staging, nearly a reality!
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
X-List-Received-Date: Tue, 04 Dec 2007 01:14:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> As anyone watching the commits will notice, OE just gained the next
> generation of packaged staging support!

Excellent!

> To use simply INHERIT = "packaged-staging2". Staging packages end up in
> tmp/deploy/pstage.

Even without inherit'ing this, everything python-distutils breaks. Is
this expected?

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



