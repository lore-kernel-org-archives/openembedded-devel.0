Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by mail.openembedded.org (Postfix) with ESMTP id 8684573192
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 May 2016 17:29:02 +0000 (UTC)
Received: from vz-proxy-l005.mx.aol.com ([64.236.82.152])
	by vms173009.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6P00HTYSJXXQ30@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	05 May 2016 12:28:45 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=kj9zAlcOel0A:10 a=yrkiwgmsf1kA:10	a=FR1V4JgqPxpdj2mXje8A:9
	a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 154ab675; Thu, 05 May 2016 17:28:45 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id BB885161FEC; Thu,
	5 May 2016 13:28:44 -0400 (EDT)
Date: Thu, 05 May 2016 13:28:44 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20160505172844.GH27602@denix.org>
References: <20160505171932.GG27602@denix.org>
MIME-version: 1.0
In-reply-to: <20160505171932.GG27602@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: meta-oe krogoth release
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 May 2016 17:29:04 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, May 05, 2016 at 01:19:32PM -0400, Denys Dmytriyenko wrote:
> Armin, et al,
> 
> What's the deal with meta-oe branching into krogoth way too early (April 12th 
> pretty much) and missing on many updates and fixes that went in to master last 
> couple of weeks (delayed due to Martin's well deserved absence at the time) 
> before the actual release of OE-Core last Thursday? I was hoping there would 
> be a global merge/rebase from master to krogoth at the time of release, but it 
> doesn't seem to be the case. It would be a shame if those were missed from 
> krogoth... Are there any plans to pick them up?

BTW, I do see your past pull request "attempts" (May 2, April 28) on the list, 
but they don't seem to be pushed. I guess I should re-phrase my question - do 
you plan to push the latest pull request and what is the ETA? Thanks!

-- 
Denys

