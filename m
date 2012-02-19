Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1RzBsv-00069S-Ui
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Feb 2012 19:53:21 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 0682522325A8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Feb 2012 19:45:07 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 0A56322325A7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Feb 2012 19:45:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (f052065100.adsl.alicedsl.de
	[78.52.65.100]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Feb 2012 19:45:05 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 580F43C4B9; Sun, 19 Feb 2012 19:44:57 +0100 (CET)
Date: Sun, 19 Feb 2012 19:44:57 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120219184455.GA26592@rhein.zuhause.netz>
References: <1329600022-8027-1-git-send-email-heinold@inf.fu-berlin.de>
	<20120219002734.GA9459@sakrah.homelinux.org>
MIME-Version: 1.0
In-Reply-To: <20120219002734.GA9459@sakrah.homelinux.org>
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
X-List-Received-Date: Sun, 19 Feb 2012 18:53:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 18, 2012 at 04:27:34PM -0800, Khem Raj wrote:
> On (18/02/12 22:20), Henning Heinold wrote:
> > Hi,
> > 
> > in good old tradition I send this patches for review against
> > older openembedded.dev branch. It makes openjdk buildable
> > again and updates it to version 1.11.1.
> > Work was sponsored by Koan s.a.s. If nobody objects I will
> > commit it on monday.
> 
> the patches look sane. Two things I would think will be nice is
> 1. are these patches needed on 2011.03 branch ? if yes please submit
> the pull request for the maintenance branch too

When there is someone who needs them in 2011.03 he can test and make a pull request.

> 2. Are any of these patches needed for meta-java or any other
> layer then they should be forwarded ported to respective layer
> as well

As beeing the meta-java maintainer only the 1.11.1 recipe will be soon in meta-oe,
when I find the time.

Bye Henning


