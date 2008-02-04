Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <dp@xora.org.uk>) id 1JLydr-0001cV-9c
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2008 11:33:35 +0100
Received: from cimmeria ([::ffff:78.86.128.56])
	(AUTH: LOGIN dp, SSL: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Mon, 04 Feb 2008 10:33:45 +0000
	id 00038586.47A6EA09.000047B0
Date: Mon, 4 Feb 2008 10:36:05 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080204103605.3fdfb2e4@cimmeria>
In-Reply-To: <47A6E7E3.3030600@whitby.id.au>
References: <1201823499.20311.26.camel@localhost.localdomain>
	<20080203210353.438dffaf@cimmeria>
	<47A6D3C2.10304@kernelconcepts.de> <47A6D6E6.4030700@whitby.id.au>
	<47A6DF88.7010204@student.utwente.nl>
	<47A6E7E3.3030600@whitby.id.au>
X-Mailer: Claws Mail 3.2.0 (GTK+ 2.12.0; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: Monotone issues
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
X-List-Received-Date: Mon, 04 Feb 2008 10:33:35 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 04 Feb 2008 20:54:35 +1030
Rod Whitby <rod@whitby.id.au> wrote:
> > 2) git 1.4 just threw away your local changes on what git calls a
> > 'merge'
> 
> Different tool, different cheat-sheet to learn.  That's always to be
> expected when changing tools.  Monotone merges are so bad that I
> flatly refuse to even attempt a manual merge, preferring to blow away
> my whole monotone repository and start again rather than try a
> monotone manual merge.
> 
This was a bug with git 1.4, totally denied by git developers, but
magically fixed with git 1.5

At least that was my experience of this, I havent seen it since I
started to use git 1.5 and reports on the net dried off after this
point as well.

G


