Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Kzwfz-0006Sg-I3
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Nov 2008 18:05:15 +0100
Received: from imp050244.vpn.mi.fu-berlin.de ([130.133.50.244])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Kzw8z-0001Rw-SC
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Nov 2008 17:31:09 +0100
Message-Id: <0F152AAD-A72B-4CFD-8DC2-8C74F21290FA@selfish.org>
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Mime-Version: 1.0 (Apple Message framework v929.2)
Date: Tue, 11 Nov 2008 17:31:08 +0100
X-Mailer: Apple Mail (2.929.2)
Subject: Push access for some of the Openmoko folks
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
X-List-Received-Date: Tue, 11 Nov 2008 17:05:16 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hey,

over the last six month I have worked with John Lee, Julian Chu, Chen  
I-Fan(tick), Chia-I Wu (olv) and all of them have done work on the  
distribution. They work with great care and know what they do and if  
that is not the case communicate.

With my OE hat on I want them to commit their fixes to the  
OpenEmbedded repository before pushing things to the org.openmoko.dev  
branch.

I would like to propose the following:
	- Grant push access to Julian, tick and olv
	- Tick's and Olv' area of responsible is likely to be limited to the  
openmoko-projects directory (and opkg)
	- Julian was the lead of the distro team and touched stuff all over  
the place, I'm sure he will propose his work in branches, etc. when  
discussion is needed.

I don't assume there will be any issues with them, if I'm wrong, I'm  
happy to fix whatever damage they have done to the repository and sort  
the issue out. They will seek review and only push changes they are  
confident with, or create branches for review.

What do you think about this experiment?

	z.


