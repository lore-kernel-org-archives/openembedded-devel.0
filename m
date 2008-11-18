Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1L2XxS-0006C6-Cc
	for openembedded-devel@openembedded.org; Tue, 18 Nov 2008 22:18:02 +0100
Received: from gandalf.denix.org ([71.255.226.167]) by vms173001.mailsrvcs.net
	(Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
	with ESMTPA id <0KAJ00II6SDG2WE9@vms173001.mailsrvcs.net> for
	openembedded-devel@openembedded.org;
	Tue, 18 Nov 2008 15:15:18 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 1D62A6B83A8; Tue,
	18 Nov 2008 16:15:16 -0500 (EST)
Date: Tue, 18 Nov 2008 16:15:16 -0500
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <gfumd6$ki2$1@ger.gmane.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20081118211515.GA12210@denix.org>
MIME-version: 1.0
References: <20081115005654.GA20517@denix.org> <gfumd6$ki2$1@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] Update git/git-native
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
X-List-Received-Date: Tue, 18 Nov 2008 21:18:02 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Nov 18, 2008 at 04:19:02PM +0100, Koen Kooi wrote:
> git (for the target) fails to build for arm: 
> http://tinderbox.openembedded.net/packages/233747/
>
> could you have a look at it?

Sorry for that. Fixed in 46e30ed6ebb1a872f919363c6ff047344049079c

-- 
Denys


