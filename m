Received: from [140.211.169.173] (helo=foonas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tim.ellis@foonas.org>) id 1LM7Op-0005zc-3E
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Jan 2009 21:59:11 +0100
Received: from localhost (localhost [127.0.0.1])
	by foonas.org (Postfix) with ESMTP id 6F2171714A7;
	Sun, 11 Jan 2009 20:52:45 +0000 (GMT)
X-Virus-Scanned: amavisd-new at foonas.org
Received: from foonas.org ([127.0.0.1])
	by localhost (foonas.org [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jrpuP-q7Yhse; Sun, 11 Jan 2009 20:52:40 +0000 (GMT)
Received: from [192.168.1.102] (92-237-114-21.cable.ubr03.chms.blueyonder.co.uk
	[92.237.114.21]) (using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: tim.ellis@foonas.org)
	by foonas.org (Postfix) with ESMTPSA id 254E51706AD;
	Sun, 11 Jan 2009 20:52:39 +0000 (GMT)
Message-Id: <089B0658-0555-45C0-9C28-EBAE9FF58EB1@foonas.org>
From: Tim Ellis <tim.ellis@foonas.org>
To: openembedded-devel@lists.openembedded.org
Mime-Version: 1.0 (Apple Message framework v930.3)
Date: Sun, 11 Jan 2009 20:44:53 +0000
X-Mailer: Apple Mail (2.930.3)
Cc: =?ISO-8859-1?Q?=D8yvind_Repvik?= <nail@nslu2-linux.org>
Subject: git access request
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
X-List-Received-Date: Sun, 11 Jan 2009 20:59:11 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi all,
I took over most of the foonas work from NAiL some time ago (it can be  
measured in years now I believe!) and would like to request access to  
the various packages NAiL has committed for me so that I am able to  
maintain them more directly, ie fix various and keep them up to date.  
In addition to this I have various packages to add and maintain that  
might be useful (won't cover these in this message) however to start  
with we have...

Existing platforms that need maintaining/updating:

* lsmipsel - MIPSel Linkstation
* lsppchg - PowerPC Linkstation
* lsppchd - PowerPC Linkstation
* lspro (this is what lsarm became) - New Orion/ARM Linkstations

New platforms that I can add and maintain:

* Thecus N1200
* Kurobox Pro
* MP MV2120
* QNAP TS109 and 209

Packages in OE that originated from foonas that need maintaining that  
I can find:

* samba
* netatalk
* iscsi-target
* miconapl (this should not exist anymore anyway!)
* micro-evtd
* hfsplusutils
* haserl
* dtc (not so relevant these days!)

Also there are some remenants of foonas in OE dev from >12 months ago  
that need cleaning up, and if foonas is to be merged with OE more  
closely then I think I am the best person to help here being the most  
active person on this project for some time.

Thanks,

Tim


