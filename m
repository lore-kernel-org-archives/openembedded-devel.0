Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <zecke@selfish.org>) id 1JCI2i-0007X0-QW
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jan 2008 18:15:12 +0100
Received: from dsl-62-220-14-162.berlikomm.net ([62.220.14.162]
	helo=abughraib.localdomain) by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1JCHvx-0004G5-2u
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jan 2008 18:08:13 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 8 Jan 2008 18:08:13 +0100
User-Agent: KMail/1.9.6 (enterprise 0.20071204.744707)
References: <47836C9B.3000407@gmx.net> <200801081527.09859.zecke@selfish.org>
	<1199804390.30486.28.camel@hammer.suse.cz>
In-Reply-To: <1199804390.30486.28.camel@hammer.suse.cz>
MIME-Version: 1.0
Message-Id: <200801081808.13174.zecke@selfish.org>
Subject: Re: RFC: add osso version of libtool and libatk
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Jan 2008 17:15:13 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday 08 January 2008 15:59:50 Stanislav Brabec wrote:
> Can you tell me what is the purpose of this patch? I looked into 15000
> lines of the atk patch and cannot find any single change except adding
> debian directory (not needed for OE) and modifying or adding of
> auto-generated files (documentation, config.* and marshalls).
>
> I am not able to find any single change in the code.

I briefly talked with Robert on IRC. The requirement is not to use the osso 
variant but the upstream version. For libtool this is 1.5.6 and for atk 
probably the same applies.

My conclusion is there is nothing wrong with (re)adding the versions with a 
DEFAULT_PREFERENCE="-1" and I asked him to proceed.

z.


