Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RUyaO-0000fe-Ib
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 11:37:20 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RUyU1-00072n-2T
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 11:30:45 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Nov 2011 10:30:44 +0000
In-Reply-To: <CA+M6bX=PYZ+2vb32ZmT3SirqHdKpCtD90QqtHhQiWSp38f1kVA@mail.gmail.com>
References: <CA+M6bX=PYZ+2vb32ZmT3SirqHdKpCtD90QqtHhQiWSp38f1kVA@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1322476245.26081.89.camel@phil-desktop>
Mime-Version: 1.0
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
X-List-Received-Date: Mon, 28 Nov 2011 10:37:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-11-26 at 19:40 -0700, Tom Rini wrote:
> As things stand today, the wiki is out of date and a number of folks
> refuse to work on it.  Using things like "It's all text!" for firefox
> only go so far and don't solve problems like people just avoiding
> documentation anyhow.
> 
> Paul Menzel has mentioned that ikiwiki has been mentioned before and
> that lets us have the website in a repository.  Do folks have other
> ideas?

I guess it depends what documentation you are thinking of exactly.

Bitbake and oe-classic both have their own user manuals written in
Docbook.  I think Poky has something similar which might be more or less
directly applicable to oe-core.  If the objective is to create a high
quality user guide then I think that starting from some combination of
these (and continuing in the same format) is probably the right
approach.

It would be fairly straightforward (modulo TSC regulatory requirements)
to set up a git repository on oe.org to hold the documentation and
arrange for interested folks to have write access to it.  

p.



