Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <dp@xora.org.uk>) id 1JRQgi-0000yI-Sx
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Feb 2008 12:31:06 +0100
Received: from cimmeria ([::ffff:78.86.128.56])
	(AUTH: LOGIN dp, SSL: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Tue, 19 Feb 2008 11:30:17 +0000
	id 000313DD.47BABDC9.00007BD5
Date: Tue, 19 Feb 2008 11:30:24 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080219113024.32ba3368@cimmeria>
In-Reply-To: <1203419692.21824.35.camel@dax.rpnet.com>
References: <1203419692.21824.35.camel@dax.rpnet.com>
X-Mailer: Claws Mail 3.2.0 (GTK+ 2.12.0; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE.dev roadworks notification
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
X-List-Received-Date: Tue, 19 Feb 2008 11:31:06 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 19 Feb 2008 11:14:52 +0000
Richard Purdie <rpurdie@rpsys.net> wrote:
> With packaged staging one thing we need to decide whether ultimately
> its something optional which people opt into, or whether having
> staging under control of a package manager is something desirable at
> all times. My gut feeling is that its something we should really make
> mandatory or opt-out, maybe not at first but certainly longer term
> but I'm open to views on that.
> 
My feeling is opt-out. That way you have to read the docs to get out
and that means you have to understand why you are swimming upstream.

One of the most common problems in OE for beginners seems to be
building packages that conflict in staging. Having the no breaking
system be the default would be the best.

Graeme (XorA)



