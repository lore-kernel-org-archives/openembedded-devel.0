Received: from [74.125.46.152] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1Lo3zZ-00066N-Il
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Mar 2009 01:00:37 +0200
Received: by yw-out-1718.google.com with SMTP id 9so1201195ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Mar 2009 15:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=FHSw8PoGJs8d1OnhK+hgbm92/VXeqGaWQR/yew/6zbQ=;
	b=lrTc345XFRjrkFCW+dw7c7y3EZsGy0fa2SVECop8E0XTjQLCYmbrD6+eAu1FauF0rw
	sgL6Q/P+29XjPDPbTRUVJafsV+iWi+ggz+8W8LI34MwiYZC30feLY2SzcCq344/BYvTV
	cAuWGl2bxGflm3QIdrBC78+96U3KjEp/r+B5o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=mk/JqF6XvkmEpITxtCeZ6SQs67SfybKFXevgZlMMJS99VAuRw5HdsUQfOcgldM9jL/
	lJfCFTWLkPOIJjYG3RoBgXS1gEKC+wr9rm34KuSprRMbn/3fVrt/cMPdnP74Mzc7UFbs
	0Jz1KRZo5OL3yD5wv41OfaxeuGa70GZvDDDX8=
MIME-Version: 1.0
Received: by 10.151.11.19 with SMTP id o19mr9260434ybi.58.1238367514962; Sun, 
	29 Mar 2009 15:58:34 -0700 (PDT)
In-Reply-To: <d1b08f940903291528i4fcd7139rc7d3cee88dd315d5@mail.gmail.com>
References: <1233319034.13141.2.camel@EPBYMINW0568>
	<fce2a370902030302m1054bfc5wc5589ed60418c959@mail.gmail.com>
	<gm99v0$ier$1@ger.gmane.org>
	<fce2a370903030755n133906a3i32a25df5390d537@mail.gmail.com>
	<d1b08f940903291528i4fcd7139rc7d3cee88dd315d5@mail.gmail.com>
Date: Mon, 30 Mar 2009 01:58:34 +0300
Message-ID: <fce2a370903291558o335ef90bj5ac7e23203f3d7a4@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Automate uboot entry/load addresses detection.
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
X-List-Received-Date: Sun, 29 Mar 2009 23:00:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Maybe I don't get it, but why do you need to send the patch on the ML
again - with your own credit stuff?

2009/3/30 Andrea Adami <andrea.adami@gmail.com>:
> Hi, I've tested the patch and it seems to work.
> Thanks
>
> Andrea
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


