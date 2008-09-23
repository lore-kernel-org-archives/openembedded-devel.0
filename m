Received: from [206.46.252.42] (helo=vms042pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1KiFH3-00034S-GF
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Sep 2008 23:18:26 +0200
Received: from gandalf.denix.org ([71.255.232.65])
	by vms042.mailsrvcs.net (Sun Java System Messaging Server 6.2-6.01
	(built Apr
	3 2006)) with ESMTPA id <0K7O007FA30AX8R5@vms042.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	23 Sep 2008 16:14:35 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 082656B83B5; Tue,
	23 Sep 2008 17:14:34 -0400 (EDT)
Date: Tue, 23 Sep 2008 17:14:34 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20080923211433.GA29169@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: libxml2_native_python_dir
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
X-List-Received-Date: Tue, 23 Sep 2008 21:18:26 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Hi,

Since couple of days ago I'm seeing this error message when bitbake rebuilds 
its cache:

ERROR: Error Method already seen: libxml2_native_python_dir in' libxml2-native_2.6.29.bb' now in 'libxml2-native_2.6.32.bb'

Even though it says ERROR, it does not break the build.
Should I create a bug report for this?

-- 
Denys


