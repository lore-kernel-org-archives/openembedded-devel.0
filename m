Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MlKkO-0000Pi-Jq
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Sep 2009 12:49:59 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MlKjz-000783-UE
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Sep 2009 11:49:32 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1MlKjz-0006Qs-MD
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Sep 2009 11:49:31 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4AA758CC.7030505@gmail.com>
References: <4AA758CC.7030505@gmail.com>
Date: Wed, 09 Sep 2009 11:49:27 +0100
Message-Id: <1252493367.27780.741.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Fix netsurf touchscreen behaviour.
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
X-List-Received-Date: Wed, 09 Sep 2009 10:49:59 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-09-09 at 16:57 +0930, Graham Gower wrote:
> As per http://vlists.pepperfish.net/pipermail/netsurf-dev-netsurf-browser.org/2009-September/001588.html

Is this damaging for non-touchscreen users?  It wasn't completely
obvious to me from the patch what effect it would have in that case.

p.




