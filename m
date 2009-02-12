Received: from [72.14.220.156] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay4mail@gmail.com>) id 1LXb1C-00064G-Ca
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Feb 2009 13:50:14 +0100
Received: by fg-out-1718.google.com with SMTP id 13so233273fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2009 04:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:message-id;
	bh=+o8I7UB6oRTGgeACIyPDg0uBhPaj5pmjraBQL1UpfQk=;
	b=AFMR8JfeY4J5X5NJ4q6D4mdvNyJ3rLouFexpk4uRMr0lJZVhwN/MgfIqtcR9/ubDId
	yEK0h1+fg/A2iqpqFMKblb9HrYrmeglAJN1yJg5sD4zQgAdRJqlhvLj0oXmqPMyT0aie
	MtBIrUREjDSApALyZBeJ871jiwuPzWXdn2YMQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:references:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:message-id;
	b=V93cGrrFom1kIyQaRq9UDmsIvoI0KO6Bu6g6aTIEIGjAGUoua3j62fq9QqN6UgIxH3
	ErsGK0jerpQlxK0MdUjVHsw1cGrfz2NUwDKExooactMSil2kx42q1O6oAAi2VNqyxyao
	Au5s9jsQHvKlRQS3yZQxNUxM2tP3ovdFuLkF8=
Received: by 10.86.59.18 with SMTP id h18mr1417450fga.5.1234442938498;
	Thu, 12 Feb 2009 04:48:58 -0800 (PST)
Received: from is.home ([93.81.136.171])
	by mx.google.com with ESMTPS id l12sm1605812fgb.51.2009.02.12.04.48.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 12 Feb 2009 04:48:57 -0800 (PST)
From: Yuri Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2009 15:47:47 +0300
User-Agent: KMail/1.9.10
References: <200902121426.26727.roman@khimov.ru> <gn12ij$ssf$1@ger.gmane.org>
	<4994132E.2040603@balister.org>
In-Reply-To: <4994132E.2040603@balister.org>
MIME-Version: 1.0
Message-Id: <200902121547.48057.jay4mail@gmail.com>
Subject: Re: [PATCH] Fix rpm2cio sums
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
X-List-Received-Date: Thu, 12 Feb 2009 12:50:14 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello!

> >> [ftp://ftp.freebsd.org/pub/FreeBSD//ports/packages/archivers/rpm2cpio-
> >>1.2_2.tbz]

This 
(ftp://ftp.freebsd.org/pub/FreeBSD//ports/packages/archivers/rpm2cpio-1.2_2.tbz) 
is a freebsd precompiled package, not a source tarball. It can change 
checksum after rebuild. All files in 'packages' dir are precompiled 
packages.

Source tarballs are placed here (in 'distfiles' dir): 
ftp://ftp.freebsd.org/pub/FreeBSD//ports/distfiles/

-- 
Yuri Bushmelev


