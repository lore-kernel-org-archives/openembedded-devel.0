Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1M7cWv-0002zZ-U6
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 May 2009 23:43:53 +0200
Received: by fxm20 with SMTP id 20so1956308fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 May 2009 14:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=6Mr5xz9T/vFAroFGKdeYFWQKTyFqIyW7PaDi7hawYbg=;
	b=FRLfmhSIMRoxElCJs4PotILl1N+JpNLaFF8cYUVoMRT+G7av9D96JGXDcuW9pywbcW
	eCa6fUAUpB674+kySPQedVrGufEhdnetFfpmQwta+1N4B3KJA9LPeZfXYrgF/yKK7WJ5
	YDCdlcmCo4DNquDHVowrFS9F9tBjVhcip6+Ok=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=kIwBZ6/9lJ6mM7ohNE3SMXaU+Ft10zX5hec3MEopFYl97cOg+PLEBGXX6w5nHYZlLD
	DdFssrtX5r/yzX/7nbb5Kk1+wDGZTKLGPGZF4jimpCSQiXGSDXOwiQK8hp3+SWvX6GdG
	M5fhTxq0+EHRBYtk6xRi7UtXOc9Mi+vJevqR4=
MIME-Version: 1.0
Received: by 10.223.106.14 with SMTP id v14mr2586679fao.49.1243028168913; Fri, 
	22 May 2009 14:36:08 -0700 (PDT)
In-Reply-To: <c384c5ea0905211740w5f3c46f5g6c96919f8774636@mail.gmail.com>
References: <c384c5ea0905211455i5ba72709jc0b985cf097e9e3f@mail.gmail.com>
	<4A15EED8.7040709@dls.net>
	<c384c5ea0905211740w5f3c46f5g6c96919f8774636@mail.gmail.com>
Date: Fri, 22 May 2009 23:36:08 +0200
Message-ID: <d1b08f940905221436v3617e5dcua33dd6355fcfb8ca@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: madwifi: Aggressive revert of my aggresive fix :-)
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
X-List-Received-Date: Fri, 22 May 2009 21:43:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Wouldn't this case just need the magic of INSANE_SKIP?

My 2 cents

Andrea


