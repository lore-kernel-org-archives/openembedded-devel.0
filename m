Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1LrJzv-0004Kh-3E
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Apr 2009 00:43:16 +0200
Received: from andromeda.vanille.de (e180153228.adsl.alicedsl.de
	[85.180.153.228])
	by drlauer-research.com (Postfix) with ESMTP id 1561958412A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Apr 2009 01:07:04 +0200 (CEST)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Wed, 8 Apr 2009 00:39:27 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.27-11-generic; KDE/4.2.2; x86_64; ; )
References: <200904071212.18247.mickey@vanille-media.de>
	<20090407174351.GD11203@denix.org>
In-Reply-To: <20090407174351.GD11203@denix.org>
MIME-Version: 1.0
Message-Id: <200904080039.27928.mickey@vanille-media.de>
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: DEPLOY_DIR / packaged staging / persistent toolchains
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
X-List-Received-Date: Tue, 07 Apr 2009 22:43:20 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Denis,

> Are you overwriting DEPLOY_DIR_PSTAGE from its default
> ${DEPLOY_DIR}/pstage?

No, I didn't touch that.

> Otherwise it should work and should populate CROSS_DIR from pstage.

Ok, that simply doesn't happen here.

How can we debug this further.

:M:



