Received: from [209.85.198.244] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1L8KCb-0004rE-90
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Dec 2008 20:49:33 +0100
Received: by rv-out-0708.google.com with SMTP id f25so4854213rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Dec 2008 11:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=Hi18tGbMV0JjivkSek9dxClkKo8y6CDSgg6U72pjASI=;
	b=qTAwo2cTIJmlrfsiGpKdhrAjGNPyRre9GzJ5vsIcx6GWMbzifsmIjrc6tDoP268qKY
	OwCCu+g1u4uKZXXQkw7UtBG4fO58LjDoydHtUA9+mIAhQO/1RPVEklqDvK7eRJEq+7HZ
	UsrIkmvlX7yf/Ck4FJwepp8noPzbkKwUkzX64=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=waLLs3rTAGC5NvIXUF5OXHWco7B1m8hLAGdnD6l+io8HJMnmJeBPxbE7zp5Ahosg3+
	aIPHI9f41omcy2UOt3np/8WgKdVID/Px0EjVCdu8U9Wh77V7msOniIaoU2zTe+KsmsFv
	Uo9vOf8+/XKwpPC07g/B+wnAEXEgX+RW9+rd0=
Received: by 10.141.69.1 with SMTP id w1mr7103254rvk.215.1228419957187;
	Thu, 04 Dec 2008 11:45:57 -0800 (PST)
Received: by 10.141.171.13 with HTTP; Thu, 4 Dec 2008 11:45:57 -0800 (PST)
Message-ID: <19c1b8a90812041145r117fabd8hcd9b507890d77d3d@mail.gmail.com>
Date: Thu, 4 Dec 2008 11:45:57 -0800
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20081204192759.GY16628@smtp.west.cox.net>
MIME-Version: 1.0
References: <20081204080249.GR16628@smtp.west.cox.net>
	<gh92ls$ip9$2@ger.gmane.org>
	<20081204192759.GY16628@smtp.west.cox.net>
Cc: openembedded-devel@openembedded.org
Subject: Re: gdb-cross-sdk hacking around gcc-4.3 warnings?
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
X-List-Received-Date: Thu, 04 Dec 2008 19:49:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> Tangentally, what're a powerpc / avr32 target that should build (I'll fix
> db1200 / MIPS if that's broken, again) ?

mpc8313e-rdb is what I have used in past.

-Khem


