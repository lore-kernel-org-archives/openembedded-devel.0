Received: from mail-yw0-f188.google.com ([209.85.211.188])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NNeu7-0003wp-Rr
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Dec 2009 05:02:27 +0100
Received: by ywh26 with SMTP id 26so7802986ywh.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2009 20:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=FoCMFWmsZ0FWE/9FoiVrgJmbQ+G1MoUeX0i5VxA0AjI=;
	b=oilOxSN0FxugGVnbS5nAi5qn1dxONHi/h/+mhBuZd8Pm9+tRA+dlJSaiQL1cUcfD3X
	f7xVk9gHx8U8xAyZy8EE2sDsdZF1HI+knAFhu3Frwh7+ys7UDNZ8sevQtzrhPWsnFov+
	QUpFGi0Dc9IFXg5ZT3UWRYsGyVnLRlemyIHD8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=MqhNq2AsxHuhWXd/vU0UEjSeU1oiHfjCDZaopOsZBueIKRuB11JyRzRdO3HmFDGZXR
	lGw0z3sLY1idOzLU9FidsUCVR2o04ELXK2CdNxutIoV1/FHpeBcgeWxfN6IMpdUWcUHr
	GwkbWSrzq86YlFQoNCwBwX9fPD00s+VT0NPHU=
Received: by 10.101.168.1 with SMTP id v1mr2072396ano.196.1261627229926;
	Wed, 23 Dec 2009 20:00:29 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.69.101])
	by mx.google.com with ESMTPS id 23sm6812963iwn.11.2009.12.23.20.00.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 23 Dec 2009 20:00:29 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u5e34zgkmn1qzu@guohr-laptop-ubuntu>
	<20091224012752.GA25454@rhein.zuhause.netz>
Date: Thu, 24 Dec 2009 12:00:22 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u5fb2wagmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <20091224012752.GA25454@rhein.zuhause.netz>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.211.188
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: how can I upload my OE building failure information and log to tinderbox of OE
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
X-List-Received-Date: Thu, 24 Dec 2009 04:02:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

Works on my site. Great

=E5=9C=A8 Thu, 24 Dec 2009 09:27:52 +0800=EF=BC=8CHenning Heinold  =

<heinold@inf.fu-berlin.de> =E5=86=99=E9=81=93:

> Hi,
>
> the magic is the following putting into your local.conf
>
> INHERIT +=3D "oestats-client"
> OESTATS_SERVER =3D "tinderbox.openembedded.net"
> OESTATS_BUILDER =3D "youruploadername"
>
>
> Bye Henning
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


