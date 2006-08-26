Received: from [212.27.42.35] (helo=smtp5-g19.free.fr)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <amine.saya@free.fr>) id 1GGyCU-0000pv-NC
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Aug 2006 15:27:50 +0200
Received: from [82.243.163.8] (cag06-3-82-243-163-8.fbx.proxad.net
	[82.243.163.8])
	by smtp5-g19.free.fr (Postfix) with ESMTP id 8DA25262D4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Aug 2006 15:26:04 +0200 (CEST)
Message-ID: <44F05B6D.2070005@free.fr>
Date: Sat, 26 Aug 2006 16:32:13 +0200
From: Mohammed Amine SAYA <amine.saya@free.fr>
User-Agent: Thunderbird 1.5.0.5 (X11/20060719)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
References: <44EFAE66.2040102@free.fr>	<74d0deb30608260409g586bf16bk73c652d3256df6c3@mail.gmail.com>	<44F0447D.8070309@free.fr>	<44F04FFC.1030006@free.fr>
	<44F04329.3060502@ee.ethz.ch>
In-Reply-To: <44F04329.3060502@ee.ethz.ch>
Subject: Re: busybox-1.2.1 and sysvinit-2.86 fail
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 26 Aug 2006 13:27:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Mustafa Yuecel wrote:
>
> I have the same problem. I think that the installation routine of
> busybox was slightly changed. The bin, sbin and usr directories already
> exists in the busybox directory, so the above mv command will fail..
Yes I think that too.

Did somebody get a problem with sysvinit-2.86 ?
It complains about an existing link :

ln: 
`/home/users/asaya/Work/OpenEmbedded/OpenEmbedded-Dev1-mnt028/build/tmp/work/at91sam9261-linux/sysvinit-2.86-r28/image/etc/rc2.d/S99stop-bootlogd': 
File exists



Best regards,

Amine.


