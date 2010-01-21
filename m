Received: from mail-ew0-f224.google.com ([209.85.219.224])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1NXyqU-0002tw-Sm
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 16:21:21 +0100
Received: by ewy24 with SMTP id 24so74155ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 07:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=Spd2PcD7jQdI+bo64Vo8bnK/lui06E65ZSrVhhiMQKw=;
	b=E5LaHnlqq2OwFZ5PC95bulRrzXDI+gBafu39oiwe+jAlGoMPBIHZd8Ph7os5UAGDZN
	ppijH97tMHDrfXiYDxxnoPdp02cQfmMOwgm/tNbCOO0WOvVu63jxKumqeN3AwXYigsmF
	SKPAw2K1FNfM8JZekV2fM2Y49jtrk8I6JH+bI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=wZanytYSHkhhU0+dqYid1R2U7NNkTJYcb32ko2z70J792qu+35JfVhu5THZV5nJIPf
	EjMY802Y2LWKIxAw06bDMAklwbgptFrvdcyeUUIBBeX6ZrectkuPEYziBszMrSWS/yfU
	yl4+NeJa0zEwpzZYqX+4LlEd5zWPqbildysN4=
MIME-Version: 1.0
Received: by 10.213.1.132 with SMTP id 4mr2395824ebf.11.1264087139700; Thu, 21 
	Jan 2010 07:18:59 -0800 (PST)
In-Reply-To: <BAY127-W59B276E6FE9342A67201CD8630@phx.gbl>
References: <BAY127-W59B276E6FE9342A67201CD8630@phx.gbl>
Date: Thu, 21 Jan 2010 16:18:59 +0100
Message-ID: <d1b08f941001210718u47fec267g35eefd9c9c0c33af@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.224
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: problem in building console-iamge
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
X-List-Received-Date: Thu, 21 Jan 2010 15:21:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

>>BBFILES = "/oe/org.openembedded.dev/packages/*/*.bb  /oe/ossie_collection/packages/*/*.bb"
This seems wrong

>>NOTE: Handling BitBake files: \ (0014/0014) [100 %]
In fact you get just 14 items...

Dunno about ossie, but in openembedded we moved from 'packages' to 'recipes'.

Regards

Andrea


