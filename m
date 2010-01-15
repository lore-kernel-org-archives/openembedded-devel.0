Received: from vms173015pub.verizon.net ([206.46.173.15])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NVbFC-0003Za-Au
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 02:45:01 +0100
Received: from gandalf.denix.org ([unknown] [71.255.235.232])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KW900B0IM2LRWA0@vms173015.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	14 Jan 2010 19:42:22 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 64D3714AF60; Thu,
	14 Jan 2010 20:42:21 -0500 (EST)
Date: Thu, 14 Jan 2010 20:42:21 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100115014221.GA9872@denix.org>
References: <1263421337.3575.3.camel@dax.rpnet.com>
	<ac9c93b11001140102j36e07ca9u7cb9ddc5a9770cd4@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <ac9c93b11001140102j36e07ca9u7cb9ddc5a9770cd4@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.15
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: TSC Meeting 7/1/2010
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
X-List-Received-Date: Fri, 15 Jan 2010 01:45:01 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jan 14, 2010 at 10:02:57AM +0100, Frans Meulenbroeks wrote:
> I suggest to review the rules;. E.g. this one:
> # This should all be on one line and you should leave an empty line
> before any detailed commit information.
> Nice, but if you use git commit and enter your message empty lines are removed.

Not really. "git format-patch" and "git am" use the empty line separation to 
determine, what becomes patch subject and what is patch description in the 
body. So, the above rule/requirement is very correct. More on the topic:

http://progit.org/book/ch5-2.html#commit_guidelines

-- 
Denys


