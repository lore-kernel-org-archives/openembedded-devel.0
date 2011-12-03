Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1RWseF-00006l-PE
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Dec 2011 17:41:11 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id B0B001100182
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Dec 2011 17:34:25 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 92F74110017F
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Dec 2011 17:34:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (f052239173.adsl.alicedsl.de
	[78.52.239.173]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Dec 2011 17:34:24 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 7A0A03C49D; Sat,  3 Dec 2011 17:34:23 +0100 (CET)
Date: Sat, 3 Dec 2011 17:34:23 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111203163423.GA3821@mail.familie-heinold.de>
References: <jba6p6$bep$1@dough.gmane.org>
	<CA+M6bXk94ukVFEva8Ab-RbvNe3pWuYkJWZkk-WS8CpKca83F4Q@mail.gmail.com>
	<jbdhuo$pe4$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <jbdhuo$pe4$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [meta-java] rpath problem for llvm libs?
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
X-List-Received-Date: Sat, 03 Dec 2011 16:41:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 03, 2011 at 05:15:21PM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> So if we were to follow that option 4) seems to be the way.
> 
> regards,
> 
> Koen

Hi,

our original Idea was, that you can install diffrent llvm versions at the same time. We need
to discuss if we have still the case or really only one version of llvm. If not we can use directly /usr/lib if not
solution 4 with rpath is my favourit. Besides this llvm should go to core, but I wanted to wait
for the 3.0 release and christmas holidays to do it.

Bye Henning


