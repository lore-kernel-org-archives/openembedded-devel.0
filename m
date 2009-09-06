Received: from [209.85.221.200] (helo=mail-qy0-f200.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bjorn.forsman@gmail.com>) id 1MkCtf-00062I-Sj
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Sep 2009 10:14:52 +0200
Received: by qyk38 with SMTP id 38so813695qyk.27
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Sep 2009 00:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=4VUGQD2/1MoLZbQiLSZuXlT2vpFxcaFZI0q2eARt58I=;
	b=tbf/S1U9RMfYh1Igq8oKDLZsVerbsniCU1CFNNlxsViQAkyAc6Z+CQzvRmRl9XSd2x
	RwnlYOpxj4O4RwT2aK36+qlmiPHKEqdE9t6+xgGPQlGf3EinN/4rudncG64uk/2tnnS6
	Z8d5PQk7OdKQ/6S51iEDvadxkvkZwXLdGWLPg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=sHQFK+AnjkpP9CL9RZZqC5FQ+/rtARt1rghJ2wyXQOdoKVRx2nGcZAi8wrtLSKvXSv
	fTWO0yxmHt5lfxBwi+D7wjwKI1iOPAOHu3n+0nzWCTreImh0jH2MTQy1DvouQkF5me8o
	2m+7+0lWIxd2NdxWBZTKjmgjnyWY7U36NGxZo=
MIME-Version: 1.0
Received: by 10.229.1.200 with SMTP id 8mr3645730qcg.64.1252223740746; Sun, 06 
	Sep 2009 00:55:40 -0700 (PDT)
In-Reply-To: <20090905214430.GA2048@rhein.zuhause.netz>
References: <5f2b60908120549u70fe6e00yf1df3e0e8d9bc059@mail.gmail.com>
	<h5um2o$ioq$1@ger.gmane.org>
	<5f2b60909030316q43cc1b60ic8350e68bcdb2a5c@mail.gmail.com>
	<h7o6gu$fii$1@ger.gmane.org>
	<5f2b60909030552q10d3c75eq4430bf504a8578c9@mail.gmail.com>
	<5f2b60909050958s6a7ce069l748516267e5f3059@mail.gmail.com>
	<20090905204542.GA6341@rhein.zuhause.netz>
	<20090905214430.GA2048@rhein.zuhause.netz>
Date: Sun, 6 Sep 2009 09:55:40 +0200
Message-ID: <5f2b60909060055r3d914aecs894d88fa3d1b4f6@mail.gmail.com>
From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: gstreamer-ti fails for target dm6446-evm (TI davinci)
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
X-List-Received-Date: Sun, 06 Sep 2009 08:14:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2009/9/5 Henning Heinold <heinold@inf.fu-berlin.de>:
> fixed now with revision fc84d991bc8895d9f6956c9281a01b9b6f0c9284

Thanks! It builds now. I'll start testing it on the dm6446-evm on monday.

Regards,
Bj=C3=B8rn Forsman


