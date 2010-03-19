Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NsbO5-0004bB-EO
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 13:33:20 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NsbL6-0004vl-Ta
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 12:30:09 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NsbL6-0006iN-As
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 12:30:08 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ac9c93b11003190341l3a971c41oe49170670498b104@mail.gmail.com>
References: <1268857354-30377-1-git-send-email-sledz@dresearch.de>
	<1268990986.3893.5.camel@mattotaupa> <hnviha$nf1$1@dough.gmane.org>
	<1268994412.4292.0.camel@rex>
	<ac9c93b11003190341l3a971c41oe49170670498b104@mail.gmail.com>
Date: Fri, 19 Mar 2010 12:30:04 +0000
Message-ID: <1269001804.14566.1450.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libunwind: new recipe
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
X-List-Received-Date: Fri, 19 Mar 2010 12:33:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-03-19 at 11:41 +0100, Frans Meulenbroeks wrote:
> I was left with about 380 vars. See the list attached.
> Guess most of them are undocumented (and actually 380 seems an awful lot to me).

That's an interesting list.  It's hard to say how many of those are
actually intended for public consumption.

Some of them, like KERNEL_VERISON (sic), presumably are bogus and serve
no useful purpose.  Some of them look like they are probably meant to be
internal to the class in question and shouldn't be used or set by
anything else.

But you're right, more documentation would be better.

p.




