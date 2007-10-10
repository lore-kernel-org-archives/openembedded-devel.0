Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <zecke@selfish.org>) id 1IfcA1-0007uI-Ls
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Oct 2007 16:03:41 +0200
Received: from dsl-62-220-14-162.berlikomm.net ([62.220.14.162]
	helo=[192.168.2.131]) by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1Ifc4K-0005rk-Ag
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Oct 2007 15:57:48 +0200
Mime-Version: 1.0 (Apple Message framework v752.3)
Message-Id: <8200BBD0-C467-4FF2-9F31-5718061769FB@selfish.org>
To: openembedded-devel@lists.openembedded.org
From: Holger Freyther <zecke@selfish.org>
Date: Wed, 10 Oct 2007 15:57:39 +0200
X-Mailer: Apple Mail (2.752.3)
Subject: OpenEmbedded read-only GIT mirror
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
X-List-Received-Date: Wed, 10 Oct 2007 14:03:42 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed

Hey all,

there is a mtn2git script inside the OpenEmbedded meta-data and the  
result of that script and waiting hours for git-repack -a -d -f  
resulted in a git tree that can be actually pulled.

We have (re)-agreed to offer read-only anonymous access to the OE  
meta-data when people stand up and provide such a mirror.

This has happened for git and I'm proud to announce a git-mirror of  
OpenEmbedded which is located at http://repo.or.cz/w/ 
org.openembedded.dev.git. I try to keep this updated and automate it  
as well. The other branches of OpenEmbedded will follow as well.


z.


PS: A hopefully more complete protocol will come


