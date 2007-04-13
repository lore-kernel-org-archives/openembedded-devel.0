Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <zecke@selfish.org>) id 1HcTdG-0003yN-RI
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Apr 2007 23:48:38 +0200
Received: from [91.64.161.147] (helo=[192.168.10.100])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1HcTdG-0006HM-DU
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Apr 2007 23:48:38 +0200
Mime-Version: 1.0 (Apple Message framework v752.3)
Message-Id: <8A93ACC2-066E-41CE-AAD7-B869EF79B8F5@selfish.org>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
From: Holger Freyther <zecke@selfish.org>
Date: Fri, 13 Apr 2007 23:48:30 +0200
X-Mailer: Apple Mail (2.752.3)
X-Broken-Reverse-DNS: no host name found for IP address 91.64.161.147
Subject: [RFC] Removal of GPL recipes
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
X-List-Received-Date: Fri, 13 Apr 2007 21:48:38 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed

Hey,

I'm schocked that the following recipes are not compatible to our  
licensing policy and I would like to remove/relicense/rewrite them ASAP.


../org.openembedded.dev/packages/altboot/altboot_1.0.5.bb:4:#  
License: GPL (see http://www.gnu.org/licenses/gpl.txt for a copy of  
the license)
../org.openembedded.dev/packages/altboot/altboot_1.0.8.bb:4:#  
License: GPL (see http://www.gnu.org/licenses/gpl.txt for a copy of  
the license)
../org.openembedded.dev/packages/altboot/altboot_1.1.1 
+wip-20061123.bb:4:# License: GPL (see http://www.gnu.org/licenses/ 
gpl.txt for a copy of the license)
../org.openembedded.dev/packages/altboot/altboot_svn.bb:4:# License:  
GPL (see http://www.gnu.org/licenses/gpl.txt for a copy of the license)
../org.openembedded.dev/packages/altboot/altboot_1.1.1+wip-SVNR30.bb: 
4:# License: GPL (see http://www.gnu.org/licenses/gpl.txt for a copy  
of the license))
../org.openembedded.dev/packages/images/essential-image.bb:3:#  
License: GPL (see http://www.gnu.org/licenses/gpl.txt for a copy of  
the license)
../org.openembedded.dev/packages/images/essential-machine-image.bb: 
3:# License: GPL (see http://www.gnu.org/licenses/gpl.txt for a copy  
of the license)
../org.openembedded.dev/packages/mplayer/mplayer-common.bb:3:#  
License: GPL (see http://www.gnu.org/licenses/gpl.txt for a copy of  
the license)

I will remove them by monday if no one complains.

	z.


