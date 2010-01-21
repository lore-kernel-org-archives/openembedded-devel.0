Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NXwOa-0008DJ-UG
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 13:44:25 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NXwMG-0001Mk-AJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 12:41:56 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NXwMC-0003Dr-0v
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 12:41:52 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1263733818-32111-1-git-send-email-camelguo@gmail.com>
References: <>  <1263733818-32111-1-git-send-email-camelguo@gmail.com>
Date: Thu, 21 Jan 2010 12:41:48 +0000
Message-ID: <1264077708.9743.181.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Set preferred glibc to 2.10.1 in conf/distro/micro.conf
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
X-List-Received-Date: Thu, 21 Jan 2010 12:44:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2010-01-17 at 21:10 +0800, Guo Hongruan wrote:
> * the preferred version of binutils of conf/distro/micro.conf is 2.19.51
> * the preferred version of glibc is 2.6.1 which is defined in sane-toolchain.inc
> * the ld produced by binutils-2.19.51 reports that it can not find the __begin symbol when linking with glibc-2.6.1
> 
> Signed-off-by: Guo Hongruan <camelguo@gmail.com>

Thanks.  I checked this in.

p.




