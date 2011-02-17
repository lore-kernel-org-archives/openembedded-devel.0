Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PqDQr-0005gf-Ii
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 00:38:45 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PqDPg-0001RS-0O from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 15:37:32 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 17 Feb 2011 15:37:31 -0800
Received: from [172.30.80.148] ([172.30.80.148]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 17 Feb 2011 16:37:30 -0700
Message-ID: <4D5DB136.9080407@mentor.com>
Date: Thu, 17 Feb 2011 16:37:26 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 17 Feb 2011 23:37:31.0069 (UTC)
	FILETIME=[A50236D0:01CBCEFB]
Subject: Release-2011.03: Let the testing contiue!
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
X-List-Received-Date: Thu, 17 Feb 2011 23:38:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hey all,

I've updated the testing-release-2011.03 branch exist now and we're 
ready for more testing.  As a reminder, please update the table on 
http://wiki.openembedded.org/index.php?title=Release-2011.03 with your 
results and the githash you're on.

Also, we expect this to be very bumpy as the RPATH QA issue will bite on 
a lot of images.  I've got some plans here but fixing some of them is a 
bit harder than I had hoped.

Thanks again all!

-- 
Tom Rini
Mentor Graphics Corporation


