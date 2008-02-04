Received: from [64.28.152.243] (helo=smtp-relay2.palm.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rich.pixley@palm.com>) id 1JM9Rq-0007SW-ML
	for openembedded-devel@openembedded.org; Mon, 04 Feb 2008 23:05:54 +0100
X-IronPort-AV: E=Sophos;i="4.25,304,1199692800"; 
   d="scan'208";a="4585244"
Received: from unknown (HELO mailhost02.palm.com) ([148.92.223.90])
	by smtp-relay2.palm.com with ESMTP; 04 Feb 2008 14:06:04 -0800
Received: from flamingo.palm1.palmone.com (flamingo.palm1.palmone.com
	[148.92.248.89])
	by mailhost02.palm.com (8.13.6+Sun/8.12.10) with ESMTP id
	m14M5qK7001393; Mon, 4 Feb 2008 14:05:52 -0800 (PST)
Message-ID: <47A78C40.8000308@palm.com>
Date: Mon, 04 Feb 2008 14:05:52 -0800
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
Subject: getVar. setVar, "d", etc.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Feb 2008 22:05:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm trying to figure out how to set bitbake variables from within python
escapes but I'm not having much luck.

Could someone please explain the use of the "d" variable in the getVar
and setVar calls?  Or point me towards enlightening pieces of code or
documentation?

--rich


