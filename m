Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <dp@xora.org.uk>) id 1JLxxp-0004oh-7z
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2008 10:50:09 +0100
Received: from cimmeria ([::ffff:78.86.128.56])
	(AUTH: LOGIN dp, SSL: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Mon, 04 Feb 2008 09:50:19 +0000
	id 000383A2.47A6DFDB.00004709
Date: Mon, 4 Feb 2008 09:52:36 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080204095236.28687b4a@cimmeria>
In-Reply-To: <47A6D6E6.4030700@whitby.id.au>
References: <1201823499.20311.26.camel@localhost.localdomain>
	<20080203210353.438dffaf@cimmeria>
	<47A6D3C2.10304@kernelconcepts.de> <47A6D6E6.4030700@whitby.id.au>
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
X-List-Received-Date: Mon, 04 Feb 2008 09:50:09 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 04 Feb 2008 19:42:06 +1030
Rod Whitby <rod@whitby.id.au> wrote:

> > Graeme Gregory schrieb:
> >> Sounds like it is time for our regular re-assessment of the use
> >> of monotone. Maybe we should start another round of testing other
> >> SCM systems again.
> 
> Let's just cut to the chase and discuss why we're not using git ...
> 
Well something I wondered about in my sleep is can zecke's mtn->git
script work both ways. Then we don't have to change SCM in one
nasty leap. We can run both in parallel for a while and when the
traffic on mtn ceases (if it does) terminate that.

Graeme


