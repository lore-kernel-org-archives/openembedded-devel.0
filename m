Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1Jxqsp-0002zF-Pr
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 May 2008 23:57:35 +0200
Received: from andromeda (e180151064.adsl.alicedsl.de [85.180.151.64])
	by drlauer-research.com (Postfix) with ESMTP id CD5C4584C3A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 May 2008 23:55:42 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 May 2008 23:55:25 +0200
User-Agent: KMail/1.9.9
References: <c384c5ea0805141505r451510dar128090c7fc3d270@mail.gmail.com>
In-Reply-To: <c384c5ea0805141505r451510dar128090c7fc3d270@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200805182355.25777.mickey@vanille-media.de>
Subject: Re: Who is the wrt54oe maintainer?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sun, 18 May 2008 21:57:35 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 15 May 2008 00:05:25 Leon Woestenberg wrote:
> who is the wrt54oe distro maintainer?

Unfortunately, there's no one. I always had the hope we could get one of the 
openwrt-fork-maintainers on board. Marcin and me once did some work towards 
having this popular device in OE, but we both could not find enough time to 
keep it up.

> It needs love in conf/distro/wrt54oe.conf, as it  isn't up to date
> with our external toolchain opt-in, binutils-cross is not locked down,
> and the c library was not chosen, nor its version.

Indeed. Could I talk you into adding the necessary bits? If not, feel free to 
move it to nonworking/conf/machine/.

:M:

-- 
Dr. Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de


