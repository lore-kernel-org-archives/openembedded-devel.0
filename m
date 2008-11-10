Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1KzWVB-0004sD-JW
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Nov 2008 14:08:21 +0100
Received: from andromeda.vanille.de (e180179026.adsl.alicedsl.de
	[85.180.179.26])
	by drlauer-research.com (Postfix) with ESMTP id D446F58416C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Nov 2008 14:21:34 +0100 (CET)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Nov 2008 14:06:30 +0100
User-Agent: KMail/1.9.10
References: <1226302647.2015.24.camel@akaza1>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF50A@hiob.intern.dresearch.de>
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E3CF50A@hiob.intern.dresearch.de>
MIME-Version: 1.0
Message-Id: <200811101406.30795.mickey@vanille-media.de>
Subject: Re: Building x86 base image.
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
X-List-Received-Date: Mon, 10 Nov 2008 13:08:21 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Am Monday 10 November 2008 12:13:59 schrieb Sledz, Steffen:
> I've build and run minimal-image from the dev branch without any problems
> some weeks before.
>
> MACHINE = "x86"
> DISTRO = "angstrom-2008.1"

We should backport the minimal amount of things necessary to get the minimal 
DISTRO working on x86 as well.

-- 
:M:


