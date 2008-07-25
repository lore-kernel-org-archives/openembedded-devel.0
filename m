Received: from [209.85.198.244] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1KMINb-0006tS-ST
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jul 2008 10:10:24 +0200
Received: by rv-out-0708.google.com with SMTP id f25so3388949rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jul 2008 01:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=2x7dYvSp2zFtMTYk2hSsvpGD/g2rDHA5MCc53PsMxvI=;
	b=BXQfShyctLHFuOAXlZHUeWoeN7EaCPh1QcVNYb72YnFZNvXTu4ybYiPORFCzIgDgqS
	YuMl55Htspc57TbsgF83l+rK3wpibtSu0HhBnIZWBkCrFtGbrApzLvbYQX+EwNZuU8yr
	wND7ViL4a9JQtNO86cDof3bWnvxKxDj2USt+c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=P9HALyeTo0Ln6SbyC5uo/sCiRUyvQcmLzlY75kgO0ospnol1en5o3fYjLXyyZIWUOM
	6Le5p5B787dKBoIp4UfEYl6O9oUA8ctS1NqcXzIiAGDnUgrDCbfucmX+F17z7Yrm0oXe
	nhgGZ8MkvKWqJMegnYhzEGQ+NSHWNWFB4qBQY=
Received: by 10.141.162.6 with SMTP id p6mr739219rvo.121.1216973344350;
	Fri, 25 Jul 2008 01:09:04 -0700 (PDT)
Received: by 10.141.41.9 with HTTP; Fri, 25 Jul 2008 01:09:04 -0700 (PDT)
Message-ID: <d1b08f940807250109g5f2a4dfeqf2e89fdd551fd8b8@mail.gmail.com>
Date: Fri, 25 Jul 2008 10:09:04 +0200
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200807250956.39492.openembedded@haerwu.biz>
MIME-Version: 1.0
References: <4889169C.7040108@gmx.de> <20080725030222.GC4715@smtp.west.cox.net>
	<d1b08f940807250044k51c6b1f8h9d5f976d83069a54@mail.gmail.com>
	<200807250956.39492.openembedded@haerwu.biz>
Subject: Re: RFC: kernel.bbclass and collie changes
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
X-List-Received-Date: Fri, 25 Jul 2008 08:10:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

>>while you're there please weak-assign too:
>>
>> KERNEL_IMAGETYPE ?= "zImage"

> Thats default set by kernel.bbclass

I meant in zaurus-2.6.inc

thx

Andrea


