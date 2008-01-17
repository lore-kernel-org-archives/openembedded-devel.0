Received: from [195.96.192.9] (helo=sirio.fastnet.it ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <stefano.regno@spesonline.com>) id 1JFTNO-00010V-V1
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jan 2008 12:57:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by sirio.fastnet.it (FASTnet-NAP) with ESMTP id 86E1C95A85
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2008 12:57:42 +0100 (CET)
Received: from sirio.fastnet.it ([127.0.0.1])
	by localhost (sirio [127.0.0.1]) (amavisd-new, port 10024) with LMTP
	id 14370-01-8 for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2008 12:57:42 +0100 (CET)
Received: from sole.fastnet.it (sole.fastnet.it [195.96.192.1])
	by sirio.fastnet.it (FASTnet-NAP) with ESMTP id 6965995A56
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2008 12:57:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by sole.fastnet.it (FASTnet-NAP) with ESMTP id 583CF1D945C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2008 12:57:42 +0100 (CET)
Received: from sole.fastnet.it ([127.0.0.1])
	by localhost (sole [127.0.0.1]) (amavisd-new, port 10024) with LMTP
	id 02519-01-8 for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2008 12:57:42 +0100 (CET)
Received: from [192.168.1.163]
	(host141-216-static.91-82-b.business.telecomitalia.it
	[82.91.216.141])
	by sole.fastnet.it (FASTnet-NAP) with ESMTP id 18D071D9459
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2008 12:57:42 +0100 (CET)
Message-ID: <478F42B7.5030206@spesonline.com>
Date: Thu, 17 Jan 2008 12:57:43 +0100
From: ohviey1 <stefano.regno@spesonline.com>
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1JF7vM-0000k1-Mc@linuxtogo.org>
	<413710907.20080117131841@gmail.com>
In-Reply-To: <413710907.20080117131841@gmail.com>
X-Virus-Scanned: by amavisd-new-20030616-p10 (Debian) at fastnet.it
X-Virus-Scanned: by amavisd-new-20030616-p10 (Debian) at fastnet.it
Subject: Bug
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
X-List-Received-Date: Thu, 17 Jan 2008 11:57:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I work with ubutnu the last version.
I have a big problem when a search to load filesystem into an ARM with 
ethernet who works at 10 Mb/s
The problem is thet:


IP-Config: 
Complete:                                                           
      device=eth0, addr=10.193.101.129, mask=255.255.255.0, 
gw=10.193.101.1,   
     host=10.193.101.129, domain=, 
nis-domain=(none),                          
     bootserver=10.193.101.100, rootserver=10.193.101.100, 
rootpath=           
Looking up port of RPC 100003/2 on 
10.193.101.100                              
Looking up port of RPC 100005/1 on 
10.193.101.100                              
w1_master_driver w1_bus_master1: Family 9 for 09.000003f08c27.80 is not 
registe.
VFS: Mounted root (nfs 
filesystem).                                            
Freeing init memory: 
200K                                                      
nfs: server 10.193.101.100 not responding, still 
trying                        
nfs: server 10.193.101.100 not responding, still 
trying                        

Have you same idea how can reslve thet i searched on google possible is 
a bug?


