Received: from [206.46.173.13] (helo=vms173013pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MQQrL-0001nS-Cu
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Jul 2009 21:06:43 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KMQ00FKBHRZN4B0@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	13 Jul 2009 13:53:00 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C8EA614AF5F; Mon,
	13 Jul 2009 14:52:46 -0400 (EDT)
Date: Mon, 13 Jul 2009 14:52:46 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090713185246.GB8275@denix.org>
References: <E1MQNDW-0007ur-Rm@melo.openembedded.org>
	<200907132005.09088.marcin@juszkiewicz.com.pl>
MIME-version: 1.0
In-reply-to: <200907132005.09088.marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [oe-commits] Marco Cavallini : Added linux version	recipes/linux/linux-2.6. 29 for taskit Stamp9G20 Evaluation Board
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
X-List-Received-Date: Mon, 13 Jul 2009 19:06:43 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Jul 13, 2009 at 08:05:08PM +0200, Marcin Juszkiewicz wrote:
> Dnia poniedzia??ek, 13 lipca 2009 o 17:13:22 git version control 
> napisa??(a):
> 
> Please read CommitPolicy in wiki - first line of commit is summary and 
> should fit in 7x chars (weekly changelog script cuts at 78 chars) and 
> next lines are used for description. Also those two changes should be 
> squashed into one ("git rebase -i origin" would be useful command for 
> next patch set).

Aren't policies required to be read by new developers when git access is 
granted? There used to be a welcome message sent by Mickey with helpful links 
to the Wiki. Is it still the case? Just wondering...

-- 
Denys


