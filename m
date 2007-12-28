Received: from [209.85.132.251] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <xjqian@gmail.com>) id 1J8BbT-0002Gn-Oe
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Dec 2007 10:34:07 +0100
Received: by an-out-0708.google.com with SMTP id b33so578752ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Dec 2007 01:28:14 -0800 (PST)
Received: by 10.100.254.18 with SMTP id b18mr18688699ani.57.1198834094712;
	Fri, 28 Dec 2007 01:28:14 -0800 (PST)
Received: from ?192.168.35.6? ( [128.252.118.150])
	by mx.google.com with ESMTPS id 37sm7819630nzf.5.2007.12.28.01.28.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 28 Dec 2007 01:28:14 -0800 (PST)
Message-ID: <4774C182.20501@gmail.com>
Date: Fri, 28 Dec 2007 03:27:30 -0600
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Icedove 1.5.0.14pre (X11/20071020)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
Cc: angstrom-distro-devel@linuxtogo.org
Subject: Tosa kernel bloat
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
X-List-Received-Date: Fri, 28 Dec 2007 09:34:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Tosa kernel is bloated with the recent patch and change to defconfig-tosa

|`/home/gordon/oe/build/tmp/work/tosa-angstrom-linux-gnueabi/linux-rp-2.6.23-r14/linux-2.6.23'
| Size is 1296464
| FATAL: This kernel is too big for your PXA Zaurus and will destroy 
data if you flash it. Please reduce the size of the kernel by making 
more of it modular.

Anybody else experience this? I guess kernel size below 1280000 is ok? 
I'm not sure where I should look to trim it down?

Regards
Gordon


