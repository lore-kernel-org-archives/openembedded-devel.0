Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NB7Sg-0004Yx-2z
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 14:54:17 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NB7RH-0002Wc-5M
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 13:52:47 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NB7RF-0003GP-SL
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 13:52:45 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <be7a9f3d0911190542j2bea66ccs65d6261b9c92bf87@mail.gmail.com>
References: <be7a9f3d0911181211s614defeaq5a49ca33c3691c50@mail.gmail.com>
	<1258576924.25369.687.camel@lenovo.internal.reciva.com>
	<be7a9f3d0911181421i4d3a1ffy2417cbbd91d9a1ff@mail.gmail.com>
	<1258631715.23826.63.camel@mill.internal.reciva.com>
	<be7a9f3d0911190542j2bea66ccs65d6261b9c92bf87@mail.gmail.com>
Date: Thu, 19 Nov 2009 13:52:42 +0000
Message-Id: <1258638762.23826.90.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] Merging of stable/2009 into dev
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
X-List-Received-Date: Thu, 19 Nov 2009 13:54:17 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-11-19 at 11:42 -0200, Otavio Salvador wrote:
> Ok but what is the planned migration path from users that used
> stable/2009 to stable/2010?
> 
> I mean, when we start stable/2010 we expect that users that based
> their distros in stable/2009 need to redo all work to move to
> stable/2010? If we merge stable/2009 into .dev then this is going to
> be much easier.

I am still struggling to understand what you mean by "merge stable/2009
into .dev".  Can you please explain what exactly you think the result of
this merge would look like?  Maybe you could pick a couple of sample
packages and give a concrete description of how the merged version would
differ from what is currently in .dev.

p.




