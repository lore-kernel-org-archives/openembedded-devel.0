Received: from [74.125.46.157] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M8hDh-0003Tc-QE
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 22:56:29 +0200
Received: by yw-out-1718.google.com with SMTP id 9so1813447ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2009 13:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=wk+iWRWZlkLSHiUiGVuJjBP+r26rJzBrvZEY+/06GFk=;
	b=I0tm7qRsMWJug2dEajeHV5aNovRz2C32jF6Vu/knZpm3TBEPVBm0lM9mDCGaZcx6M8
	V8+9CeArj0whX7inQ+aCV9zLgUmyRKDsYDHw8ig5UjssKPTS/HkPB4eyg4gG/8dXqMh8
	2MLom+v17BRxed7VCY2BeqH/z3dr8B65mjQ8s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=NccQ5O01EvZMpUADfQNXA3oDB39CeOYeWpAVBuiOnL834u2TxqEdYwHQRvN8x/F4we
	4/fZRt2lo2Lnq8nh2NX1TSioeFFJwUIGgOoWivdvtAo1KI50hrw2gmH4h/aP4sTPiMZE
	L/kl2d5W4Px2Qga9fd8aDiqFeq+O3ERfnpgKI=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.207.17 with SMTP id e17mr12684411ang.137.1243284504735; 
	Mon, 25 May 2009 13:48:24 -0700 (PDT)
In-Reply-To: <fce2a370905251329t2cd85ef1m943dc9a61ba7f8a8@mail.gmail.com>
References: <1243189985-19060-1-git-send-email-ihar.hrachyshka@gmail.com>
	<fce2a370905250355h5edd949cq40bcb52882e1e623@mail.gmail.com>
	<be7a9f3d0905250931wbedccdfg9f8b0a0f562b6aab@mail.gmail.com>
	<1243270407.4869.57.camel@lenovo.internal.reciva.com>
	<be7a9f3d0905250959i19d01ebbr1b3b065f2135e294@mail.gmail.com>
	<1243272731.4869.59.camel@lenovo.internal.reciva.com>
	<be7a9f3d0905251157t7178a81ah22ff6ab699e2c5f2@mail.gmail.com>
	<1243281147.4869.64.camel@lenovo.internal.reciva.com>
	<be7a9f3d0905251322h27b36f0eyc780895bb05b50d7@mail.gmail.com>
	<fce2a370905251329t2cd85ef1m943dc9a61ba7f8a8@mail.gmail.com>
Date: Mon, 25 May 2009 17:48:24 -0300
X-Google-Sender-Auth: 8e55badb9d9bc738
Message-ID: <be7a9f3d0905251348y1a4753dfh2393e7207eb1d540@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Mon, 25 May 2009 20:56:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

On Mon, May 25, 2009 at 5:29 PM, Ihar Hrachyshka
<ihar.hrachyshka@gmail.com> wrote:
> Do you suggest splitting uboot-utils like "uboot-udevadm +
> uboot-utils" where uboot-utils contains udevinfo and udevtest? Or do
> you suggest creating separate packages for every udev* binary? What's
> your point?

uboot-udevadm + uboot-utils

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


