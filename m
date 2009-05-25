Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1M8XwN-0007ko-Pb
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 13:02:00 +0200
Received: by ewy20 with SMTP id 20so3086188ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2009 03:53:58 -0700 (PDT)
Received: by 10.216.36.84 with SMTP id v62mr1588428wea.128.1243248838252;
	Mon, 25 May 2009 03:53:58 -0700 (PDT)
Received: from ?192.168.1.10? (94-193-93-235.zone7.bethere.co.uk
	[94.193.93.235])
	by mx.google.com with ESMTPS id 18sm7828637ewy.93.2009.05.25.03.53.56
	(version=SSLv3 cipher=RC4-MD5); Mon, 25 May 2009 03:53:57 -0700 (PDT)
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <gvdrl3$h2c$1@ger.gmane.org>
References: <1243189985-19060-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1243189985-19060-2-git-send-email-ihar.hrachyshka@gmail.com>
	<200905251125.45665.marcin@juszkiewicz.com.pl>
	<fce2a370905250254p4c51b706q399b14d9b0bb20e5@mail.gmail.com>
	<gvdrl3$h2c$1@ger.gmane.org>
Date: Mon, 25 May 2009 11:53:55 +0100
Message-Id: <1243248835.2963.3.camel@xora-desktop.xora.org.uk>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 (2.26.1-2.fc11) 
Subject: Re: [PATCH 2/2] udev: moved udevadm to the main udev package
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
X-List-Received-Date: Mon, 25 May 2009 11:02:00 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-05-25 at 12:24 +0200, Koen Kooi wrote:
> PS: mdev users need to start thinking about how devicekit and 
> util-linux-ng will integrate into their systems, since the hal world 
> seems to be moving away from hal to libudev + util-linux-ng
> 

I think the mdev market is for devices not using hal/devicekit to boot.
Personally I think if your trying to replace udev with mdev on a device
that still need hal/devicekit for dynamic devices your probably peeing
into the wind!

Graeme




