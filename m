Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MbweX-0002vl-EC
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Aug 2009 15:17:05 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1MbwOL-0007i9-EP; Fri, 14 Aug 2009 14:00:23 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>)
	id 1MbwOL-0008IW-44; Fri, 14 Aug 2009 14:00:21 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org,
	Rolf Leggewie <oe-devel@rolf.leggewie.biz>
In-Reply-To: <200908130346.22163.holger+oe@freyther.de>
References: <1250114333-22259-1-git-send-email-oe-devel@rolf.leggewie.biz>
	<200908130346.22163.holger+oe@freyther.de>
Date: Fri, 14 Aug 2009 14:00:17 +0100
Message-Id: <1250254817.12282.1231.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
Subject: Re: [PATCH] base.bbclass: ftp.matrix.com.br no longer exists
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
X-List-Received-Date: Fri, 14 Aug 2009 13:17:05 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-08-13 at 03:46 +0200, Holger Hans Peter Freyther wrote:
> On Wednesday 12 August 2009 23:58:53 Rolf Leggewie wrote:
> > ---
> 
> Signed-off-by:  Rolf Leggewie <oe-devel@rolf.leggewie.biz>
> Acked-By: Holger Freyther <zecke@selfish.org>

Acked-by: Phil Blundell <philb@gnu.org>

> 
> 
> >  classes/base.bbclass |    1 -
> >  1 files changed, 0 insertions(+), 1 deletions(-)
> >
> > diff --git a/classes/base.bbclass b/classes/base.bbclass
> > index ef6c0ab..5363e5c 100644
> > --- a/classes/base.bbclass
> > +++ b/classes/base.bbclass
> > @@ -1279,7 +1279,6 @@ ${DEBIAN_MIRROR}	ftp://ftp.es.debian.org/debian/pool
> >  ${DEBIAN_MIRROR}	ftp://ftp.se.debian.org/debian/pool
> >  ${DEBIAN_MIRROR}	ftp://ftp.tr.debian.org/debian/pool
> >  ${GNU_MIRROR}	ftp://mirrors.kernel.org/gnu
> > -${GNU_MIRROR}	ftp://ftp.matrix.com.br/pub/gnu
> >  ${GNU_MIRROR}	ftp://ftp.cs.ubc.ca/mirror2/gnu
> >  ${GNU_MIRROR}	ftp://sunsite.ust.hk/pub/gnu
> >  ${GNU_MIRROR}	ftp://ftp.ayamura.org/pub/gnu
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



