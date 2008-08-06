Received: from [209.85.198.248] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1KQeUf-0005ug-IH
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Aug 2008 10:35:41 +0200
Received: by rv-out-0708.google.com with SMTP id f25so3484449rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Aug 2008 01:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=JlMYtEkwewClY3CPHZQSIaw8M6QsuZveYZkz+Pf8ObQ=;
	b=xpvg49EQBDS9K9vcBi8kuVtzDgDtU8ixWEVnyJg9yvY3BFRFP85snVQFF74h7ekCbN
	Nw2QT52/qKbzBmnQXPlTMdPy+HPZBpVBOC9+lh3LmemWe/xy8US1zWsIPo+AzfYlhaic
	rqSkKeSjlGcIax2UXLtkUpYTujQwTO9u8+uqs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=uQZ88ciZhVeNkqy0NH9VqjYLsZPtEZn/2QpEnlTRT85IiuFSBrCiT8Es9bablarx7D
	+BxXRDOTEaGt6dTDEDCHck7VIZmbsB5R19wjPb37uI1SPaZ+YVCu8UgdKNypeQqyeq2v
	/5GonD9SMIlNRtyPWLfB8JHrognC6cyWH0mdw=
Received: by 10.141.176.4 with SMTP id d4mr8738419rvp.14.1218011736471;
	Wed, 06 Aug 2008 01:35:36 -0700 (PDT)
Received: by 10.141.156.18 with HTTP; Wed, 6 Aug 2008 01:35:36 -0700 (PDT)
Message-ID: <d1b08f940808060135q61084849s713b6762268d2453@mail.gmail.com>
Date: Wed, 6 Aug 2008 10:35:36 +0200
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <d1b08f940808060133l5c24d3f3w665361c418698e30@mail.gmail.com>
MIME-Version: 1.0
References: <bug-4393-13@http.bugs.openembedded.net/>
	<20080805144949.9FB8D189354@amethyst.openembedded.net>
	<d1b08f940808060133l5c24d3f3w665361c418698e30@mail.gmail.com>
Subject: Re: [Bug 4393] mysql-4.1.18-r3 fails do_compile
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
X-List-Received-Date: Wed, 06 Aug 2008 08:35:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Further findings on OpenWrt:

http://forum.openwrt.org/viewtopic.php?pid=46975#p46975


