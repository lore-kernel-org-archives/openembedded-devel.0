Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rod@whitby.id.au>) id 1LBrjs-0001FF-P2
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Dec 2008 15:14:32 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 85B2F1E6F48;
	Sun, 14 Dec 2008 09:10:14 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Sun, 14 Dec 2008 09:10:14 -0500
X-Sasl-enc: rqHNmeNQ9rguxKgM7ZwHF3X2DsPHbJebBqXcVFMOs+31 1229263814
Received: from [192.168.1.11] (CPE-121-209-18-212.sa.bigpond.net.au
	[121.209.18.212])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 7B69566ED;
	Sun, 14 Dec 2008 09:10:13 -0500 (EST)
Message-ID: <494513B7.1000508@whitby.id.au>
Date: Mon, 15 Dec 2008 00:39:59 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.18 (Windows/20081105)
MIME-Version: 1.0
To: haf@informatik.uni-kiel.de
References: <3bf8d295b93f5530b9b067526afbc307.squirrel@www.informatik.uni-kiel.de>
In-Reply-To: <3bf8d295b93f5530b9b067526afbc307.squirrel@www.informatik.uni-kiel.de>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: md5sum mismatch for ipkg packages
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
X-List-Received-Date: Sun, 14 Dec 2008 14:14:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hauke Fuhrmann wrote:
> I have encountered md5sum mismatches for ipkg packages, of which the info
> says that you are the maintainer.

The nslu2-linux project is the maintainer for that feed.

> # ipkg install kernel-module-md
> Installing kernel-module-md (2.4.22.l2.3r63-r21) to root...
> Downloading
>
http://ipkg.nslu2-linux.org/feeds/unslung/modules/cross/stable/kernel-module-md_\
> 2.4.22.l2.3r63-r21_nslu2be.ipk

Please post the contents of your ipkg configuration files on the
nslu2-linux mailing list (not here).

Thanks,

-- Rod Whitby
-- NSLU2-Linux Project Lead




