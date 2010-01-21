Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NXwue-00067S-1h
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 14:17:31 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NXwsT-00026q-6w
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 13:15:13 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NXwsT-0003aE-0u
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 13:15:13 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1263943717.3181.20.camel@mattotaupa.wohnung.familie-menzel.net>
References: <4B563AED.6020504@atmel.com>
	<1263943534.3181.19.camel@mattotaupa.wohnung.familie-menzel.net>
	<1263943717.3181.20.camel@mattotaupa.wohnung.familie-menzel.net>
Date: Thu, 21 Jan 2010 13:15:09 +0000
Message-ID: <1264079709.9743.186.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Build fbv with JPEG and PNG enabled
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
X-List-Received-Date: Thu, 21 Jan 2010 13:17:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-01-20 at 00:28 +0100, Paul Menzel wrote:
> Am Mittwoch, den 20.01.2010, 00:25 +0100 schrieb Paul Menzel:
> > Am Mittwoch, den 20.01.2010, 00:06 +0100 schrieb Ulf Samuelsson:
> > >  PR = "r1"
> > 
> > Should not this be increased because of the changed `DEPENDS`? Why is
> > `PR` not just a number?
> 
> Sorry, please ignore that second question. It is late!

That's actually a good question, though not one that's specific to this
one recipe.  That leading "r" in ${PR} doesn't really serve any purpose
other than to make all the recipes one byte bigger, and it might be nice
to get rid of it at some point.

p.




