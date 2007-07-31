Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IFfTj-0000WS-Gc
	for openembedded-devel@openembedded.org; Tue, 31 Jul 2007 02:20:47 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l6V0Itw5007857;
	Tue, 31 Jul 2007 01:18:55 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07699-05; Tue, 31 Jul 2007 01:18:52 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l6V0IpmR007850
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Tue, 31 Jul 2007 01:18:51 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: "Dr. Mickey Lauer" <mickey@vanille-media.de>
In-Reply-To: <52752373.20070731020230@vanille-media.de>
References: <1185839805.7719.103.camel@localhost.localdomain>
	<52752373.20070731020230@vanille-media.de>
Date: Tue, 31 Jul 2007 01:18:50 +0100
Message-Id: <1185841130.7719.111.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel <openembedded-devel@openembedded.org>,
	Henryk =?ISO-8859-1?Q?Pl=F6tz?= <henryk@openmoko.org>,
	bitbake-dev <bitbake-dev@lists.berlios.de>
Subject: Re: The future of "svnnow"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jul 2007 00:20:47 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-07-31 at 02:02 +0200, Dr. Michael Lauer wrote:
> Awesome work -- I'm impressed!

Thanks :)

> This is yet another example of how good the BitBake core architecture
> is.

Yes!

> > b) how much of the outstanding task list we need to complete before 1.8.8
> 
> 1,2,4

Ok, thats roughly what I was thinking too. 4 needs 3 too so thats 1-4.

> > c) how to migrate to these changes in OE.dev
> 
> Who has actually used SRCDATE = now? I know I did.

I also mean issues like who's going to do it, when and how? All at once,
distro by distro, adhoc? and is the aim to wipe out SRCDATE entirely for
svn?

Richard



