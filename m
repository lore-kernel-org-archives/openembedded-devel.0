Received: from [209.85.198.250] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1KnFoC-0001tb-CY
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Oct 2008 18:53:16 +0200
Received: by rv-out-0708.google.com with SMTP id f25so5021994rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Oct 2008 09:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=YMLXBZQvQatXoJBGG2ao32FkVIQ2uNbviGHWOuVN7xM=;
	b=F0TR3srV2mHgdEyEhe8A19rTMS4WvpFDTTg8I3bgPRu13U6AH3T0/qmcY+uyl4rEjg
	xkuvFU26TBZdduJ6w1TQVfp3wpMp11z3ydfT4nc9lLGehxh/JZeaacUBsW76cC6FJmrt
	rjMe1pjU1SIoRdWbmN6/vVxJe5sn8VZy54eNc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=Ta5jezzQ2cZsO7/NIVolvFibccJX5tCI8M7zIG1Dej5lFLIPqioKKc+WLn+aRTHAu0
	hQHrorVFy+B0CNsaiuSbz2eDym8/57jGUBUovDjuJlliHG8jqPFh1rFAAjaqA5AY09wF
	60RG4xrc9hnwpwm9qesSHK9bQI1U2sUcuzGrI=
Received: by 10.141.79.12 with SMTP id g12mr4085217rvl.87.1223398120702;
	Tue, 07 Oct 2008 09:48:40 -0700 (PDT)
Received: by 10.140.204.9 with HTTP; Tue, 7 Oct 2008 09:48:40 -0700 (PDT)
Message-ID: <d2b9ea600810070948n5387bdcdp67296fbd0ce4abf1@mail.gmail.com>
Date: Tue, 7 Oct 2008 18:48:40 +0200
From: "Esben Haabendal" <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <87prmcbh0h.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
References: <c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
	<f2596b99780ea3954dc25884bf29704a5584c2f8.1223383759.git.eha@doredevelopment.dk>
	<20081007133502.GA19220@mi.fu-berlin.de>
	<87prmcbh0h.fsf@neumann.lab.ossystems.com.br>
Subject: Re: [PATCH 13/13] canadian-sdk.bb, task-sdk-canadian-host.bb
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
X-List-Received-Date: Tue, 07 Oct 2008 16:53:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

To make everybody happy, I have opened
http://bugs.openembedded.net/show_bug.cgi?id=3D4664
with all patches attached, and the local.conf I have used while developing.

/Esben
--=20
Esben Haabendal, Senior Software Consultant
Dor=E9Development ApS, Ved Stranden 1, 9560 Hadsund, DK-Denmark
Phone: +45 51 92 53 93, E-mail: eha@doredevelopment.dk
WWW: http://www.doredevelopment.dk


