Received: from [72.29.79.205] (helo=rhodos.klever.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hacker@klever.net>) id 1IN7nr-0005jD-Es
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Aug 2007 16:00:26 +0200
Received: from pd953ba6e.dip0.t-ipconnect.de ([217.83.186.110]
	helo=olympus.klever.net)
	by rhodos.klever.net with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.67) (envelope-from <hacker@klever.net>) id 1IN7my-0006oF-33
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Aug 2007 15:59:28 +0200
Message-ID: <46C99CF1.2040502@klever.net>
Date: Mon, 20 Aug 2007 15:53:53 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 2.0.0.6 (X11/20070815)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200708201541.54798.openembedded@hrw.one.pl>
In-Reply-To: <200708201541.54798.openembedded@hrw.one.pl>
Subject: Re: QEmu update from Poky
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
X-List-Received-Date: Mon, 20 Aug 2007 14:00:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

> In Poky we use qemu 0.9+20070613 for some time. It works on i386 and amd64 
> build machines and generate binary locales for ARM without problems.
> 
> OE use old 0.8.2 version which fails on amd64. There is also 0.9+20070701 
> version set as non-default and this one should work on amd64 machines 
> (but probably will fail on i386 due to lack of MAP_32BIT on this arch).

yes, the failure is even confirmed.

> I plan to replace old 0.8.2 and 0.9+20070701 versions by 0.9+20070613 from 
> Poky to give people version which works on 32/64 machines without 
> problems. This version has also some other extras added by OH - like 
> touchscreen emulation based on USB Wacom tablet emulation.
> 
> Any objections?

Would be great, I was planning to take care of it for quite a while, but 
  haven't got my hands on it yet.

Love,
H


