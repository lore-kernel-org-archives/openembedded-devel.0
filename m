Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pt4p6-0002Cz-5W
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 22:03:36 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Pt4nl-0002F0-DH from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 13:02:13 -0800
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 25 Feb 2011 13:02:12 -0800
Received: from [172.30.80.151] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Fri, 25 Feb 2011 13:02:12 -0800
Message-ID: <4D6818C6.4010100@mentor.com>
Date: Fri, 25 Feb 2011 14:01:58 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 25 Feb 2011 21:02:13.0038 (UTC)
	FILETIME=[465584E0:01CBD52F]
Subject: Release-2011.03: Let the testing re-continue again!
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
X-List-Received-Date: Fri, 25 Feb 2011 21:03:36 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hey all,

I've updated the testing-release-2011.03 branch exist now and we're 
ready for more testing.  As a reminder, please update the table on 
http://wiki.openembedded.org/index.php?title=Release-2011.03 with your 
results and the githash you're on.

I didn't plan on doing this before Tuesday but given the libnl2 breakage 
(my fault, sorry all) and then some other important fixes for various 
races, I've done one more update hopefully in time for people to catch 
it for "weekend" build testing.

I plan to otherwise follow what I said in the previous email about final 
branching plans, as I'm running out of ways to modify the Subject :)

Thanks again all!

-- 
Tom Rini
Mentor Graphics Corporation


