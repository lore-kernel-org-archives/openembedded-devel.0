Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Q5OWB-0002wf-6G
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 22:30:59 +0200
Received: by iye7 with SMTP id 7so3019053iye.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 13:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=rCZe1Mamt0bTyFJlSNm+1QcnJvcyo8npIbsk1uxgOks=;
	b=f/q+V+0MFsSEDMj73Pz1qEgS36edr+rixoKO6lezpwUtmRjPXhI1/tcBkHmwxWwITx
	AtPfCOV3dDVoGT07Ig3Bnh0LV0zeGWcvjekeWCBfT55e2pN8kEs2Kixy7yySIlR0rKzw
	52rPF1SEoLhz/lmRM4eXl2uGxciZpK0Hb4KL0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=UF5jH5l3o8n5jS7yKcGtX5QMlAVmDjw8ZEwNJ8HKAIix48mu9g8eh5qMlCbKf6q+R7
	EfdIB2nbC8awPu+7oCSio4OLn+5arzbqB73isR5Yt/fH1UVz4rgymZxCt9DtqMS/93C4
	CHMepa/ceuiSji3T2yXfcB2yU/hC1doeaupIw=
MIME-Version: 1.0
Received: by 10.43.60.65 with SMTP id wr1mr3838449icb.323.1301603337546; Thu,
	31 Mar 2011 13:28:57 -0700 (PDT)
Received: by 10.231.43.6 with HTTP; Thu, 31 Mar 2011 13:28:57 -0700 (PDT)
In-Reply-To: <4D94B00B.6040006@mentor.com>
References: <20110331074506.GB23178@denix.org> <in1gf0$aun$1@dough.gmane.org>
	<AANLkTikn4r-ScRstfT_r-Adw36=682MEb_XHMKn+qs3_@mail.gmail.com>
	<4D94B00B.6040006@mentor.com>
Date: Thu, 31 Mar 2011 22:28:57 +0200
Message-ID: <AANLkTinVCCLh2qmZg45GMWwZu7hDDP7=QGJwhm3ZyRLa@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance] Pull request for new TI machines, angstrom and qt4 fixes
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
X-List-Received-Date: Thu, 31 Mar 2011 20:30:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/3/31 Tom Rini <tom_rini@mentor.com>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 03/31/2011 03:51 AM, Frans Meulenbroeks wrote:
>
>> Adding new machines on a maintenance branch seems somewhat odd as new
>> somewhat conflicts with maintenance.
>> is this what we want? And if so, what about adding new recipes?
>
> To be clear, I do not have a problem with backporting support for new
> hardware nor support for new recipes to 2011.03-maintenance so long as
> (as stated on the wiki page) they are first and foremost backports and
> secondly something the the users of the branch desire.

Tom, Philip, thanks for your explanation.
As it stands we have no backported patches yet, but they might show up.
Koen's rude reply mostly vaporized my interest to contribute (and
instead keep my patches locally), but your reply at least encourages
it to reconsider.

Best regards, Frans.


