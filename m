Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1KVibd-00020N-M9
	for openembedded-devel@openembedded.org; Wed, 20 Aug 2008 09:59:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m7K7wjne009981
	for <openembedded-devel@openembedded.org>;
	Wed, 20 Aug 2008 08:58:45 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09835-04 for <openembedded-devel@openembedded.org>;
	Wed, 20 Aug 2008 08:58:33 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m7K7wTYg009969
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Wed, 20 Aug 2008 08:58:29 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <g8gej0$i1l$1@ger.gmane.org>
References: <20080819235307.DD481188083@amethyst.openembedded.net>
	<g8fp0e$upk$1@ger.gmane.org>  <g8gej0$i1l$1@ger.gmane.org>
Date: Wed, 20 Aug 2008 08:58:28 +0100
Message-Id: <1219219108.5479.0.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: : gnash-minimal: Add libltdl DEPENDS.
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
X-List-Received-Date: Wed, 20 Aug 2008 07:59:50 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Wed, 2008-08-20 at 08:45 +0200, Koen Kooi wrote:
> Rolf Leggewie wrote:
> > OE GIT Trial wrote:
> >> Author: <likewise@openembedded.org>
> > [...]
> >> gnash-minimal: Add libltdl DEPENDS.
> >
> > That would be OK, I guess, if we had libltdl in OE, but we don't. So
> > right now, it breaks.
> 
> We do have libltdl in OE, it's part of libtool

It should be a DEPENDS = "libtool"...

Cheers,

Richard



