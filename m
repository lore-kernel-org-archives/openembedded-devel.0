Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NqDzU-0006iu-Cv
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Mar 2010 00:10:01 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NqDwZ-0001uN-Bq from Tom_Rini@mentor.com ;
	Fri, 12 Mar 2010 15:06:59 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 12 Mar 2010 15:06:58 -0800
Received: from 172.30.80.6 ([172.30.80.6]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Fri, 12 Mar 2010 23:06:55 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	12 Mar 2010 16:06:50 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1268429946-12810-1-git-send-email-ulf.samuelsson@atmel.com>
References: <1268429946-12810-1-git-send-email-ulf.samuelsson@atmel.com>
Organization: Mentor Graphics Corporation
Date: Fri, 12 Mar 2010 16:06:50 -0700
Message-ID: <1268435210.17250.15.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 12 Mar 2010 23:06:59.0180 (UTC)
	FILETIME=[B7D7A2C0:01CAC238]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: Re: [PATCH] fbv-1.0: Build fbv with support for jpeg and bmp
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Mar 2010 23:10:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2010-03-12 at 22:39 +0100, Ulf Samuelsson wrote:
> fbv today only supports png files.
> This patch will ensure fbv also support jpeg and bmp formats

Please bump the PR in one go and don't stop installing the man pages
(they end up in the -doc package).  Also, you shouldn't need to modify
PACKAGES at all.

Finally, hiccup or dejvu?  Thanks!

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


