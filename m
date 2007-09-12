Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dp@xora.org.uk>) id 1IVN5i-0005Mi-HC
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Sep 2007 09:56:54 +0200
Received: from [192.168.1.2] ([::ffff:85.210.31.177])
	(AUTH: PLAIN dp, SSL: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Wed, 12 Sep 2007 08:53:46 +0100
	id 0006453B.46E79B0A.000033B3
Message-ID: <46E79AFE.9040304@xora.org.uk>
Date: Wed, 12 Sep 2007 08:53:34 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.6 (X11/20070824)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <HOECLKEKOHLAMMGDLLBHGENPMDAA.skoroneos@digital-opsis.com>
In-Reply-To: <HOECLKEKOHLAMMGDLLBHGENPMDAA.skoroneos@digital-opsis.com>
Subject: Re: Task-base is big :(
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
X-List-Received-Date: Wed, 12 Sep 2007 07:56:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Stelios Koroneos wrote:
> True.
> As more people start to use OE and as these people would be mostly
> interested in "vertical" solutions (develop an app or add apps to an
> existing distro without having to rebuild everything) i think we need to
> have a closer look at the OE SDK vs build everything from scratch.
> Having a "standard" toolchain availiable (and the way to use it) for people
> that are not interested in developing distro's would IMHO provide additional
> "user friendliness" and make OE an even more attractive solution.
>   
I personally think this discussion is a clear example of why Koen's
work on packaged staging needs to be finished.

Just think how much faster you could build if all the system did was
download and install these dependencies rather than build them
from scratch.

Graeme



