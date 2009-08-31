Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1MiCyF-0004gL-Fa
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Aug 2009 21:55:19 +0200
Received: from andromeda.vanille.de (e180153210.adsl.alicedsl.de
	[85.180.153.210])
	by drlauer-research.com (Postfix) with ESMTP id E07C6584712
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2009 22:16:38 +0200 (CEST)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Aug 2009 21:36:53 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.28-15-generic; KDE/4.2.2; x86_64; ; )
References: <1251594596-4738-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1251594596-4738-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Message-Id: <200908312136.53824.mickey@vanille-media.de>
Subject: Re: [PATCH] micro-uclibc, minimal-uclibc: Reorder including the base distro config.
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
X-List-Received-Date: Mon, 31 Aug 2009 19:55:19 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sunday 30 August 2009 03:09:56 Khem Raj wrote:
> A lot of stuff in these conf's are already set and
> is duplicated. This is removed. The base conf file
> should be included at the end after assigning LIBC
> so that correct toolchain configuration is picked.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Michael 'Mickey' Lauer <mlauer@vanille-media.de>

Thanks,

:M:



