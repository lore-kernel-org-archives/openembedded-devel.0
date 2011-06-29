Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qbnyh-0005Fe-OV
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Jun 2011 08:11:31 +0200
Received: by pzk36 with SMTP id 36so728993pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2011 23:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=CFNy6ocZ2rvudedgLIXxqPgzXHbPfbKdzV4CdStpTJY=;
	b=wOOiFrw0l1X73AWbiNE5hnsTCaiyRm3Qjqo8orj8+VTdyUGEFz0e1ugosG35QpiaDw
	7h8CiQQND6RFKwhL5rPFevLkWxckdbGhkmnyp5Dhg+l8igkF9i/ShxMXWhFT4sDmc1ze
	W8XClXtl8G5llV+v/pUl1mWYIl2PpC+hMwGXI=
Received: by 10.68.42.230 with SMTP id r6mr659250pbl.79.1309327590935;
	Tue, 28 Jun 2011 23:06:30 -0700 (PDT)
Received: from [172.23.9.117] (natint3.juniper.net [66.129.224.36])
	by mx.google.com with ESMTPS id d1sm687245pbj.40.2011.06.28.23.06.30
	(version=SSLv3 cipher=OTHER); Tue, 28 Jun 2011 23:06:30 -0700 (PDT)
Message-ID: <4E0AC0E5.2030509@gmail.com>
Date: Tue, 28 Jun 2011 23:06:29 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <w4liwla3gm.wl%peter@chubb.wattle.id.au>	<4E0A7A7A.6040900@gmail.com>	<w4ei2da142.wl%peter@chubb.wattle.id.au>	<4E0A8221.8070304@gmail.com>
	<w4aad19sz2.wl%peter@chubb.wattle.id.au>
In-Reply-To: <w4aad19sz2.wl%peter@chubb.wattle.id.au>
Subject: Re: gettext-native fails to build
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
X-List-Received-Date: Wed, 29 Jun 2011 06:11:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/28/2011 09:12 PM, Peter Chubb wrote:
>>>>>> "Khem" == Khem Raj<raj.khem@gmail.com>  writes:
>
> Khem>  On 06/28/2011 06:16 PM, Peter Chubb wrote: are you using oe.dev
> Khem>  or oe-core ?  oe-core has these races solved
>>>
>>> oe.dev.  I'll try again with the core branch.
>>>
> Khem>  FWIW here are my notes on how to use oe-core for angstrom
>
> Khem>  http://sakrah.homelinux.org/blog/2011/03/using-openembedded-core-to-build-angstrom-for-qemu/
>
> Thanks.
>
> It looks as though oe-core doesn't know about collie yet.  I copied
> the machine description from oe-dev, and am attempting to build
> console-image.  Is there a graphical PIM image that's likely to build
> and work?

May be you can try core-image-sato

> --
> Dr Peter Chubb  http://www.gelato.unsw.edu.au  peterc AT gelato.unsw.edu.au
> http://www.ertos.nicta.com.au           ERTOS within National ICT Australia
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



