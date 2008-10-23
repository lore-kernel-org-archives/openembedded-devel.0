Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Kt9Jm-0002LQ-Hq
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Oct 2008 01:10:14 +0200
Received: from gandalf.denix.org ([71.255.247.239]) by vms173005.mailsrvcs.net
	(Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
	with ESMTPA id <0K9700EPASBSBYL0@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	23 Oct 2008 18:09:29 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 6810B6B83A8; Thu,
	23 Oct 2008 19:09:28 -0400 (EDT)
Date: Thu, 23 Oct 2008 19:09:28 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20081023230928.GA21151@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: RFC: Add http_proxy and ftp_proxy to BitBake white list
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
X-List-Received-Date: Thu, 23 Oct 2008 23:10:15 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Hi,

I'd like to propose to add http_proxy and ftp_proxy environment variables to 
BitBake's white list of preserved environment variables. They are usually set 
to be used by fetching tools like wget for users behind a firewall/proxy. 
Thanks.

-- 
Denys


