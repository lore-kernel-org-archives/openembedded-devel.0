Received: from [72.29.79.205] (helo=rhodos.klever.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hacker@klever.net>) id 1IdWei-00029n-AY
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Oct 2007 21:46:44 +0200
Received: from pd953ad30.dip0.t-ipconnect.de ([217.83.173.48]
	helo=[192.168.4.12])
	by rhodos.klever.net with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.67) (envelope-from <hacker@klever.net>) id 1IdWZV-0007tO-MY
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Oct 2007 21:41:23 +0200
Message-ID: <4705418A.8030907@klever.net>
Date: Thu, 04 Oct 2007 21:39:54 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 2.0.0.6 (X11/20070911)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1191494488.2516.34.camel@toontown>
	<4704CC05.40206@klever.net>	<B9AD73C2-790F-43EE-9FC4-96F1B1FA9415@selfish.org>	<1191502502.2516.39.camel@toontown>
	<4704EAE3.8050702@klever.net>	<b6ebd0a50710041136o48edfecbm6afd05d9b921d41f@mail.gmail.com>	<470535D5.8070307@am.sony.com>	<b6ebd0a50710041157y3bdafafbha82ce0a3b1fbdac6@mail.gmail.com>	<47053AC4.5080506@klever.net>
	<b6ebd0a50710041227q4845a880h377fdd206a796193@mail.gmail.com>
In-Reply-To: <b6ebd0a50710041227q4845a880h377fdd206a796193@mail.gmail.com>
Subject: Re: monotone/git (was hello...)
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
X-List-Received-Date: Thu, 04 Oct 2007 19:46:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

\>> Wait, how do you execute a hook when pushing via webdav?
> 
> post-update is executed in the remote repository when pushing to it.
> In fact, the default post-update script in a new git init'd repository
> is just a script that calls git-update-server-info, so all you have to
> do is chmod +x foo.git/hooks/post-update and call it a day.  It works
> just fine.

*Who* executes post-update script when you push to remote repository via
webdav?

Love,
H


