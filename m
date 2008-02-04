Received: from [72.29.79.205] (helo=rhodos.klever.net)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <hacker@klever.net>) id 1JLyy7-0001w8-SO
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2008 11:54:32 +0100
Received: from pd953ae3a.dip0.t-ipconnect.de ([217.83.174.58]
	helo=[192.168.4.12])
	by rhodos.klever.net with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.67) (envelope-from <hacker@klever.net>) id 1JLyx8-0001SE-4t
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2008 11:53:30 +0100
Message-ID: <47A6F060.9020905@klever.net>
Date: Mon, 04 Feb 2008 12:00:48 +0100
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 2.0.0.9 (X11/20071202)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1201823499.20311.26.camel@localhost.localdomain>	<20080203210353.438dffaf@cimmeria>	<47A6D3C2.10304@kernelconcepts.de>
	<47A6D6E6.4030700@whitby.id.au> <20080204095236.28687b4a@cimmeria>
In-Reply-To: <20080204095236.28687b4a@cimmeria>
Subject: Re: Monotone issues
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
X-List-Received-Date: Mon, 04 Feb 2008 10:54:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

>>
> Well something I wondered about in my sleep is can zecke's mtn->git
> script work both ways. Then we don't have to change SCM in one
> nasty leap. We can run both in parallel for a while and when the
> traffic on mtn ceases (if it does) terminate that.
> 

I think this sounds like an option. As I grew frustrated with monotone I
was going to develop tool like that (akin to git-svn) a while ago, but I
only more or less got mtn->git direction to work which also preserves
mtn revisions in comments and then got distracted by other things...

Love,
H


