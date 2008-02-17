Received: from [66.249.92.171] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JQkNr-0002OW-2U
	for openembedded-devel@openembedded.org; Sun, 17 Feb 2008 15:20:49 +0100
Received: by ug-out-1314.google.com with SMTP id q7so179178uge.0
	for <openembedded-devel@openembedded.org>;
	Sun, 17 Feb 2008 06:20:14 -0800 (PST)
Received: by 10.66.219.11 with SMTP id r11mr1963919ugg.31.1203258014897;
	Sun, 17 Feb 2008 06:20:14 -0800 (PST)
Received: from widy.localdomain ( [88.231.76.37])
	by mx.google.com with ESMTPS id y7sm2929317ugc.16.2008.02.17.06.20.12
	(version=SSLv3 cipher=OTHER); Sun, 17 Feb 2008 06:20:14 -0800 (PST)
Date: Sun, 17 Feb 2008 16:20:45 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@openembedded.org
Message-ID: <20080217162045.77bde941@widy.localdomain>
In-Reply-To: <1203247696.8272.63.camel@dax.rpnet.com>
References: <20080214045433.02de68cd@widy.localdomain>
	<74d0deb30802140255k6c16bafeq6771d572fd7c542c@mail.gmail.com>
	<20080215110230.526ea6a1@widy.localdomain>
	<74d0deb30802150141q71e844esd6185bf52b1e79ae@mail.gmail.com>
	<20080215133238.7d8f7887@widy.localdomain>
	<1203076695.8636.30.camel@dax.rpnet.com>
	<20080215182949.053c3d3a@widy.localdomain>
	<1203095510.8636.92.camel@dax.rpnet.com>
	<20080215201102.0375245d@widy.localdomain>
	<1203115927.8636.134.camel@dax.rpnet.com>
	<20080216125903.3c446440@widy.localdomain>
	<1203247696.8272.63.camel@dax.rpnet.com>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 66.249.92.171
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Building a kernel with builtin initramfs
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
X-List-Received-Date: Sun, 17 Feb 2008 14:20:49 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Sun, 17 Feb 2008 11:28:16 +0000
Richard Purdie <rpurdie@rpsys.net> wrote:

[]

> The core devs have agreed pretty unanimously the recipe should be
> removed since they share the concerns I've raised. 

initramfs-image-ipk_1.0.bb
kernel-initramfs_1.0.bb

are removed. I hope there're no concerns regarding tasks I've added to
image.bbclass and kernel.bbclass - those are useful to allow
integration with external tools.

[]
> 
> Cheers,
> 
> Richard
> 



-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


