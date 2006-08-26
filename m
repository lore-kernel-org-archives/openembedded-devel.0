Received: from [212.27.42.28] (helo=smtp2-g19.free.fr)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <amine.saya@free.fr>) id 1GGy8x-0000nT-Sm
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Aug 2006 15:24:11 +0200
Received: from [82.243.163.8] (cag06-3-82-243-163-8.fbx.proxad.net
	[82.243.163.8])
	by smtp2-g19.free.fr (Postfix) with ESMTP id B06FF75BE7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Aug 2006 15:22:25 +0200 (CEST)
Message-ID: <44F05A88.5050203@free.fr>
Date: Sat, 26 Aug 2006 16:28:24 +0200
From: Mohammed Amine SAYA <amine.saya@free.fr>
User-Agent: Thunderbird 1.5.0.5 (X11/20060719)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
References: <44EFAE66.2040102@free.fr>	<74d0deb30608260409g586bf16bk73c652d3256df6c3@mail.gmail.com>	<44F0447D.8070309@free.fr>	<44F04FFC.1030006@free.fr>	<44F04329.3060502@ee.ethz.ch>
	<44F0478E.9000607@dominion.kabel.utwente.nl>
In-Reply-To: <44F0478E.9000607@dominion.kabel.utwente.nl>
Subject: Re: busybox-1.2.1 fails
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
X-List-Received-Date: Sat, 26 Aug 2006 13:24:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> bitbake busybox -c clean ; bitbake busybox
> and your problem automagically disappears
>   
No It does not, I did that like thousand times and I got the same 
problem again and again.
replacing mv with cp -a fixed it.



