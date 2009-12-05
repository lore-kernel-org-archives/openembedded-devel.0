Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <d.vinokuroff@gmail.com>) id 1NGtsD-0001a3-6R
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Dec 2009 13:36:32 +0100
Received: by bwz9 with SMTP id 9so2463444bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Dec 2009 04:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=5j4up4UTnrIOBpwu6IkJmOsUNCGfmzj2Ylk8C7GeXiM=;
	b=RhGN6yeoKEGhRBwGx9BKCDGoblkU64GhwFPqcW0gambTWZMNDd3jpLaBAgwNHIOKhL
	FgDZuADio5TzmnyJZEWytMQVX6ZsTO/V6wevO7rBpg19f5z61KBwsiClHpTI61iqcV1n
	QExCChqztqp1d/sofPrsiJVKAEdV+AR7LZZR8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=KpV2Rkje6QyX7hvuA5xhhCgRCEcjpOjR80DcX5r3EYUSQEszylR+D2kcRIXTo8D1/Q
	8NZED5Bm8Ws3qDzXR9+EXmTCEYJEacTDGCnL+snI2PkPlUj6Efg4xJfFeiYxv5kqqxPQ
	uU0vy/D3DkBTmNKTVv5QA+6qYJIVwyprA1MDM=
Received: by 10.204.20.143 with SMTP id f15mr4500565bkb.49.1260016491378;
	Sat, 05 Dec 2009 04:34:51 -0800 (PST)
Received: from ?192.168.0.101? ([94.180.13.80])
	by mx.google.com with ESMTPS id 14sm1104699bwz.5.2009.12.05.04.34.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 05 Dec 2009 04:34:50 -0800 (PST)
Message-ID: <4B1A531A.6010401@gmail.com>
Date: Sat, 05 Dec 2009 17:33:30 +0500
From: Dmitry Vinokurov <d.vinokuroff@gmail.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20091001)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: d.vinokuroff@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Updating packages list
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
X-List-Received-Date: Sat, 05 Dec 2009 12:36:32 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Began working with package feeds and can't understand one thing -- when 
Packages lists (such as tmp/deploy/ipk/Packages.gz) are updated on the 
server side. Could anybody explain it, please?

For example, I built new package, let it be helloworld, and the package 
exist in tmp/deploy/ipk/armv5te, but there is no helloworld in 
tmp/deploy/ipk/armv5te/Packages, Packages.gz etc.

-- 
Best Regards, 
Dmitry Vinokurov 
<d.vinokuroff@gmail.com>



