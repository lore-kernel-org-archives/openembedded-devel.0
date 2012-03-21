Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SAKdO-0002KI-QO
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Mar 2012 13:27:22 +0100
Received: by vbbfr13 with SMTP id fr13so490322vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2012 05:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=gIuz6dM5lNDwRKij04HXoMDsiFMpYs+9yIlG6fvQGxQ=;
	b=RfiemdzfbkziBCT/WL1oN61bqJzHN/Z8wrfgOkE6TsheA5sC4Cj5iZCLl8tS6dC5qp
	0B8tCJJEyjCGoMtdFT0auj+AMHEBuiouZt3jo+NST5aUafDt5kvnsHih32aFl9Zxvbin
	TCkwZR3GlPtqRG89kYOYNHk8cAZCuf+nRydq5NTnFPNChqq2CEhhnSTdNM25kvMm2XZc
	Z9Vh6FxCu8A7Cy9COg/jTE5BnXYlQPX4KGDkLElxoJhl4KnTqmGJgm0WGOdD44w94sRM
	IwmeKfsn+3MGCjX87nRFEasVV9AK+wZs7FutTH7otRzQ7d3Q6ddIciY1M4BadzqSJ0lv
	aReg==
MIME-Version: 1.0
Received: by 10.52.71.80 with SMTP id s16mr1412640vdu.131.1332332308762; Wed,
	21 Mar 2012 05:18:28 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Wed, 21 Mar 2012 05:18:28 -0700 (PDT)
In-Reply-To: <jkcgem$agm$1@dough.gmane.org>
References: <1332263919-19283-1-git-send-email-koen@dominion.thruhere.net>
	<1332263919-19283-4-git-send-email-koen@dominion.thruhere.net>
	<CALbNGRRwoJ7MqVFdoCWQC5bmf+HgZD_QV1jUj2Q1nR-jXZWXfg@mail.gmail.com>
	<jkcgem$agm$1@dough.gmane.org>
Date: Wed, 21 Mar 2012 09:18:28 -0300
X-Google-Sender-Auth: eKzliiqnV3mU0Z81Rl8bWn0cE-o
Message-ID: <CAP9ODKrOarBHNbQwdFufzzSdDNKYKK49X8QTQ0bT0nzvtYEQaA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe 4/4] udev: remove 175
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
X-List-Received-Date: Wed, 21 Mar 2012 12:27:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 21, 2012 at 09:10, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
>> Could we wait with this until libertas works with udev >=3D 177 [1]?
>
> I'd rather live with the breakage so people are motivated to fix the
> libertas driver. Unless someone commits to maintain the 175 recipe, of co=
urse.

I don't see any strong reason to boost the move as AFAIK everything is
working fine with 175 for now. So I'd say to keep on it until libertas
is made working with the newer udev version.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


