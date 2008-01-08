Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <utx@penguin.cz>) id 1JCGIL-0001Ik-Jx
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jan 2008 16:23:13 +0100
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id A38E86280BD;
	Tue,  8 Jan 2008 15:59:50 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200801081527.09859.zecke@selfish.org>
References: <47836C9B.3000407@gmx.net> <200801081527.09859.zecke@selfish.org>
Date: Tue, 08 Jan 2008 15:59:50 +0100
Message-Id: <1199804390.30486.28.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.0 
Cc: Robert Schuster <theBohemian@gmx.net>, Holger Freyther <zecke@selfish.org>
Subject: Re: RFC: add osso version of libtool and libatk
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
X-List-Received-Date: Tue, 08 Jan 2008 15:23:14 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Holger Freyther wrote:
> On Tuesday 08 January 2008 13:29:15 Robert Schuster wrote:
> > Hi,
> > on IRC it was suggested to put this on the mailing list.
> 
> Hey,
> I don't like adding vendor hacked versions of standard software at all. I see 
> the requirement you are facing but adding a Nokia hacked version is not the 
> right way to do it.
> 
> What are the differences you see? Can you extract the patch that is doing 
> that? Is that patch a good idea and can be applied to our version of libtool?

Can you tell me what is the purpose of this patch? I looked into 15000
lines of the atk patch and cannot find any single change except adding
debian directory (not needed for OE) and modifying or adding of
auto-generated files (documentation, config.* and marshalls).

I am not able to find any single change in the code.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



