Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1OS8R0-0007xd-07
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jun 2010 14:55:06 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id D8280110009E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jun 2010 14:50:21 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 78D72110009B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jun 2010 14:50:21 +0200 (CEST)
Received: from rhein.familie-heinold.de (f052236132.adsl.alicedsl.de
	[78.52.236.132]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jun 2010 14:50:21 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 28CC33C33A; Fri, 25 Jun 2010 14:50:21 +0200 (CEST)
Date: Fri, 25 Jun 2010 14:50:21 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100625125020.GB10183@rhein.zuhause.netz>
References: <1277468383-16679-1-git-send-email-Martin.Jansa@gmail.com>
	<20100625133658.5f77ac1f@xora-desktop.xora.org.uk>
MIME-Version: 1.0
In-Reply-To: <20100625133658.5f77ac1f@xora-desktop.xora.org.uk>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: recipes/mesa cleanup
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
X-List-Received-Date: Fri, 25 Jun 2010 12:55:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> On Fri, 25 Jun 2010 14:19:34 +0200
> Martin Jansa <martin.jansa@gmail.com> wrote:
> 
> > Hi,
> > 
> > i know the rules about removing old versions, but in this dir there
> > were versions really old and I'm pretty sure they cant be even built
> > with current OE (I tried in few cases and then refused to spend whole
> > day just to confirm that some 6.0 version still builds after
> > converting to new staging and cleanups..).
> > 
> > Please review/test.
> > 


Acked-by: Henning Heinold <heinold@inf.fu-berlin.de>

Bye Henning


