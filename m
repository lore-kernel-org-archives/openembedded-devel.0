Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NUdCc-0003lE-QR
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 10:38:21 +0100
Received: from 88-109-31-216.dynamic.dsl.as9105.com ([88.109.31.216]
	helo=[192.168.2.155])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NUdAY-0005Nb-1s
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 09:36:10 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1234549968.1263282575.49599928.71648@mcgi65.rambler.ru>
References: <1234549968.1263282575.49599928.71648@mcgi65.rambler.ru>
Date: Tue, 12 Jan 2010 09:36:06 +0000
Message-ID: <1263288966.457.153.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Gnu/stubs-32.h not found
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
X-List-Received-Date: Tue, 12 Jan 2010 09:38:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2010-01-12 at 10:49 +0300, Perepelica Alexander wrote:
> I try compile target for x86_64 platform but I get
> /x86_64-oe-linux/usr/include/gnu/stubs.h:7:27: error: gnu/stubs-32.h: No 
> such file or directory
> Where can I disable multilib feature gcc?
> Or maybe can I install multilibs into target?

This isn't really anything to do with multilibs.  I think you just need
to figure out why that file is not being correctly installed and fix it.
It's hard/impossible to give any real advice on that without knowing
which package versions you are using and which one you were trying to
build when this error occurred.

p.




