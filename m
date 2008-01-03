Received: from [195.96.192.9] (helo=sirio.fastnet.it ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <stefano.regno@spesonline.com>) id 1JAMEN-0006Nb-MW
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jan 2008 10:19:15 +0100
Received: from localhost (localhost [127.0.0.1])
	by sirio.fastnet.it (FASTnet-NAP) with ESMTP id 33AD195C2E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jan 2008 10:12:47 +0100 (CET)
Received: from sirio.fastnet.it ([127.0.0.1])
	by localhost (sirio [127.0.0.1]) (amavisd-new, port 10024) with LMTP
	id 03321-01-4 for <openembedded-devel@lists.openembedded.org>;
	Thu, 3 Jan 2008 10:12:47 +0100 (CET)
Received: from sole.fastnet.it (sole.fastnet.it [195.96.192.1])
	by sirio.fastnet.it (FASTnet-NAP) with ESMTP id 1267A95C24
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jan 2008 10:12:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by sole.fastnet.it (FASTnet-NAP) with ESMTP id 036F61D9451
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jan 2008 10:12:47 +0100 (CET)
Received: from sole.fastnet.it ([127.0.0.1])
	by localhost (sole [127.0.0.1]) (amavisd-new, port 10024) with LMTP
	id 29727-01-9 for <openembedded-devel@lists.openembedded.org>;
	Thu, 3 Jan 2008 10:12:46 +0100 (CET)
Received: from [192.168.1.163]
	(host141-216-static.91-82-b.business.telecomitalia.it
	[82.91.216.141])
	by sole.fastnet.it (FASTnet-NAP) with ESMTP id B2BF21D944E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jan 2008 10:12:46 +0100 (CET)
Message-ID: <477CA6D3.1080402@spesonline.com>
Date: Thu, 03 Jan 2008 10:11:47 +0100
From: ohviey1 <stefano.regno@spesonline.com>
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <0cdd01c84d52$b60de4c0$6e01a8c0@twilight><74d0deb30801020752p51c90f7fuff6d080fcf397e2f@mail.gmail.com>
	<0ced01c84d5a$37ce9520$6e01a8c0@twilight>
In-Reply-To: <0ced01c84d5a$37ce9520$6e01a8c0@twilight>
X-Virus-Scanned: by amavisd-new-20030616-p10 (Debian) at fastnet.it
X-Virus-Scanned: by amavisd-new-20030616-p10 (Debian) at fastnet.it
Subject: problem with nfs-kernel-server
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
X-List-Received-Date: Thu, 03 Jan 2008 09:19:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi all.
I have a problem about server ethern on Arm MX21.
I try to mount file system with nfs and i ghave same error:
nfs: server 10.193.101.100 not responding, still 
trying                        
nfs: server 10.193.101.100 not responding, still 
trying                        
nfs: server 10.193.101.100 not responding, still 
trying                        
nfs: server 10.193.101.100 not responding, still 
trying                        
nfs: server 10.193.101.100 not responding, still 
trying                        
nfs: server 10.193.101.100 
OK                                                  
nfs: server 10.193.101.100 
OK                                                  
nfs: server 10.193.101.100 OK                             

I have a Gigabyte ethernet.
Anyone know why.

Thanks a lot.


