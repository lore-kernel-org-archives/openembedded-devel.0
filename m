Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NAiGu-0008CT-5j
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 12:00:28 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NAiFT-0001WT-CG
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 10:58:55 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NAiFQ-0003pq-T5
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 10:58:53 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1258467896-28370-1-git-send-email-zlo@zlo.nu>
References: <1258467896-28370-1-git-send-email-zlo@zlo.nu>
Date: Wed, 18 Nov 2009 10:58:49 +0000
Message-Id: <1258541929.26517.96.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] cURL: Add 7.19.7 which supports CRLs.
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
X-List-Received-Date: Wed, 18 Nov 2009 11:00:28 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-11-17 at 15:24 +0100, Marc Olzheim wrote:
> From: Marc Olzheim <marc@iphion.nl>
> 
> Also remove unused curl checksums for older versions.
> ---
>  conf/checksums.ini          |   32 ++++----------------------------
>  recipes/curl/curl_7.19.7.bb |    5 +++++
>  2 files changed, 9 insertions(+), 28 deletions(-)
>  create mode 100644 recipes/curl/curl_7.19.7.bb

Thanks for the patch.  I checked in the latter half of this but not the
former: there doesn't seem to be any real merit in removing things from
checksums.ini.

p.




