Received: from [209.85.198.247] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1KOURi-0007zK-Uj
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Jul 2008 11:27:43 +0200
Received: by rv-out-0708.google.com with SMTP id f25so564759rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jul 2008 02:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=9/JAPw9WqVfN0K2Ok2pdu2Vk0p4yRzIV8xdZslzaN9I=;
	b=HYwfSbQBrhZi3Zz1h/cj9IvnWTpnhmIkzCLsBb0x8mF4ehJ0q6Bcgcfm72BaM+Txv5
	cChTAM/vQdIhMVcvt10PMIlwQwhlCqV3S66CH3M/c2huoSUYGSzJNVgobcNQUCzkowBm
	+SQRjrXK2v641EZz7MfBpP+ka0XxCGttUtG/A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=juEfL7QDbYyknQ2NU24dLndY0rm6fPp5esqd1lP7FWftXySwiaF4TshUuRTpJhgfLI
	0xr5K6Wpsan6uxuLp0XR80DvLanb7BiBlTDL2Ov6O2CJakjD9I+gOuNKwKuv1M6c3dkI
	hk8EPue1Dz98ND1ie6Jr5A0k0ivS5mXXypdEE=
Received: by 10.141.162.1 with SMTP id p1mr5150873rvo.39.1217496356648;
	Thu, 31 Jul 2008 02:25:56 -0700 (PDT)
Received: by 10.140.140.2 with HTTP; Thu, 31 Jul 2008 02:25:56 -0700 (PDT)
Message-ID: <d2b9ea600807310225n34987648w95899d9c75276f9e@mail.gmail.com>
Date: Thu, 31 Jul 2008 11:25:56 +0200
From: "Esben Haabendal" <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1CADFA951940554D86FBD8B24BBFF3A001C20F91@LONMLVEM08.e2k.ad.ge.com>
MIME-Version: 1.0
References: <1CADFA951940554D86FBD8B24BBFF3A001C20F91@LONMLVEM08.e2k.ad.ge.com>
Subject: Re: gcc-4.1.2 compile breaking in OE stable for powerpc
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
X-List-Received-Date: Thu, 31 Jul 2008 09:27:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi

I am using org.openembedded.stable for a powerpc target.
I am using a custom distro, using gcc-4.2.2 (although
gcc-cross-initial is 4.1.2),
and it works nicely without any patches to toolchain recipes.

/Esben


