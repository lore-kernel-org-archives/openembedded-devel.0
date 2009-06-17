Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MGx4r-00088D-Li
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Jun 2009 17:29:38 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MGwui-0004Ku-JN
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Jun 2009 16:19:03 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1MGwui-0003ej-BR
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Jun 2009 16:19:00 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <h1b0c2$va$1@ger.gmane.org>
References: <1245248446.15129.1.camel@mill.internal.reciva.com>
	<h1b0c2$va$1@ger.gmane.org>
Date: Wed, 17 Jun 2009 16:18:55 +0100
Message-Id: <1245251936.15129.7.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.2 
Subject: Re: rfc: delete flow-lossage.bbclass
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
X-List-Received-Date: Wed, 17 Jun 2009 15:29:46 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-06-17 at 16:59 +0200, Koen Kooi wrote:
> On 17-06-09 16:20, Phil Blundell wrote:
> > I think this class has probably outlived its usefulness and I propose to
> > delete it.  Any objections?
> 
> There are still recipes using it, are you going to fix those as well?

Depends what you mean by "fix".  I would remove "inherit flow-lossage"
from the recipes in question, obviously, but I don't plan to do any more
than that.

p.




