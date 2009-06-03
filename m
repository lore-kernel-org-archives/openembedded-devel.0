Received: from [209.85.219.228] (helo=mail-ew0-f228.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1MBzXW-0000eo-Je
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Jun 2009 01:06:34 +0200
Received: by ewy28 with SMTP id 28so556424ewy.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2009 15:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Yn4LnOVAhkOfrFSDt4m/i3jMwWCJaSRSTa8W5/BpF0c=;
	b=uTAQFGwYdebW6eDDRjy38w9XfJqkU/QiHaa1X1EzA81130dUlabUA8mZrKK3In6NOL
	JZNrQpegAyEaXIU06lGBX5AFzNCezJYCfNSqvimcOCMJsAY3/fkSiC8DRFpGhfmn2KIL
	+13cZhJ7SS9YzGNjqqBIxOa6BQyXpXzht6uqw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=m0ZCKy14kJraS5Hp0KUXNGtyvSS93NV06VOPpALMYh4pkswkUh0Ue1ERTVtgUAEQOq
	UnSwn9kgngqiM9kpBDxDzQoo1fNN4JiryNWxzzMydRdO/jiU1lTI+aaYwfXVtJsUyYIU
	AHhJlDPw12uHvGElVs5CgDSJgENGwXJjtQ9qs=
MIME-Version: 1.0
Received: by 10.216.46.79 with SMTP id q57mr513984web.212.1244069853067; Wed, 
	03 Jun 2009 15:57:33 -0700 (PDT)
In-Reply-To: <4A26FB66.8020203@kernelconcepts.de>
References: <4A26ACDA.2060806@kernelconcepts.de>
	<1244060602.5049.64.camel@lenovo.internal.reciva.com>
	<4A26FB66.8020203@kernelconcepts.de>
Date: Thu, 4 Jun 2009 00:57:33 +0200
Message-ID: <d1b08f940906031557m1f6e803ax364b91fd56850f82@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] gtk+ and gdk-pixbuf
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
X-List-Received-Date: Wed, 03 Jun 2009 23:06:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Please elaborate how to handle such cases (hildon-thumbnail):

http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=6e13bf0bd8e0c147aabe7324df3a29ee338e2056

Patch to be reverted ?

Thanks in advance

Andrea


