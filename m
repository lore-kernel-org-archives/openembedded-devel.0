Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RUzAW-0002RG-N4 for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 12:14:40 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pASB80ND031204;
	Mon, 28 Nov 2011 11:08:00 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30843-04; Mon, 28 Nov 2011 11:07:56 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pASB7orB031198
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 28 Nov 2011 11:07:52 GMT
Message-ID: <1322478479.26287.15.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Nov 2011 11:07:59 +0000
In-Reply-To: <1322476245.26081.89.camel@phil-desktop>
References: <CA+M6bX=PYZ+2vb32ZmT3SirqHdKpCtD90QqtHhQiWSp38f1kVA@mail.gmail.com>
	<1322476245.26081.89.camel@phil-desktop>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "Rifenbark, Scott M" <scott.m.rifenbark@intel.com>
Subject: Re: Documentation problems
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
X-List-Received-Date: Mon, 28 Nov 2011 11:14:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-11-28 at 10:30 +0000, Phil Blundell wrote:
> On Sat, 2011-11-26 at 19:40 -0700, Tom Rini wrote:
> > As things stand today, the wiki is out of date and a number of folks
> > refuse to work on it.  Using things like "It's all text!" for firefox
> > only go so far and don't solve problems like people just avoiding
> > documentation anyhow.
> > 
> > Paul Menzel has mentioned that ikiwiki has been mentioned before and
> > that lets us have the website in a repository.  Do folks have other
> > ideasPeople could even contribute to those pieces of documentation?
> 
> I guess it depends what documentation you are thinking of exactly.
> 
> Bitbake and oe-classic both have their own user manuals written in
> Docbook.  I think Poky has something similar which might be more or less
> directly applicable to oe-core.  If the objective is to create a high
> quality user guide then I think that starting from some combination of
> these (and continuing in the same format) is probably the right
> approach.

The Yocto documentation effortI'd really love it if we could find a way
for OE and Yocto to share the documentation.
 is aiming at a kind of "bookshelf" approach so that there are manuals
for different parts of the system. 

Yocto has a tech writer dedicated to working on the docs (cc'd, hi
Scott). He's sometimes not able to directly write the deeply technical
content but he is more than happy to take contributions to the manuals
and edit them together to ensure consistent style, ordering and indexing
and so forth. 

We've had a few challenges in finding ways for Scott to be able to work
on docs in an "open source" way using git+docbook as its a little
different from some of his previous work but we're getting there. This
is one of the reasons we have the docs repository separate at the moment
since it simplifies some of Scott's work.

Rather than fork off the Yocto docs for OE's needs, it would be nice to
see if there was a way we could share the documentation.

Cheers,

Richard






