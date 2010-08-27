Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OoxoJ-0005NG-M0
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 14:13:44 +0200
Received: by vws13 with SMTP id 13so6045vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 05:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=FsDSnUAtUashJ/fN5QqOgQ17roh3rFXHnljRF3YVZxs=;
	b=Aq7xku4ynTrcZ//Zn7chWsH+CBwZKQA54e66JrzDyeWSOEAYRm28/8/ezmYUaWh1Sh
	QlN7EXrY7fJw0jZb+V+6l0/Yl6IJZhpd0G98BohgbK9CWBtrPcrkERwDZj8Ig7f89RLT
	A02+W9/Q6Nr/gTvIv73XzQ0tpUMLsfxBHPC9Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=rGvWE7MjsXl0Fv+FwUBoQFTTIykiqTKlv92ZHSBRUqgwrVecx8wP2VrkgCOmkCadF9
	5aCaOHCIKK3J0ZdEl4AJEtJT7QNTOB2k6DHy6qYEwaMyn6s1hXJJaLZuvI11wQmkFau6
	x899O7rcwJAzj4pKu3ZRs7LLcoyFjnycE+EbM=
MIME-Version: 1.0
Received: by 10.229.224.149 with SMTP id io21mr433370qcb.160.1282911180959;
	Fri, 27 Aug 2010 05:13:00 -0700 (PDT)
Received: by 10.229.27.204 with HTTP; Fri, 27 Aug 2010 05:13:00 -0700 (PDT)
In-Reply-To: <i586bt$t12$1@dough.gmane.org>
References: <1282896714-3167-1-git-send-email-raj.khem@gmail.com>
	<1282896714-3167-3-git-send-email-raj.khem@gmail.com>
	<i586bt$t12$1@dough.gmane.org>
Date: Fri, 27 Aug 2010 14:13:00 +0200
Message-ID: <AANLkTi=o=4pS4tLrhXErembiZ5j4ye+EzAk91yc02rya@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] recipes: Update recipes to get 'bitbake world' parse and calculate runqueue successfully.
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
X-List-Received-Date: Fri, 27 Aug 2010 12:13:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

>> =A0recipes/udev/udev-compat141_141.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A06 ++-
>
> NAK
>

This one is an hack in progress, needed only for Zaurus until 2.6.36
(hopefully).
Please keep ;)

Andrea


