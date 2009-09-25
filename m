Received: from [64.28.152.243] (helo=smtp-relay2.palm.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <prvs=rich.pixley=512d7bbe6@palm.com>)
	id 1MrJXJ-0000nT-VU
	for openembedded-devel@openembedded.org; Sat, 26 Sep 2009 00:45:13 +0200
X-IronPort-AV: E=Sophos;i="4.44,453,1249282800"; d="scan'208";a="21844082"
Received: from unknown (HELO mailhost01.palm.com) ([148.92.223.30])
	by smtp-relay2.palm.com with ESMTP; 25 Sep 2009 15:44:26 -0700
Received: from flamingo.palm.com ([148.92.244.134])
	by mailhost01.palm.com (8.13.6+Sun/8.12.10) with ESMTP id
	n8PMi1Xv012167; Fri, 25 Sep 2009 15:44:25 -0700 (PDT)
Message-ID: <4ABD47B1.1030108@palm.com>
Date: Fri, 25 Sep 2009 15:44:01 -0700
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Thunderbird 2.0.0.23 (Macintosh/20090812)
MIME-Version: 1.0
To: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
X-SA-Exim-Connect-IP: 64.28.152.243
X-SA-Exim-Mail-From: prvs=rich.pixley=512d7bbe6@palm.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: colons in BBPATH
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
X-List-Received-Date: Fri, 25 Sep 2009 22:45:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

How do I get a pathname into BBPATH which contains colons?

Eg, my directory name is "2009-09-25T15:30:52/oe"...

--rich


