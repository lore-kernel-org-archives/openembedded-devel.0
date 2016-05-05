Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by mail.openembedded.org (Postfix) with ESMTP id 39920602D9
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 May 2016 17:19:48 +0000 (UTC)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.151])
	by vms173007.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6P00M8LS4LXLA0@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	05 May 2016 12:19:33 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=eaPqxu9IKnv3tbb7QsXVMw==:117
	a=kj9zAlcOel0A:10 a=yrkiwgmsf1kA:10	a=2A-9sLhQ46OsIDuYepEA:9
	a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 0e5d7e91; Thu, 05 May 2016 17:19:33 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0CF5A161FEC; Thu,
	5 May 2016 13:19:33 -0400 (EDT)
Date: Thu, 05 May 2016 13:19:32 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20160505171932.GG27602@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: meta-oe krogoth release
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
X-List-Received-Date: Thu, 05 May 2016 17:19:50 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Armin, et al,

What's the deal with meta-oe branching into krogoth way too early (April 12th 
pretty much) and missing on many updates and fixes that went in to master last 
couple of weeks (delayed due to Martin's well deserved absence at the time) 
before the actual release of OE-Core last Thursday? I was hoping there would 
be a global merge/rebase from master to krogoth at the time of release, but it 
doesn't seem to be the case. It would be a shame if those were missed from 
krogoth... Are there any plans to pick them up?

-- 
Denys

