Received: from mail-px0-f183.google.com ([209.85.216.183])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1NCtKd-0007jc-Ro
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Nov 2009 12:13:19 +0100
Received: by pxi13 with SMTP id 13so4510849pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2009 03:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=PkSFiLZ/fCTbD+GeZIz9N2U5hi/BQfBExdsSYy2WiM8=;
	b=an+1aib2m+60toCSnQf99R9H25zeUiaU8kaD+XBUWqOdDPqALpk4yX4lj+SmXTvqUu
	Vm5uGqMKBOKt+66YuWYmGNwnHmxGEelkBPIXS3SWU2dyV6Qc/PjEuzIDlq72ecfLdSEV
	fz88Kou/Ck7Rs6Q/NEUwPMADmS+pIv4wVh8/A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=TbL/omB9VYAMS9eLgVUoCTrPw+L/ck5ZYp9glhX+KmZZKdvAVXiXlycqRbbrBcMWqL
	JfHdtv8xJvWaW2Oggs9Hd7sbEIlZIBl6x37FBoTrV3SvwJhryS/SXDt1gEZk1+Fw9PY4
	1cgfo0r0YxeSt2RKbZpOFFUbIyAZ7kSFAam0I=
MIME-Version: 1.0
Received: by 10.142.2.24 with SMTP id 24mr626571wfb.139.1259061106359; Tue, 24 
	Nov 2009 03:11:46 -0800 (PST)
In-Reply-To: <heg84r$lhh$1@ger.gmane.org>
References: <heg84r$lhh$1@ger.gmane.org>
Date: Tue, 24 Nov 2009 21:41:46 +1030
Message-ID: <6ec4247d0911240311x4e758d1ctd6a0295b10510aa6@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.183
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Custom handling of ipk upgrade conflicts..
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
X-List-Received-Date: Tue, 24 Nov 2009 11:13:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

It sounds like something that a preinst script would be suited to.

Could you elaborate on the custom merging that you wish to do?

-Graham


