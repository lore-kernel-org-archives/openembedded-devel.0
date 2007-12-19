Received: from [195.96.192.9] (helo=sirio.fastnet.it ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <stefano.regno@spesonline.com>) id 1J4zTd-0002LP-72
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Dec 2007 15:00:49 +0100
Received: from localhost (localhost [127.0.0.1])
	by sirio.fastnet.it (FASTnet-NAP) with ESMTP id BA3B395B92
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2007 14:55:48 +0100 (CET)
Received: from sirio.fastnet.it ([127.0.0.1])
	by localhost (sirio [127.0.0.1]) (amavisd-new, port 10024) with LMTP
	id 16346-01-10 for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2007 14:55:48 +0100 (CET)
Received: from sole.fastnet.it (sole.fastnet.it [195.96.192.1])
	by sirio.fastnet.it (FASTnet-NAP) with ESMTP id 9811895B8D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2007 14:55:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by sole.fastnet.it (FASTnet-NAP) with ESMTP id 743D01D9462
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2007 14:55:48 +0100 (CET)
Received: from sole.fastnet.it ([127.0.0.1])
	by localhost (sole [127.0.0.1]) (amavisd-new, port 10024) with LMTP
	id 07755-01-2 for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2007 14:55:48 +0100 (CET)
Received: from [192.168.1.171]
	(host141-216-static.91-82-b.business.telecomitalia.it
	[82.91.216.141])
	by sole.fastnet.it (FASTnet-NAP) with ESMTP id 2988B1D944F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2007 14:55:48 +0100 (CET)
Message-ID: <476922E1.5060401@spesonline.com>
Date: Wed, 19 Dec 2007 14:55:45 +0100
From: Regno Stefano <stefano.regno@spesonline.com>
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1187652493.20071219133208@gmail.com>
In-Reply-To: <1187652493.20071219133208@gmail.com>
X-Virus-Scanned: by amavisd-new-20030616-p10 (Debian) at fastnet.it
X-Virus-Scanned: by amavisd-new-20030616-p10 (Debian) at fastnet.it
Subject: Re: [RFC] BogoFeeds reloaded
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
X-List-Received-Date: Wed, 19 Dec 2007 14:00:51 -0000
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

I found the package about VNC but i have this error bitbake x11vnc_0.9.3.bb
ERROR: Unable to parse conf/bitbake.conf (Could not inherit file 
classes/autotools.bbclass)

What can i do to solve thet, i must unpack it and compile for arm MX31



