Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NBRef-0000pu-MU
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 12:28:01 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NBRdF-00029e-FS
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 11:26:29 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NBRdE-0007Ue-Na
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 11:26:28 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4B067785.50600@SSpaeth.de>
References: <4B067785.50600@SSpaeth.de>
Date: Fri, 20 Nov 2009 11:26:24 +0000
Message-Id: <1258716384.23826.139.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [Fwd: [Shr-Devel] [PATCH] ILLUME_CONFIG is now also set by a variable]
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
X-List-Received-Date: Fri, 20 Nov 2009 11:28:01 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-11-20 at 12:03 +0100, Sebastian Spaeth wrote:
> See attached patch. We'd love to replace the default illume config with
> our distro-specific version, so this will make the config RDEPENDS
> overridable from our distro conf. Is such a change acceptable for OE?

Yes, that looks fine.  If ${ILLUME_THEME} is already overridable then I
can't see any reason why you shouldn't do the same with the config
package.

p.




