Received: from [64.233.166.177] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xjqian@gmail.com>) id 1JkYoh-00006I-Pt
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Apr 2008 08:02:25 +0200
Received: by py-out-1112.google.com with SMTP id y77so774412pyg.28
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Apr 2008 23:02:22 -0700 (PDT)
Received: by 10.35.65.17 with SMTP id s17mr6398964pyk.37.1207980138615;
	Fri, 11 Apr 2008 23:02:18 -0700 (PDT)
Received: from ?192.168.1.209? ( [24.107.189.117])
	by mx.google.com with ESMTPS id w43sm4572017pyg.42.2008.04.11.23.02.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 11 Apr 2008 23:02:17 -0700 (PDT)
Message-ID: <48005066.4010903@gmail.com>
Date: Sat, 12 Apr 2008 01:02:14 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [RFC] Drop wlan-ng recipes < 0.2.7
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
X-List-Received-Date: Sat, 12 Apr 2008 06:02:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Are there any objection to dropping wlan-ng recipes before 0.2.7? 
wlan-ng recipes used to be maintained by Dirk, but he is not active 
anymore. wlan-ng 0.2.7 and 0.2.8 works well for tosa with current kernel.

I found only tosa, angstrom-2007-for-openmoko-versions.inc, and 
nylon-feed.bb, needs wlan-ng. I'm sure this change are safe for these, 
Are there any other affected entities that I'm not aware of?

Regards
Gordon


