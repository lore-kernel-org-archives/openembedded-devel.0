Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1M3ic4-0001Vj-Gg
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 May 2009 05:25:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 798294ABE7D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2009 23:18:29 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 07254-09 for <openembedded-devel@lists.openembedded.org>; 
	Mon, 11 May 2009 23:18:29 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 53FD2492A0A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2009 23:18:29 -0400 (EDT)
Date: Mon, 11 May 2009 23:18:29 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090512030227.GF7973@smtp.west.cox.net>
Message-ID: <Pine.LNX.4.64.0905112317500.6446@juice.ott.cti.com>
References: <c384c5ea0905071305s1b180deal8c5fd09b5d646308@mail.gmail.com>
	<1242096804-27041-1-git-send-email-msmith@cbnco.com>
	<1242096804-27041-2-git-send-email-msmith@cbnco.com>
	<20090512030227.GF7973@smtp.west.cox.net>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH] grub: Split the grub-install script and	friends into a separate package.
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
X-List-Received-Date: Tue, 12 May 2009 03:25:04 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 11 May 2009, Tom Rini wrote:

> >  SRC_URI = "ftp://alpha.gnu.org/gnu/grub/grub-${PV}.tar.gz \
> 
> Please switch to ${GNU_MIRROR}/grub/...

grub is not on ${GNU_MIRROR}, only alpha.

I can only guess because it never had an official release.

Mike


