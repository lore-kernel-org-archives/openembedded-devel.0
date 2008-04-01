Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JgnOw-0001GR-EO
	for openembedded-devel@openembedded.org; Tue, 01 Apr 2008 22:48:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m31KmELv019090
	for <openembedded-devel@openembedded.org>;
	Tue, 1 Apr 2008 21:48:14 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18748-08 for <openembedded-devel@openembedded.org>;
	Tue,  1 Apr 2008 21:48:10 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m31Km8Vi019084
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 1 Apr 2008 21:48:08 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <47F25AAA.8020705@gmx.net>
References: <200803310907.56781.e.robertson.svg@gmail.com>
	<200803311101.39141.geoffrey@pager.net>
	<200804010840.42271.openembedded@haerwu.biz> <47F25AAA.8020705@gmx.net>
Date: Tue, 01 Apr 2008 21:48:09 +0100
Message-Id: <1207082889.4916.25.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: OE Manual: License change?
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
X-List-Received-Date: Tue, 01 Apr 2008 20:48:14 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2008-04-01 at 17:54 +0200, Robert Schuster wrote:
> Marcin Juszkiewicz schrieb:
> > OpenEmbedded documentation use "Creative Commons Attribution License 2.0", 
> > Poky Handbook use "Creative Commons Attribution Non-Commercial Share 
> > Alike 2.0" license. Copying from Poky Handbook to OpenEmbedded manual 
> > require change on OE doc license to CC-NC-SA.
> > 
> > I vote for changing OE manual license to CC-NC-SA as there is lot of good 
> > stuff in Poky handbook which would be nice to have also in OE manual.
> OMG not any of these broken *-NC licenses. ;)

Why 'broken'? What does it stop you doing which you want to do?

> A manual is a functional work and therefore should IMHO not restrict the
> uses.
> 
> Any chance of changing poky manual's license to something less
> restrictive? CC-BY-SA/CC-BY preferably?

Not really. We went around in circles with the manual licence and on the
one hand we want it open, we want people to be able to make changes and
we want it to be useful for everyone. How you protect work invested in
something like Poky is very tricky however, particularly when we're keen
on giving back to the community. At the end of the day, Poky is
commercial to some degree and what we don't want is someone to rebadge
Poky and its manual and then make money on the result and this approach
gives us some protection.

I'm relatively happy with the outcome and whilst its a shame the
licenses aren't compatible, I don't think this will be too much of an
issue. People are free to submit to one, the other or both and may the
best manual win :) Don't underestimate the amount of work involved in
writing these things...

For the record I personally don't think -NC is appropriate for OE's
manual.

Cheers,

Richard




