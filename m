Received: from [74.125.46.154] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1K7VuB-0006gu-MY
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Jun 2008 15:35:01 +0200
Received: by yw-out-1718.google.com with SMTP id 5so2776049ywr.42
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Jun 2008 06:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=XpbzIqf92T5pBfGHf7NueoD5JrLnoIspAadbBp6rABM=;
	b=unvDYY4oKZoxeF5/BXdV8WzyDhEz0Up/Rt3RZC8PI6gcyHwGg+ANd9qLyE9xHZLCGm
	Uh1c3lxmd72FmGgwiwrFdZ1l3c1nGviEp0M6pGr+Bcf94Kx9Lo9+YaDj7cR3VP23MxeI
	HVInAhNu/h8NmeFF0RwK/eMnmZV7KItFRbu8k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=toWUSz2o8YEc32gWBlMyoeCom6Pq6qtLNJA4NtW5AOKcCgmUXGDGMl0AaLYNOErP52
	bZK2bQAMUHi8Ds7pfT4s43SR6OGYNwsQLaDMDmTPpFv/MWqXeCcpnytPQUr0DczqSE8v
	DZftp4NQp1loTTrwcJW43F175BmJoN5t5uTQ4=
Received: by 10.151.106.7 with SMTP id i7mr6578970ybm.176.1213450474446;
	Sat, 14 Jun 2008 06:34:34 -0700 (PDT)
Received: by 10.150.178.1 with HTTP; Sat, 14 Jun 2008 06:34:34 -0700 (PDT)
Message-ID: <d1b08f940806140634k47bfb782hef80608e39e23c5b@mail.gmail.com>
Date: Sat, 14 Jun 2008 15:34:34 +0200
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <g305u5$jbi$1@ger.gmane.org>
MIME-Version: 1.0
References: <20080613225643.86B4D1881B6@amethyst.openembedded.net>
	<20080613231709.GB3606@cimmeria.hyboria> <g2vvg5$3hh$1@ger.gmane.org>
	<d1b08f940806140210o54897e92wbcf5e7962c0c49a3@mail.gmail.com>
	<g305u5$jbi$1@ger.gmane.org>
Subject: Re: [oe-commits] org.oe.dev udev-118: go back in time to udev-115 which seems to work slightly better on some Zaurus models
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sat, 14 Jun 2008 13:35:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Koen,

no evident problems == same behaviour as 118

could you keep an eye on the oebug 4118?

TIA

Andrea


