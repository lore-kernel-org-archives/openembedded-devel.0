Received: from [209.85.217.20] (helo=mail-gx0-f20.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rodrigo.vivi@gmail.com>) id 1KssIR-0004IX-EL
	for openembedded-devel@openembedded.org; Thu, 23 Oct 2008 06:59:43 +0200
Received: by gxk13 with SMTP id 13so9739379gxk.12
	for <openembedded-devel@openembedded.org>;
	Wed, 22 Oct 2008 21:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=Wn9jXP2O/iiQhiXLb0Bf8m21ViArDK/Nmd1xL5Di7qY=;
	b=CpgUy2D5IvrY/tzD1i2vIRpQyGw0Z3KZ7YuebfEH6P0ICxt9uqfU8/XTKIexL3imzp
	S+ZzckHOv268hesJsvdhqfNLBgtetKG6y0LAEBQDk9sv7IeUbgtWJq3Ivh0VDmup7mUJ
	VtnAI+5uEsH2LoLZRNwo2Xy8a3kz54WaUSWcU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=gvB748XOf8u+u1bWzizE/dIsG2TSczJew9kPFhY23RdR1mu0FRMcF+d0TIIFBu7WBg
	Ib+MytBgMYPOmou7yJ4/JHe+Hp4gfhhUXjeQIVqzxQF2PFbAid80fK6mV7KM+i1NvCCD
	IAiNGkGSe6q7PX1Lan9p5ZuEU7bVDXnHL018E=
Received: by 10.100.108.9 with SMTP id g9mr68225anc.137.1224737951911;
	Wed, 22 Oct 2008 21:59:11 -0700 (PDT)
Received: by 10.100.105.13 with HTTP; Wed, 22 Oct 2008 21:59:11 -0700 (PDT)
Message-ID: <bdb0025f0810222159ka9b7ab7q4088bd6a241e477a@mail.gmail.com>
Date: Thu, 23 Oct 2008 01:59:11 -0300
From: "Rodrigo Vivi" <rodrigo.vivi@gmail.com>
To: openembedded-devel@openembedded.org
MIME-Version: 1.0
Subject: pushing mamona things upstream
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
X-List-Received-Date: Thu, 23 Oct 2008 04:59:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi guys,

I'm afraid we from Mamona are in debit with OE. It has been passed
long time without sending our things back upstream.

But now that git migration has finished it will be easy to work closer.

My plan is to send directly all patches that change mamona packages,
tasks and configuration. This shouldn't break anyone's build. (Get
prepared for an avalanche of commits :) )

After that it will be easy for us to see what we have different. We'll
put these differences in a table and ask for permission by email or
reporting a bug.

Any concerns?

Cheers,

-- 
Rodrigo Vivi
INdT - Instituto Nokia de Tecnologia
Blog: http://blog.vivi.eng.br
GPG: 0x905BE242 @ wwwkeys.pgp.net


