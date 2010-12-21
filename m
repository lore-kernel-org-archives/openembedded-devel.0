Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1PVANC-0005A4-Gi
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 23:07:58 +0100
Received: from gandalf.denix.org ([unknown] [71.255.236.20])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LDS007XYTGN8XJ1@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	21 Dec 2010 16:07:41 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 31AA814AF64; Tue,
	21 Dec 2010 17:07:35 -0500 (EST)
Date: Tue, 21 Dec 2010 17:07:35 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101221220735.GE19986@denix.org>
References: <20101221220041.GD19986@denix.org>
MIME-version: 1.0
In-reply-to: <20101221220041.GD19986@denix.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: base.bbclass changes broke BitBake 1.8.19
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
X-List-Received-Date: Tue, 21 Dec 2010 22:07:58 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Dec 21, 2010 at 05:00:41PM -0500, Denys Dmytriyenko wrote:
> Chris,
> 
> The c67b95955d023c1f198531b4f06100a40b05efa7 has introduced the following 
> problem with BitBake 1.8.19 and even af81d52e48cb6d4f91fff0c70e09dfd421e0057d 
> didn't fix it. Any thoughts? Thanks.

As discussed on IRC, the proper fix was pushed to BitBake. Thanks!

-- 
Denys


