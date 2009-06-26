Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MKB9U-0006lD-K0
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Jun 2009 15:07:36 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MKAyT-0001O3-QB
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Jun 2009 13:56:13 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1MKAyT-0001AJ-Ko
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Jun 2009 13:56:13 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1246018481-24033-1-git-send-email-msmith@cbnco.com>
References: <1246018481-24033-1-git-send-email-msmith@cbnco.com>
Date: Fri, 26 Jun 2009 13:56:13 +0100
Message-Id: <1246020973.6690.270.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.2 
Subject: Re: [PATCH][resend] iputils 20071127: add docbook dependency to fix build
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
X-List-Received-Date: Fri, 26 Jun 2009 13:07:36 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-06-26 at 08:14 -0400, Michael Smith wrote:
> Looks like the newer snapshots don't include manpages, so
> docbook-utils-native is required to build them.
> 
> Signed-off-by: Michael Smith <msmith@cbnco.com>
> ---
>  recipes/iputils/iputils_20071127.bb |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)

Thanks for the patch.  When I first looked at this I remember thinking
that 20071127 seemed like a really old snapshot and being under the
impression that we had a newer one which didn't need this change.  But,
now I look again, it seems I was just wrong about that and 20071127
really is the newest one we have.

So, anyway, I checked this in.

p.




