Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1LmUJC-0002IN-Nf
	for openembedded-devel@openembedded.org; Wed, 25 Mar 2009 15:42:22 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n2PEejCB011292;
	Wed, 25 Mar 2009 14:40:45 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10760-10; Wed, 25 Mar 2009 14:40:41 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n2PEebt3011286
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 25 Mar 2009 14:40:37 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Holger Schurig <hs4233@mail.mn-solutions.de>
In-Reply-To: <200903251516.44480.hs4233@mail.mn-solutions.de>
References: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>
	<gqd31s$5vk$1@ger.gmane.org> <1237988215.5328.40.camel@dax.rpnet.com>
	<200903251516.44480.hs4233@mail.mn-solutions.de>
Date: Wed, 25 Mar 2009 14:40:59 +0000
Message-Id: <1237992059.5328.43.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@openembedded.org
Subject: Re: Package Maintenance
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
X-List-Received-Date: Wed, 25 Mar 2009 14:42:23 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Wed, 2009-03-25 at 15:16 +0100, Holger Schurig wrote:
> > * Who maintains file X (be it a class/recipe/conf/sitefile
> > etc)? * Who last changed file X?
> > * Who are the contributors to file X?
> > * Can we easily create a subset of the metadata which is
> > "maintained"?
> 
> I don't really think that -- in the general case -- maintaining 
> maintainers on a per-file or per-recipe basis works for the 
> recipes. There are just too many.
> 
> But maybe maintainership based on categories make sense.
> 
> * all cross-compilation and build tools
> * all Java stuff
> * all Python stuff
> * all matchbox stuff
> * all KDE stuff
> * all OPIE stuff
> * (more categories that are easily identifiable and make sense)
> * the "pool" :-)
> 
> The point is: a package that is in the python category could 
> easily be in Mickey scope of interest anyway. Similar for other 
> categories. There's no exact match, but still a high degree of 
> correlation.
> 
> Now it's easy to say "John Doe is our Java guy". And John could 
> of course have sub-maintainers.

I agree. The current Maintainers file tried to capture this with the use
of wildcards which allows some improvements over per recipe but is far
from perfect. Better solutions welcome :)

Cheers,

Richard



