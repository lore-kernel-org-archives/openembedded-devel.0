Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NHby7-0006Mb-RM
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Dec 2009 12:41:35 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NHbwW-0002Vf-F6
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Dec 2009 11:39:52 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NHbwU-0005eZ-Ra
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Dec 2009 11:39:50 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <818ccfc40912070241pa211c18ibb1a556607680c6@mail.gmail.com>
References: <818ccfc40912070241pa211c18ibb1a556607680c6@mail.gmail.com>
Date: Mon, 07 Dec 2009 11:39:47 +0000
Message-Id: <1260185987.779.70.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: building GCC cross compiler without building any library
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
X-List-Received-Date: Mon, 07 Dec 2009 11:41:35 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-12-07 at 15:41 +0500, Ahsan Khawaja wrote:
> Is it possible to build GCC cross compiler with support of any library
> (eglic, glibc,uclibc and newlib). What should I have to do in this regard.

I'm not quite sure what you're asking.  Do you mean that you want to
build a generic version of GCC which can then be used with any of the
four C libraries that you mention?

If so, the answer is probably "yes" so long as you restrict yourself to
plain C only.  If you want C++ or the like, the answer is almost
certainly no.

p.




