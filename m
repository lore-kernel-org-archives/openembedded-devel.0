Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1N3RXW-0003MC-M5
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Oct 2009 10:43:33 +0100
Received: by bwz9 with SMTP id 9so2062115bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2009 02:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=DV8s8eTBWDKLV+KGs6mj36Dhi/USrBBcmrYVs/I8tkQ=;
	b=VPfeiSp7IaPFy3TlwD7s3KnnpwzKaxSf2n+6AFaP/hNgVMHGuZlx0gB6jatRqNd329
	2jozo9DHtLF0aJNBqHL4TtkTh4S0+K3IMzrMDeAysxZK25OGNWC9oWznxsNHwnIpz8Pl
	RCxLUfquC+BCQjMyzMqj3ZWCRsMD4DUdrA7Fg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=ucG2jTjUdrkUWeHKzTyd2n7070cKBez/XnFJDBz8gi4AgVmksByb1q4VARICFlWnZ3
	gyI44KR8rD7ZVa2iidSLonTTk8kNwIk9vXc9POo1nbN5WE2umxo378faGVPmtFdH0+1Q
	8DQEwNIU1fmLty8AGpzXR7MpyIL8ov9r/N9mA=
Received: by 10.102.226.17 with SMTP id y17mr7914732mug.67.1256809342808;
	Thu, 29 Oct 2009 02:42:22 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 23sm3064540mum.44.2009.10.29.02.42.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 29 Oct 2009 02:42:21 -0700 (PDT)
Date: Thu, 29 Oct 2009 10:42:26 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091029094226.GA3699@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Commit access
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
X-List-Received-Date: Thu, 29 Oct 2009 09:43:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all OE developers,
I am politely asking if would be possible to allow me OE commit access.

I already promised to commit this stuff:
1) xorg-7.5
2) scripts for easier updating of checksums.ini
3) SRCPV support
4) shr distribution merge from shr/merge

My previous commits went usually to shr/merge or shr/import through shr
patchwork, but sometimes it would easier/faster to commit it directly.

Thank you

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


