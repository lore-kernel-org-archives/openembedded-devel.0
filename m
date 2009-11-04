Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1N5l2w-0007gi-Tf
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 19:57:33 +0100
Received: from 88-109-143-180.dynamic.dsl.as9105.com ([88.109.143.180]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1N5l1m-0002kC-US
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 18:56:19 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <19c1b8a90911041028y24fa7ca0rc5f6e31b1ca568d7@mail.gmail.com>
References: <1257325402-3232-1-git-send-email-Martin.Jansa@gmail.com>
	<19c1b8a90911041028y24fa7ca0rc5f6e31b1ca568d7@mail.gmail.com>
Date: Wed, 04 Nov 2009 18:56:16 +0000
Message-ID: <1257360976.4897.235.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] eglibc: updated armv4t-interworking.patch
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
X-List-Received-Date: Wed, 04 Nov 2009 18:57:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2009-11-04 at 10:28 -0800, Khem Raj wrote:
> there is already a define __USE_BX__ and another macro BX(reg)
> I think they should be used here instead

No, those macros mean something slightly different.  I think the code as
written in this patch is correct.

p.




