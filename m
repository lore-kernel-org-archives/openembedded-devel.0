Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1Ix2hC-0007lf-M6
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2007 16:49:58 +0100
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 5E5E228C014; Tue, 27 Nov 2007 16:40:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=5.0 tests=AWL,BAYES_00,RCVD_IN_PBL,
	RCVD_IN_SORBS_DUL,REPTO_OVERQUOTE_THEBAT autolearn=no 
	version=3.1.7-deb
Received: from PROMETHEUS (e180183185.adsl.alicedsl.de [85.180.183.185])
	by srv043.dedi23.de (Postfix) with ESMTP id 5549928C013
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2007 16:40:34 +0100 (CET)
Date: Tue, 27 Nov 2007 16:47:02 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.29) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1801197284.20071127164702@vanille-media.de>
To: Openembedded Developers <openembedded-devel@lists.openembedded.org>
In-Reply-To: <474BFBF6.2000602@whitby.id.au>
References: <474BFBF6.2000602@whitby.id.au>
MIME-Version: 1.0
Subject: Re: RFC: Adding endian support to linux.inc
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
X-List-Received-Date: Tue, 27 Nov 2007 15:49:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Rod Whitby wrote:
> I wish to propose the following patch to linux.inc to enable automatic
> support for setting the endian configuration value for those CPUs that
> can run in both big and little endian modes.

+1. Thanks.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



