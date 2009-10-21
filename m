Received: from [74.125.78.146] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eballetbo@gmail.com>) id 1N0WLr-0006p3-Ks
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Oct 2009 10:15:27 +0200
Received: by ey-out-1920.google.com with SMTP id 13so948516eye.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2009 01:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=38JElvLsQklhWOD7CXddC6I3U4gwuY+MsCSDMDQC3+Q=;
	b=DDtmK3k80G/oAboSw+b9jpeS2QQ1yHbiceO3kxrImahx81wwmTqPxhP0sbx49VFGzn
	Bh1yUjPLUH5gbRA0osGzwiKdAw1DhGiCtgqQp8TLp04lhJCIRaG+wnW4HieIZEZE9K2F
	SkSJaZIBUIBORI8w6EbziBcBXVAQqisr250eY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=uW3Qf5d6rPA9MOgb9in6k3fYFxcqHtIFDxrq3Kd4aBdy+IgN7phdzyaF1sF6lIfoVm
	RMho20+gpEzqwk4nnSY2g2b8ijmWwolC8+yKS+inM2ThgDr3l9PYmGsKBTqNSRyL0hJG
	CrtNmqTi2BCcBBh4Ds9E4+9UvaGjiDrBWtbC0=
MIME-Version: 1.0
Received: by 10.216.87.71 with SMTP id x49mr2670812wee.11.1256112861116; Wed, 
	21 Oct 2009 01:14:21 -0700 (PDT)
In-Reply-To: <hbk60j$m83$2@ger.gmane.org>
References: <afb7987a0910200214v11b56177w400fac16a87a09f7@mail.gmail.com>
	<20091020110625.GA25350@mi.fu-berlin.de> <hbk60j$m83$2@ger.gmane.org>
Date: Wed, 21 Oct 2009 10:14:21 +0200
Message-ID: <70c9a9110910210114y6a907cb3qc69564fea9c3b565@mail.gmail.com>
From: =?UTF-8?Q?Enric_Balletb=C3=B2_i_Serra?= <eballetbo@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.78.146
X-SA-Exim-Mail-From: eballetbo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: IGEPv2 with TI DSP codecs and GStreamer
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
X-List-Received-Date: Wed, 21 Oct 2009 08:15:29 -0000
Content-Type: text/plain; charset=UTF-8

Hi Andrea,

We are waiting if our patches for the IGEP v2 board are published on
the development branch of Open Embedded to be able better support.
Meanwhile, please ask your questions to

  http://www.myigep.com/forum

Actually, we are working with DSP TI codecs without problems but not
using Open Embedded infrastructure (or the same version as Open
Embedded uses). We intend within a short period of time
work on this.

Regards,

   Enric

2009/10/20 Koen Kooi <k.kooi@student.utwente.nl>:
> On 20-10-09 13:06, Henning Heinold wrote:
>>
>> Hi,
>>
>> you could try the gst-dsp stuff too. I didnt look at the repos, but I
>> think
>> it isnt in oe yet. trx google search for gst-dsp beagleboard.
>
> Gst-dsp requires dsp-bridge which we don't (want to) support in OE. It is
> mimicing the gstreamer-ti design, for which we do have working, supported
> recipes in OE.
>
> regards,
>
> Koen
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


