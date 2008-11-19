Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1L2lPd-0007Qx-AB
	for openembedded-devel@openembedded.org; Wed, 19 Nov 2008 12:40:01 +0100
Received: (qmail 5320 invoked by uid 813007); 19 Nov 2008 11:37:32 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@haerwu.biz@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 19 Nov 2008 11:37:32 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Nov 2008 12:37:22 +0100
User-Agent: KMail/1.10.3 (Linux/2.6.28-rc4; KDE/4.1.3; x86_64; ; )
MIME-Version: 1.0
Message-Id: <200811191237.23958.openembedded@haerwu.biz>
Subject: [Review] RPM support from Poky
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
X-List-Received-Date: Wed, 19 Nov 2008 11:40:01 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Hi

Few years ago we got partially working RPM support (which no one used). 
When Intel acquired OpenedHand there was lot of work put in getting RPM 
support really working. We got:

- creating of RPM packages (with deps, recommends)
- creating images from RPM packages
- creating images from feeds with RPM packages
- installing packages on devices (from file or feeds)

Thanks to the fact that OpenEmbedded uses git I was able to extract all 
required patches to get it imported from Poky. Result is available as 
'hrw/poky-rpm' branch on OE git server. 

It is not tested yet (build in progress). Any testers/reviewers are 
welcome.

Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://blog.haerwu.biz/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




