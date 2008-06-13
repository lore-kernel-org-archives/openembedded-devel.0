Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1K74WH-00080Q-Sx
	for openembedded-devel@openembedded.org; Fri, 13 Jun 2008 10:20:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m5D8KHWG013884
	for <openembedded-devel@openembedded.org>;
	Fri, 13 Jun 2008 09:20:17 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13645-07 for <openembedded-devel@openembedded.org>;
	Fri, 13 Jun 2008 09:20:06 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m5D8K2Cc013875
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Fri, 13 Jun 2008 09:20:02 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Fri, 13 Jun 2008 09:20:01 +0100
Message-Id: <1213345201.13942.3.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Switching SCM to git and commit/review policy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 13 Jun 2008 08:20:27 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

After much discussion the OE core team unanimously agree that a change
of SCM to git would be in the best interests of the project. The main
reasons for this are:

* more powerful merging/branching capabilities in git
* better web facilities to browse changes
* better performance
* larger and more active userbase
* lack of developer momentum with monotone

There has been discussion about this on the developers list in the past
where most viewpoints were well represented and we don't really feel
that opening the choice of SCM for further discussion would be
beneficial although obviously anyone is free to raise serious objections
to this.

As always, there is a but. This change is conditional on being able to
come up with a sensible commit and review policy for OE.dev. The core
team does feel that the metadata quality has dropped over time in some
areas and we need to have a better review process. The change to an SCM
with good branch support is a vital part of this but not the only part.

We've not made any decisions on what the commit/review policy should be,
this is open for discussion. We're thinking it may take the form of some
kind of kernel style Signed-off-by: tags and a switch to a partially
pull based model rather than just push based as we use monotone so more
than one developer handles any given change.

The timescales for switching are not yet established and whilst we have
some server infrastructure in place, its not all there yet. Lets starts
the discussion on commit and review policy and in the meantime we'll
establish some timescales. I'd expect we'll aim to switch quite quickly
now the hard decision is made.

Finally, we'd like to mention that whilst some people have had issues
with it, on balance, monotone has served us well and want to thank the
monotone guys for the help and support they've given us.

The OE Core Team




