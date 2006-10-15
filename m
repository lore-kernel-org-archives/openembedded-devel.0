Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <lenehan@twibble.org>) id 1GZFK8-00011O-Hd
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Oct 2006 01:23:16 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 326B011148;
	Mon, 16 Oct 2006 09:16:33 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 15072-09; Mon, 16 Oct 2006 09:16:31 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 8030910B5A;
	Mon, 16 Oct 2006 09:16:31 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 7177312CB9CB; Mon, 16 Oct 2006 09:16:31 +1000 (EST)
Date: Mon, 16 Oct 2006 09:16:31 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: Koen Kooi <koen@dominion.kabel.utwente.nl>
Message-ID: <20061015231631.GA6215@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	Koen Kooi <koen@dominion.kabel.utwente.nl>,
	openembedded-devel@lists.openembedded.org
References: <E1GYf1g-00024R-9w@linuxtogo.org>
	<20061015003742.GB12679@twibble.org>
	<4531ED53.1050506@dominion.kabel.utwente.nl>
Mime-Version: 1.0
In-Reply-To: <4531ED53.1050506@dominion.kabel.utwente.nl>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev strace: bump pr after last patch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Oct 2006 23:23:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 15, 2006 at 10:12:03AM +0200, Koen Kooi wrote:
[...]
> > Was there some reason for this? (Just to make sure I didn't miss
> > something!) In this case it had no effect on any existing strace
> > build (the change is a no-op for glibc < 2.5) and since glibc 2.5
> > didn't build previously it can't have had any change on glibc 2.5
> > built strace's...
> 
> People who's build broke (like me :) ) wouldn't get past it because OE tries to finish
> building the unpatched version. I was trying to avoid the 'I updated and it still fails'

Ahh, yep... that is something I didn't think of. I'll keep that in
mind in the future.

Thanks!

-- 
 Jamie Lenehan <lenehan@twibble.org>


