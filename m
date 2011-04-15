Received: from smtp202.alice.it ([82.57.200.98])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1QAprK-0007dh-9l
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Apr 2011 22:43:18 +0200
Received: from [10.10.20.100] (95.249.56.93) by smtp202.alice.it (8.5.124.08)
	(authenticated as editempo@alice.it)
	id 4CC7FB5F02DADA2E for openembedded-devel@lists.openembedded.org;
	Fri, 15 Apr 2011 22:41:00 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1302885760-32195-1-git-send-email-patda293@student.liu.se>
References: <1302885760-32195-1-git-send-email-patda293@student.liu.se>
Date: Fri, 15 Apr 2011 22:40:59 +0200
Message-ID: <1302900059.3534.1.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH v2] firefox: Added libIDL-2.0 CFLAGS and LIBS
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
X-List-Received-Date: Fri, 15 Apr 2011 20:43:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: Quoted-Printable

On Fri, 2011-04-15 at 18:42 +0200, Patrik Dahlstr=C3=B6m wrote:
> * autoconf does not fill in any CFLAGS or LIBS for libIDL-2.0. This
>   patch sets the appropriate flags in autoconf.mk.in for
>   HOST_LIBIDL_CFLAGS and HOST_LIBIDL_LIBS.
What error did you get?
Maybe you could add something like:
 This patch fixes the following error:
 [ERROR here]
To the commit message.

By the way, thanks a lot for the fix.

Denis.




