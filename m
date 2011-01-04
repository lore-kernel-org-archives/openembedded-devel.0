Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpurdie@rpsys.net>) id 1PaG99-0003iW-8g
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 00:18:31 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p04NI7t5004050;
	Tue, 4 Jan 2011 23:18:07 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03934-04; Tue,  4 Jan 2011 23:18:03 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p04NI0uC004044
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 4 Jan 2011 23:18:00 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Otavio Salvador <otavio@ossystems.com.br>
In-Reply-To: <AANLkTin0O_GYVLqi5=Q3VmLZXJPufoPmH+WgcFHSEY8Z@mail.gmail.com>
References: <1293763348.17519.11220.camel@rex>
	<1293805474.18787.366.camel@eha> <1293911357.17519.17117.camel@rex>
	<AANLkTi=YuEBqPtCGnutaW_-JF0F=ZwmT8OS8rCmr9886@mail.gmail.com>
	<1294155569.17519.21577.camel@rex>
	<AANLkTin0O_GYVLqi5=Q3VmLZXJPufoPmH+WgcFHSEY8Z@mail.gmail.com>
Date: Tue, 04 Jan 2011 23:17:43 +0000
Message-ID: <1294183063.17519.22104.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Chris Larson <clarson@kergoth.com>,
	bitbake-dev <bitbake-dev@lists.berlios.de>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [Bitbake-dev] Bitbake Architecture, Roadmap, Maintainers and the future
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
X-List-Received-Date: Tue, 04 Jan 2011 23:18:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-01-04 at 15:00 -0200, Otavio Salvador wrote:
> On Tue, Jan 4, 2011 at 13:39, Richard Purdie <rpurdie@rpsys.net> wrote:
> ...
> > This kind of response from you is frustrating. Trying to ask any
> > question results in a response like this and I don't think its
> > productive or helpful.
> 
> Can we try to get something done instead of this useless type of discussion?

I really don't know what Chris is/isn't prepared to do in future to
ensure this doesn't happen again but I'm doing what I can in that
regard.

I'm pleased to report Poky's copy of bitbake is now much more in sync
with bitbake master as of earlier today. This has resulted in some
issues for Poky but thats life and we're working through them, its not a
problem.

I've asked Chris what the status of his poky-sync branch is and assuming
some further testing pans out I think that will get merged into bitbake
master soon.

This leaves some small details to sort out as I think there are still
some tweaks bitbake upsteam needs from Poky. I'm trying to work out
those details and will follow up in other emails. I've already started
some of the discussion in the logging thread for one of the areas there
are differences in approach.

I'm also going to look at getting back the XMLRPC interfaces and
abstraction that the removal of triggered this discussion. There does
appear to be some differences in opinion on the future of bitbake from
the server/UI perspective and I will do what I can to ensure we all have
common goals.

I've also agreed that I'm going to pay close attention to the
bitbake-dev list. I've asked that any major roadmap/architecture changes
do get discussed there.

Cheers,

Richard








