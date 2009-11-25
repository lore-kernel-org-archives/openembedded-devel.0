Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NDJJx-000590-Da
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Nov 2009 15:58:20 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nAPErS2R004295 for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Nov 2009 14:53:28 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id cOenOpmMfc-S
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Nov 2009 14:53:28 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nAPErO2v004275
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Nov 2009 14:53:26 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ac9c93b10911200613u538b43berf63c36cea61cdfb3@mail.gmail.com>
References: <1258645184.5229.46.camel@dax.rpnet.com>
	<ac9c93b10911200613u538b43berf63c36cea61cdfb3@mail.gmail.com>
Date: Wed, 25 Nov 2009 14:56:57 +0000
Message-Id: <1259161017.10321.207.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OE.dev staging changes - Progress so far
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
X-List-Received-Date: Wed, 25 Nov 2009 14:58:20 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-11-20 at 15:13 +0100, Frans Meulenbroeks wrote:
> 2009/11/19 Richard Purdie <rpurdie@rpsys.net>:
> > So to summarise, the list of tasks remaining is therefore:
> >
> > a) Generate a list of recipes using legacy staging during parsing and
> >   save it into tmp?
> > b) Start to convert recipes to use do_install for staging. Poky has
> >   many examples.
> > c) Start to add BBCLASSEXTEND = "native" to recipes
> > d) Start to add BBCLASSEXTEND = "nativesdk" to recipes
> > e) Port the "do_populate_staging" to "do_populate_sysroot" change from
> >   Poky to OE.dev
> > f) Enable packaged staging as default.
>
> Richard, I'm more than happy to convert/update some of the recipes
> (e.g. the ones I've worked on in the past), but I would appreciate it
> if you could point me to one or two specific examples (to avoid the
> case that I pick one which is not the best).

I can't really give specific advice on this, just pick something and see
how it goes. If its also in Poky, look there to see how the conversion
was made.

If you have any questions or want me to work through some examples, just
pick them and I'll do so on the list here...

Cheers,

Richard



