Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MhPEc-00080Y-IA for openembedded-devel@lists.openembedded.org;
	Sat, 29 Aug 2009 16:48:55 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1MhOwu-0001nL-5V
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Aug 2009 16:30:36 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Aug 2009 16:30:36 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Aug 2009 16:30:36 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 29 Aug 2009 16:30:14 +0200
Message-ID: <h7be1m$kuh$1@ger.gmane.org>
References: <1251504044-2315-1-git-send-email-raj.khem@gmail.com>	<1251533696.4215.623.camel@lenovo.internal.reciva.com>	<19c1b8a90908290133l36f791b2lfe8db1a1c6f333b2@mail.gmail.com>
	<1251536004.27780.75.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <1251536004.27780.75.camel@mill.internal.reciva.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] sane-toolchain-eglibc.inc: Set TARGET_OS = linux-gnuspe for e500
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
X-List-Received-Date: Sat, 29 Aug 2009 14:48:57 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29-08-09 10:53, Phil Blundell wrote:
> The current
> EABI logic that resides in sane-toolchain-xxx.inc seems like it is
> really a misplaced piece of Angstrom policy.

Angstrom does not use the sane-toolchain stuff. The sane-toolchain thing 
is a misguided unilateral attempt to 'unify' OE distros. As you point 
out, it forces way too much policy onto it's users.



