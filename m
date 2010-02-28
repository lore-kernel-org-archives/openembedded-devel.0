Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=drlauer-research.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1Nlqr5-0004Yh-4F
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Feb 2010 22:39:15 +0100
Received: from [192.168.1.2] (e180134197.adsl.alicedsl.de [85.180.134.197])
	by drlauer-research.com (Postfix) with ESMTP id C0213584132
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2010 23:31:36 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ac9c93b11002281201j44a861e1saa803be9f338ee10@mail.gmail.com>
References: <ac9c93b11002281201j44a861e1saa803be9f338ee10@mail.gmail.com>
Organization: Vanille-Media
Date: Sun, 28 Feb 2010 22:37:03 +0100
Message-ID: <1267393023.13054.2.camel@andromeda>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] duplicate recipes
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
X-List-Received-Date: Sun, 28 Feb 2010 21:39:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Sonntag, den 28.02.2010, 21:01 +0100 schrieb Frans Meulenbroeks:
> Below is a list of all recipes that have 5 or more versions.
> Guess a lot of these are deadwood.
> Proposal is to do some cleaning for these.
> 
> Probably the best scenario is to remove all versions which
> - are not the latest version
> - are not  pinned with  PREFERRED_VERSION  in conf/distro/*
> - do not have the largest DEFAULT_PREFERENCE
> 
> What do people feel about this?

As written in your other mail, moving them out of sight (even perhaps in
an own repository) would have my support.

-- 
:M:



