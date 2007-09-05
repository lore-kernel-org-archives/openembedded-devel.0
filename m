Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IT0xr-0006ym-6G
	for openembedded-devel@openembedded.org; Wed, 05 Sep 2007 21:55:03 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l85JqYLf020187
	for <openembedded-devel@openembedded.org>;
	Wed, 5 Sep 2007 20:52:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20005-03 for <openembedded-devel@openembedded.org>;
	Wed,  5 Sep 2007 20:52:27 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l85JqMlL020159
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Wed, 5 Sep 2007 20:52:22 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1434447296.20070905205215@vanille-media.de>
References: <20070904202957.GD1429@dodger.lab.datenfreihafen.org>
	<1189011486.7849.35.camel@localhost.localdomain>
	<46DEE9E3.4080206@student.utwente.nl>
	<1434447296.20070905205215@vanille-media.de>
Date: Wed, 05 Sep 2007 20:52:21 +0100
Message-Id: <1189021941.7849.46.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] How to handle external kernel patches in oe the	right way?
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
X-List-Received-Date: Wed, 05 Sep 2007 19:55:03 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2007-09-05 at 20:52 +0200, Dr. Michael Lauer wrote:
> Koen Kooi wrote:
> > Richard Purdie schreef:
> > I'm having issues with crap like do_prepatch. Patches are only
> applied by patch.bbclass,
> > not some hand written voodoo <period>.
> 
> Very well. If it annoys you so much, feel free to enhance patch.bbclass to
> deal with upstream series files while retaining OE-added patches to it.
> 
> Until then, I think we shouldn't make life more complicated for the
> actual upstream developers just because of going a bit too far wrt. to
> our principles.

I'm afraid I'm with Mickey here. I don't like the way this "prepatching"
works and I think its pretty ugly but I can understand why people are
doing it. I'd like to see a better solution but until then what they're
doing allows them to develop effectively which is what we're supposed to
be about.

Cheers,

Richard





