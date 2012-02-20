Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1RzXut-00044k-2x
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Feb 2012 19:24:51 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 1E56822325A9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2012 19:16:35 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id B567222325A7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2012 19:16:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g229105053.adsl.alicedsl.de
	[92.229.105.53]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2012 19:16:34 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id A03263C4B9; Mon, 20 Feb 2012 19:16:33 +0100 (CET)
Date: Mon, 20 Feb 2012 19:16:33 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120220181633.GB22201@rhein.zuhause.netz>
References: <1329600022-8027-1-git-send-email-heinold@inf.fu-berlin.de>
	<20120219002734.GA9459@sakrah.homelinux.org>
	<20120219184455.GA26592@rhein.zuhause.netz>
	<4F422C57.8080609@nedap.com>
MIME-Version: 1.0
In-Reply-To: <4F422C57.8080609@nedap.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [oe-classic][PATCH 00/12] openjdk
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
X-List-Received-Date: Mon, 20 Feb 2012 18:24:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 20, 2012 at 12:19:51PM +0100, Jaap de Jong wrote:
> What would be the best approach to backport to 2010.12?
> I volunteer to backport and do some testing...

Hi Jaap,

cherry-pick the patches or try to apply them via git-am.

Bye Henning


