Received: from [209.85.128.184] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pmiscml@gmail.com>) id 1JZjaV-0004Ne-Ad
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Mar 2008 10:19:02 +0100
Received: by fk-out-0910.google.com with SMTP id 18so3892272fks.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2008 02:16:48 -0700 (PDT)
Received: by 10.82.188.15 with SMTP id l15mr22489036buf.13.1205399808728;
	Thu, 13 Mar 2008 02:16:48 -0700 (PDT)
Received: from widy.localdomain ( [88.231.54.215])
	by mx.google.com with ESMTPS id b17sm21325538fka.4.2008.03.13.02.16.46
	(version=SSLv3 cipher=OTHER); Thu, 13 Mar 2008 02:16:47 -0700 (PDT)
Date: Thu, 13 Mar 2008 11:18:33 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080313111833.338da7cb@widy.localdomain>
In-Reply-To: <fraqbd$k6k$2@ger.gmane.org>
References: <47D71B8F.1030108@balister.org>
	<fraqbd$k6k$2@ger.gmane.org>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.128.184
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Git versus Hg
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
X-List-Received-Date: Thu, 13 Mar 2008 09:19:03 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Thu, 13 Mar 2008 09:58:21 +0100
Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Philip Balister schreef:
> | Given the only serious contenders for possible SCM's for OE appear
> to be | git or Hg, I am curious about the expertise level available
> on this list.
> 
> A big problem with git:
> 
> * it cannot import a flat OE repository (e.g a mtn checkout of .dev)
> * it cannot import a OE repo with history (e.g with mtn2git)
> 
> Why? Git can't store empty dirs, and we use that in a few key places
> in OE. Holger 'solved' that in mtn2git by putting in a lot .dummy
> files into those dirs, but those will end up in your packages and
> rootfses.

Heh, it seems that Git's spiritual ancestor, CVS, strikes back from
behind the facade of novelty features. That's good display that similar
design and implementation approaches lead to similar "features" for
users to work around. Well-well, I shutup, shutup.

> 
> regards,
> 
> Koen

[]


-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


