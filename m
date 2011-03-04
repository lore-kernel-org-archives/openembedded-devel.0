Received: from moutng.kundenserver.de ([212.227.126.186])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eng1@koblersystems.de>) id 1PvUOO-00073r-HB
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 13:46:00 +0100
Received: from [192.168.1.34] (p57B40AF4.dip0.t-ipconnect.de [87.180.10.244])
	by mrelayeu.kundenserver.de (node=mrbap1) with ESMTP (Nemesis)
	id 0Lj4zW-1QYNp43Jks-00dUi0; Fri, 04 Mar 2011 13:44:21 +0100
Message-ID: <4D70DEA2.6080100@koblersystems.de>
Date: Fri, 04 Mar 2011 13:44:18 +0100
From: Jan Kobler <eng1@koblersystems.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20110120 Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: Marc Reilly <marc@cpdesign.com.au>
References: <1298984498-27148-1-git-send-email-eng1@koblersystems.de>
	<201103030924.09980.marc@cpdesign.com.au>
	<4D70B652.7010706@koblersystems.de>
	<201103042209.44904.marc@cpdesign.com.au>
In-Reply-To: <201103042209.44904.marc@cpdesign.com.au>
X-Provags-ID: V02:K0:WkrQkJHmNLE7hsTq+jw5u85XlI4uSg+sSP0yp0540+B
	9N/g/Ys+gtiI6powZY0LTbw9FTO325p0FDQn0y4h4PT0qO/ys+
	o1cvxuLtqUKGiBUHjOsMXLaHUvYYtMDvLdgOvBjLmJ3IYXQgWj
	JWSI+iRXV7Ecz8oQfbBCmM9hfMGG7V6NodD7Bn1V9w6QXWhAI3
	8eYbigkGazfdo6fEZ3GfQ==
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 04 Mar 2011 12:46:00 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

Hi Marc,

> 
> I was hoping to look at the libgles recipe and do something similar with the 
> OpenVG stuff..
> 
>>
>> 4. Are you trying to create an image, where libgles-mx31 is missing?
> 
> No, but video playback is quite slow, so I was looking for a cheap fix to 
> speed it up :)
> 

I have searched on the web page of Freescale and have found this:

MBX’s OpenGL/Open VG v3.4 driver for Linux 2.6.24
http://cache.freescale.com/files/microcontrollers/software/device_drivers/BIN_MBX3.4_OpenGL_VG_DRV_LNX.tar.gz

AN3975 : i.MX35 Accelerated 2D Graphics
This application note describes optimizing 2D graphics with OpenVG™ and
i.MX35.
http://cache.freescale.com/files/dsp/doc/app_note/AN3975.pdf

I don't have time to test it right now.

Best regards

Jan


