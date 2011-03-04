Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PvVGK-0003UF-LM
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 14:41:45 +0100
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id DB12DCA890B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Mar 2011 14:15:41 +0100 (CET)
Received: from [192.168.1.15] (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id CE1BC4B01AB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Mar 2011 14:14:48 +0100 (CET)
Message-ID: <4D70E5C7.3080807@eukrea.com>
Date: Fri, 04 Mar 2011 14:14:47 +0100
From: Eric Benard <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1298984498-27148-1-git-send-email-eng1@koblersystems.de>	<201103030924.09980.marc@cpdesign.com.au>	<4D70B652.7010706@koblersystems.de>	<201103042209.44904.marc@cpdesign.com.au>
	<4D70DEA2.6080100@koblersystems.de>
In-Reply-To: <4D70DEA2.6080100@koblersystems.de>
Subject: Re: [pcm043 1/2] New machine pcm043 Phytec phyCORE-i.MX35
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
X-List-Received-Date: Fri, 04 Mar 2011 13:41:45 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Jan, Marc,

On 04/03/2011 13:44, Jan Kobler wrote:
>> I was hoping to look at the libgles recipe and do something similar wi=
th the
>> OpenVG stuff..
>>
>>>
>>> 4. Are you trying to create an image, where libgles-mx31 is missing?
>>
>> No, but video playback is quite slow, so I was looking for a cheap fix=
 to
>> speed it up :)
>>
>
> I have searched on the web page of Freescale and have found this:
>
> MBX=92s OpenGL/Open VG v3.4 driver for Linux 2.6.24
> http://cache.freescale.com/files/microcontrollers/software/device_drive=
rs/BIN_MBX3.4_OpenGL_VG_DRV_LNX.tar.gz
>
this one is not for ARM but for MPC5121 (ppc).

Eric


