Received: from relay04.stack.nl ([131.155.140.107] helo=mx1.stack.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ruud@il.fontys.nl>) id 1NrpPl-0002ry-G0
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Mar 2010 10:19:47 +0100
Received: by mx1.stack.nl (Postfix, from userid 65534)
	id E93161DD63B; Wed, 17 Mar 2010 10:16:43 +0100 (CET)
Received: from mail.il.fontys.nl (mail.il.fontys.nl
	[IPv6:2001:4128:1000:1000::7])
	(using TLSv1 with cipher ADH-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by mailhost.stack.nl (Postfix) with ESMTPS id D57D01DD62C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Mar 2010 10:16:41 +0100 (CET)
Received: by mail.il.fontys.nl (Postfix, from userid 1004)
	id 883A112524; Wed, 17 Mar 2010 10:16:41 +0100 (CET)
Received: from grandcru.il.fontys.nl (grandcru.il.fontys.nl
	[IPv6:2001:4128:1000:1000::47])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(Client CN "grandcru.il.fontys.nl",
	Issuer "CA Cert Signing Authority" (verified OK))
	by mail.il.fontys.nl (Postfix) with ESMTPS id 9A6D11250F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Mar 2010 10:16:39 +0100 (CET)
Received: by grandcru.il.fontys.nl (Postfix, from userid 1838)
	id 8ED7028436; Wed, 17 Mar 2010 10:20:07 +0100 (CET)
Date: Wed, 17 Mar 2010 10:20:07 +0100
From: Ruud Althuizen <ruud@il.fontys.nl>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100317092007.GA6559@il.fontys.nl>
References: <1268741537.4251.30.camel@balakrishnan-desktop>
MIME-Version: 1.0
In-Reply-To: <1268741537.4251.30.camel@balakrishnan-desktop>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 131.155.140.107
X-SA-Exim-Mail-From: ruud@il.fontys.nl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add pxa270 based Regulus Board
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
X-List-Received-Date: Wed, 17 Mar 2010 09:19:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello balakrishnan,

On Tue 16 Mar 2010 05:42 PM, balakrishnan wrote:
> Regulus is pxa270 based machine, attached patches need to be reviewed and
> added to oe tree. This patches are used to create u-boot, kernel and
> demo-image for regulus machine.
You've included vim swapfiles in the patch, please remove these and
re-submit. I'm not a Openembedded developer, so there may be other comments
as well.

-- 
With regards,
Ruud Althuizen


