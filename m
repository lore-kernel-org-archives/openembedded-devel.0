Received: from vms173001pub.verizon.net ([206.46.173.1]
	helo=vms173001.mailsrvcs.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NFN8T-0005Sv-44
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Dec 2009 08:27:00 +0100
Received: from gandalf.denix.org ([unknown] [71.251.63.147])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KTY00BGFPY90TA2@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	01 Dec 2009 01:25:22 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 2B6A014AF60; Tue,
	01 Dec 2009 02:25:21 -0500 (EST)
Date: Tue, 01 Dec 2009 02:25:21 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20091201072521.GA11505@denix.org>
References: <4B14BAD9.2060402@fqingenieria.es>
MIME-version: 1.0
In-reply-to: <4B14BAD9.2060402@fqingenieria.es>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.1
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Recipes relation tree
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
X-List-Received-Date: Tue, 01 Dec 2009 07:27:00 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Dec 01, 2009 at 07:42:33AM +0100, FQ | Jaume Ribot wrote:
> Hi all,
>
> Is there any way to obtain a kind of visual "dependency tree" between 
> recipes? Sometimes is dificult to follow-up dependencies, when rebuilding 
> individual packages.

Have you looked at -g option of bitbake?

  -g, --graphviz        emit the dependency trees of the specified packages in
                        the dot syntax

-- 
Denys


