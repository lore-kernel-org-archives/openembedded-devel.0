Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RsFyn-0006Yr-97
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jan 2012 16:50:46 +0100
Received: by lahc1 with SMTP id c1so77276lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2012 07:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=WfVr1KSAiQt2CAHSfZfLcgw+secn5sxgdIc/jNTrBI8=;
	b=clpWnSMiF4/pYiMdWC5ofQQVdC5cq31vtpd5bJ/Z4lGysNbVVEarRCzlipnf/AeSY5
	4r2je3Hi1PFG7O3/wNgoq52zTCw9KvXjQEmyZKaXTH/XIqRiVKphM4VZviv47kMBwsp5
	z7Er1OcLGFDqReqxnwf0SICtwTTDxCFLyljxA=
Received: by 10.112.86.67 with SMTP id n3mr5663469lbz.29.1328024571237; Tue,
	31 Jan 2012 07:42:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Tue, 31 Jan 2012 07:42:20 -0800 (PST)
In-Reply-To: <1328022931.3975.15.camel@mattotaupa>
References: <1328022931.3975.15.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 31 Jan 2012 07:42:20 -0800
Message-ID: <CAMKF1soF_UJCRyFui7Zm2Thi+Ja7U=Grb0E+Ay+ngFmqCnyN5A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Board support package (BSP) layers/distributions for Geode LX800
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
X-List-Received-Date: Tue, 31 Jan 2012 15:50:46 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 31, 2012 at 7:15 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Dear OE folks,
>
>
> searching for a suited build configuration for a Geode LX800 based
> system I could only find the discussion about creating a BSP layer for
> it [1]. Was this layer created? I could not find it anywhere.
>
> Additionally could you give recommendations which build configuration is
> suited for a Geode system? Especially with OE-Core as the base. Did
> someone test the latest OE stuff with a Geode LX800 system recently?

I think you have to create a meta-amd or some such.
>
>
> Thanks,
>
> Paul
>
>
> [1] https://lists.yoctoproject.org/pipermail/yocto/2010-November/002583.html
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


