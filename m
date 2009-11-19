Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NB8cp-0000QM-Oy
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 16:08:50 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nAJF4Atu013935 for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2009 15:04:10 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mGr4zqAcQH+L
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2009 15:04:10 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nAJF44Fm013922
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2009 15:04:05 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4B055989.4030407@balister.org>
References: <be7a9f3d0911181211s614defeaq5a49ca33c3691c50@mail.gmail.com>
	<1258576924.25369.687.camel@lenovo.internal.reciva.com>
	<be7a9f3d0911181421i4d3a1ffy2417cbbd91d9a1ff@mail.gmail.com>
	<1258631715.23826.63.camel@mill.internal.reciva.com>
	<be7a9f3d0911190542j2bea66ccs65d6261b9c92bf87@mail.gmail.com>
	<1258638762.23826.90.camel@mill.internal.reciva.com>
	<alpine.LFD.2.00.0911190909260.5078@localhost>
	<4B055989.4030407@balister.org>
Date: Thu, 19 Nov 2009 15:06:58 +0000
Message-Id: <1258643218.5229.35.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] Merging of stable/2009 into dev
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
X-List-Received-Date: Thu, 19 Nov 2009 15:08:51 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-11-19 at 09:43 -0500, Philip Balister wrote:
> Basically, the users define a release. From the discussion at OEDEM it 
> is clear that there groups of people with similar (but very different 
> needs).
> 
> I don't see a problem with groups of people getting together and 
> defining a workflow for a branch they maintain. There is more than one 
> right way to do this.

Totally agreed. The people who want to make a given branch happen just
need to step up, agree an objective for the branch (preferably a
documented one) and then go for it.

The problem is there are many definitions of "stable" from "massive
security fixes only" to "everything in .dev after two weeks and nobody's
noticed a problem".

Cheers,

Richard



