Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pp0zE-0003nY-KJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 17:09:16 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Pp0y6-0006bC-Aw from Tom_Rini@mentor.com ;
	Mon, 14 Feb 2011 08:08:06 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 14 Feb 2011 08:08:05 -0800
Received: from [172.30.80.148] ([172.30.80.148]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 14 Feb 2011 09:08:04 -0700
Message-ID: <4D59535A.1010602@mentor.com>
Date: Mon, 14 Feb 2011 09:07:54 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: Jaap de Jong <jaap.dejong@nedap.com>, 
	openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 14 Feb 2011 16:08:05.0045 (UTC)
	FILETIME=[5CC43E50:01CBCC61]
Subject: testing-release-2011.1 failure: at91sam9263ek
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
X-List-Received-Date: Mon, 14 Feb 2011 16:09:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hey all,

Here are the failures I see building for at91sam9263ek:
angstrom-2010.x (all images): http://pastebin.com/7g7wNWQj

Perhaps this will be fixed when Ulf pushes updates for a newer version 
of u-boot?  The error itself is easily fixable but there may be run-time 
problems still.

-- 
Tom Rini
Mentor Graphics Corporation


