Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PtqRX-0004Em-Uz
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 00:54:28 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PtqQA-0006Mp-MU from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Feb 2011 15:53:02 -0800
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sun, 27 Feb 2011 15:53:02 -0800
Received: from [172.30.80.189] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Sun, 27 Feb 2011 15:53:01 -0800
Message-ID: <4D6AE3CD.5070508@mentor.com>
Date: Sun, 27 Feb 2011 16:52:45 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 27 Feb 2011 23:53:02.0345 (UTC)
	FILETIME=[78392790:01CBD6D9]
Subject: RFC: Remove old avahi versions
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
X-List-Received-Date: Sun, 27 Feb 2011 23:54:28 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hey all,

As part of fixing CVE-2011-1002 I see that no one is pinning avahi 
except maemo/chinook compat recipes so I would like to delete 
0.6.{19,21,22,23,24} and avahi-ui 0.6.21.

-- 
Tom Rini
Mentor Graphics Corporation


