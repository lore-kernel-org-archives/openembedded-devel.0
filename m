Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mickey@vanille-media.de>) id 1HBemv-0007lj-J4
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Jan 2007 23:15:45 +0100
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id CA11628C012; Mon, 29 Jan 2007 23:11:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.1.7 (2006-10-05) on srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=RCVD_IN_NJABL_DUL,
	RCVD_IN_SORBS_DUL autolearn=no version=3.1.7
Received: from [192.168.2.128] (e180135091.adsl.alicedsl.de [85.180.135.91])
	by srv043.dedi23.de (Postfix) with ESMTP id 0449228C011;
	Mon, 29 Jan 2007 23:10:56 +0100 (CET)
Date: Mon, 29 Jan 2007 23:13:39 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.95.6) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <142423136.20070129231339@vanille-media.de>
To: "Nelson Castillo" <nelson@emqbit.com>
In-Reply-To: <2accc2ff0701290940nbdceb0dkf25db7ea19826895@mail.gmail.com>
References: <2accc2ff0701290940nbdceb0dkf25db7ea19826895@mail.gmail.com>
MIME-Version: 1.0
Cc: Stefano Parusso <stefano@ir3arp.net>,
	openembedded-devel@lists.openembedded.org
Subject: Re: Stable versions of OE
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
X-List-Received-Date: Mon, 29 Jan 2007 22:15:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Nelson Castillo wrote:
> My questions are:
>   * Does OE ever do "stable" releases?

Soon. During the first OEDEM we decided to prepare quarterly
snapshots. We just dont't have the necessary infrastructure
(stabilization phases, unit tests) for that in place yet.

>   * If not, how do you make "stable" releases for yur plataforms?

I start off with a snapshot and then integrate relevant changes from
later revisions by monotone "cherry picking".

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



