Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1S50JD-0007Oi-A1
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2012 20:44:31 +0100
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M0H00DUA7H0ZZW0@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	06 Mar 2012 12:31:49 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5D81120272; Tue,
	06 Mar 2012 13:31:47 -0500 (EST)
Date: Tue, 06 Mar 2012 13:31:47 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20120306183147.GC3781@denix.org>
References: <0C757E680E33864AB113392C7E83F910BE52CF@GSX300A.mxchg.m.corp>
	<20120305225422.GD2030@denix.org>
	<0C757E680E33864AB113392C7E83F910BE52D2@GSX300A.mxchg.m.corp>
MIME-version: 1.0
In-reply-to: <0C757E680E33864AB113392C7E83F910BE52D2@GSX300A.mxchg.m.corp>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Disable GNU Hash check ?
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
X-List-Received-Date: Tue, 06 Mar 2012 19:44:31 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Mar 06, 2012 at 11:08:18AM +0100, Hauser, Wolfgang (external) wrote:
> 
> >> INSANE_SKIP_${PN} = "True"
> 
> >> -- 
> >> Denys
> 
> Thanks for that hint, but it is 
> 
> INSANE_SKIP_${PN} = True
> INSANE_SKIP_${PN}-dev = True
> INSANE_SKIP_${PN}-dbg = True
> 
> That solves the problem.

"Adjust accordingly" always applies. :)

-- 
Denys


