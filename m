Received: from [209.85.220.209] (helo=mail-fx0-f209.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1N7pDZ-0008VY-EY
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 12:49:04 +0100
Received: by fxm1 with SMTP id 1so1650748fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2009 03:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=jEGvfRiDGW6XG+cqjso1UaCUV0u0V64g0oqzZ5aWYnM=;
	b=KK6GdmSEJm2AzCwsvGUiOYkSV2hySiLrxasDmFOw+1pY/TThzMaG3rMzeo0vncVOxo
	SQogoEXDn9tEbTz9dYg5kmytmjmcHqwVSVf+kJNc6xI1f4/jB2Uud0J5WWYypdXlbsug
	kJtSZ+//dM/ki0ml3w+oB7jm+gJ8WHv18Vk5E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=Dw/vs2wsMXy5XJtglCvhrKgXO1P1G/O+lwTgin5K6gMpgVhTZPD236H68LZXcI1o1y
	a/l0TIxMXNQ8k5luNi/uggu/Yfb7T+/Ae/qUHIt36G7Orc5bD6srgBuG2c3YbcjiM/sa
	5x57gYjQ+DAH6UwoXKAupPfhTolOicUrLsEmg=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.139.156 with SMTP id t28mr920155hbt.33.1257853664174; Tue, 
	10 Nov 2009 03:47:44 -0800 (PST)
In-Reply-To: <1257852957.1484.72.camel@mill.internal.reciva.com>
References: <1257762970.29038.40.camel@dax.rpnet.com>
	<hdaeo3$9l5$1@ger.gmane.org>
	<1257852957.1484.72.camel@mill.internal.reciva.com>
Date: Tue, 10 Nov 2009 09:47:44 -0200
X-Google-Sender-Auth: 0dd9d248079c1245
Message-ID: <be7a9f3d0911100347h2099e088hed77f7b90b1f8b93@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.209
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OEDEM - Summary of some the outcome
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
X-List-Received-Date: Tue, 10 Nov 2009 11:49:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Nov 10, 2009 at 9:35 AM, Phil Blundell <pb@reciva.com> wrote:
> Remember that bitbake doesn't need to be installed (into /usr or
> anywhere else): you can run it directly from a checkout in your OE
> working directory. =A0That ought to be a reasonable stopgap for most
> people until the distributions catch up.

This is how I use it; in fact I use a git clone :-)

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


