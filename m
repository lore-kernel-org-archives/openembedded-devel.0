Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OykQQ-00018M-O1
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Sep 2010 13:57:19 +0200
Received: by wwb17 with SMTP id 17so951609wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Sep 2010 04:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=q6WltuRqHTL7pcEBB7xMWeRN2Yqx+qFGhfXYEpFHj7k=;
	b=YfIMXGFPS0jGKqEL5dRk6xBp1279qs0SUEhINAKWvalPc0CI7yFJi0vK+TPvXHh3wn
	B2mxSevVDZ7nItJ2c6yjbkRGdiF8Wcp9PXLW2VeX0w0Vz3OBZKbImmXcocCrfmwBSvDf
	UdnNX7AFkbVbwgETaUf1pZRiSI8RUN87nEHiY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=mM/PWoQZg7oLAD8EjGUyb685JN09+3b7Pho3zHMIYa7H7JClL/Q7auOImakCcRWRCE
	Jz1SD0k8R1lfvUo9bIotm0KbqjjDjMTrx4fxxTLSzC8UJJimVXRj7oj5LCVSOJ//XpMx
	KbDhLSvsK3IC6TJh1iVu+kBJYcRK9HfXVgpAM=
MIME-Version: 1.0
Received: by 10.227.135.211 with SMTP id o19mr1503958wbt.73.1285243032759;
	Thu, 23 Sep 2010 04:57:12 -0700 (PDT)
Received: by 10.227.144.69 with HTTP; Thu, 23 Sep 2010 04:57:12 -0700 (PDT)
In-Reply-To: <AANLkTin-D__XnhkP3ZDjtW0K5hN0QyY0Zkd6sXd-XGsd@mail.gmail.com>
References: <AANLkTikDibG-qAf2b9U_OuOLbVXNP8QWouTEN7z_v25_@mail.gmail.com>
	<20100921152505.GB3403@jama>
	<AANLkTikTrRMX-5UAso2BgJ8-XqhwtXTnS_vT2Yt4FNnc@mail.gmail.com>
	<20100921154038.GC3403@jama>
	<AANLkTim9cs7=eKAV1T2ZWTd1HgAaXrxDUdcLUT8RahUF@mail.gmail.com>
	<20100921203711.GF3403@jama>
	<AANLkTin-D__XnhkP3ZDjtW0K5hN0QyY0Zkd6sXd-XGsd@mail.gmail.com>
Date: Thu, 23 Sep 2010 13:57:12 +0200
Message-ID: <AANLkTi=3ibuLsfFfbhtF-kkpKvEjP3rsSDRz4bQtWC=x@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: anyone working on recipes for qt 4.7.0 released?
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
X-List-Received-Date: Thu, 23 Sep 2010 11:57:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

>>> We'll move on to the 4.7.0 released stuff next.
>>
>> Looks like same issue as with demos/browser fixed in:
>> recipes/qt4/qt-4.6.3+4.7.0-beta2/demos.browser.add.mediaservices.lib.patch
>
> I have pushed a branch with my work so far:
>
> http://cgit.openembedded.org/cgit.cgi/openembedded/log/?h=cbrake/qt-4.7.0
>
> currently getting compile errors:

pushed fix for those compile errors to your branch..
feel free to replace qt-4.7.0-beta2 in org.oe.dev branch with this as
qt4-x11-free works as fine as with beta2 (afaik)

Regards,


