Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1RvZqu-0005Ve-Ir
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Feb 2012 20:40:20 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id C508022325A8;
	Thu,  9 Feb 2012 20:32:17 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 30A4522325A7;
	Thu,  9 Feb 2012 20:32:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
Received: from rhein.familie-heinold.de (g229045192.adsl.alicedsl.de
	[92.229.45.192]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Thu,  9 Feb 2012 20:32:16 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 4FE603C4B6; Thu,  9 Feb 2012 20:32:15 +0100 (CET)
Date: Thu, 9 Feb 2012 20:32:15 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20120209193214.GA26030@rhein.zuhause.netz>
References: <4F2A97B7.2080709@opendreambox.org>
	<4F331951.2010701@opendreambox.org>
	<4F33BF11.4010009@opendreambox.org> <11868044.ITA0Lum9As@helios>
MIME-Version: 1.0
In-Reply-To: <11868044.ITA0Lum9As@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] giflib: don't link against libx11, don't depend on libsm
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
X-List-Received-Date: Thu, 09 Feb 2012 19:40:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 09, 2012 at 02:02:51PM +0000, Paul Eggleton wrote:
> I'd agree with disabling it as well. According to google it was Henning who 
> added libsm as a dependency in OE-Classic. Henning, do you remember the reason 
> for adding this, and is it still valid?
> 
> Cheers,
> Paul

Sorry no idea, why I added it. But I vote for option 1 too, so folks without X11 needs
do not have to build X11.

Bye Henning


