Received: from [212.227.126.177] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <robert@linuxdevelopment.de>) id 1JdqKD-0001vi-UW
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Mar 2008 18:19:10 +0100
Received: from [10.0.0.200] (M8f2b.m.pppool.de [89.49.143.43])
	by mrelayeu.kundenserver.de (node=mrelayeu0) with ESMTP (Nemesis)
	id 0MKwh2-1JdqK41Wg0-0008IC; Mon, 24 Mar 2008 18:19:01 +0100
Message-ID: <47E7E283.8050903@linuxdevelopment.de>
Date: Mon, 24 Mar 2008 18:18:59 +0100
From: =?ISO-8859-1?Q?Robert_W=F6rle?= <robert@linuxdevelopment.de>
User-Agent: Thunderbird 2.0.0.12 (X11/20080226)
MIME-Version: 1.0
To: Geoffrey Wossum <geoffrey@pager.net>
References: <47E7757A.6080807@linuxdevelopment.de>
	<200803241028.40698.geoffrey@pager.net>
In-Reply-To: <200803241028.40698.geoffrey@pager.net>
X-Enigmail-Version: 0.95.6
X-Provags-ID: V01U2FsdGVkX1877HGqoriWEgeKGPsMCYhMjDLfbw96uHMxnbL
	d5izVu1eK9g3A8P3y+cgHkER3LTyOO1oCLT/pvI7MqMmltfmqL
	SH0yNeoUBfauUiz3QqI6Ye1RPBBAJtqFkKbjDzP0VI=
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: AVR32 - stops at gcc-cross-4.2.1 configure GCC_NO_EXECUTABLES
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
X-List-Received-Date: Mon, 24 Mar 2008 17:19:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


> 
> Not sure why you need to use the external-toolchain anymore.

why is it then pulled into the image .. ?? hmm maybe i am still at a 
home mode host problem .


   I submitted some
> patches that got applied on March 14 that allow OE to build the same 
> toolchain that Atmel's latest AVR32 buildroot system uses.
> 
I pulled those the 2nd they where in.

I copied your local.conf ( which was very similar to mine ) and restart 
but same error.

Maybe you could ( if you dare ) rebuild your gcc-cross-4.2.1 and send me 
the configure output log. then i could compare and see what it did 
detect and those certain points ?
Would you be so kind ?

Robert


