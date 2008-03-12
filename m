Received: from [64.233.184.224] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rodrigo.vivi@gmail.com>) id 1JZXJH-00051r-Ok
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Mar 2008 21:12:30 +0100
Received: by wr-out-0506.google.com with SMTP id 57so2581127wri.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2008 13:10:18 -0700 (PDT)
Received: by 10.114.150.1 with SMTP id x1mr7766210wad.109.1205352615869;
	Wed, 12 Mar 2008 13:10:15 -0700 (PDT)
Received: by 10.114.147.11 with HTTP; Wed, 12 Mar 2008 13:10:15 -0700 (PDT)
Message-ID: <bdb0025f0803121310t9af32d9hfb19b728ba1b4f91@mail.gmail.com>
Date: Wed, 12 Mar 2008 17:10:15 -0300
From: "Rodrigo Vivi" <rodrigo.vivi@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <fr997r$aat$1@ger.gmane.org>
MIME-Version: 1.0
References: <200803110807.11368.zecke@selfish.org>
	<20080311114938.GM30267@ibawizard.net>
	<f96d234e0803110712t6d88dfc6t521fdf39081e2c76@mail.gmail.com>
	<20080311145739.GN30267@ibawizard.net>
	<1205250588.4521.111.camel@dax.rpnet.com>
	<20080312014945.4783ae6a@widy.localdomain>
	<1205280598.16531.26.camel@dax.rpnet.com>
	<20080312024408.44d9192e@widy.localdomain>
	<c384c5ea0803121138r4bf89729t18c530b67e80c107@mail.gmail.com>
	<fr997r$aat$1@ger.gmane.org>
X-SA-Exim-Connect-IP: 64.233.184.224
X-SA-Exim-Mail-From: rodrigo.vivi@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: Reconsidering the work flow and how the SCM system fits in
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Mar 2008 20:12:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

>  I keep hearing people saying that they have no clue on how to setup a
>  git-server for OE where we can commit things as usual, while with hg
>  it's just 'hg serve'.

We have a Mamona git repository that we call by server where we can
push, pull, etc...
Aloisio has created it using a bear option that is a repository
without a workdir.

So I didn't get what you want... A database?

>  regards,
>
>  Koen
>
> -----BEGIN PGP SIGNATURE-----
>  Version: GnuPG v1.4.5 (Darwin)
>
>  iD8DBQFH2Cg6MkyGM64RGpERArCvAJ0ZOXNRysB3/I5HNJwuhto25TrXAQCffaad
>  VD7lvC0aO123KP3MOPDtweU=
>  =aHj0
>  -----END PGP SIGNATURE-----
>
>
>
>
>  _______________________________________________
>  Openembedded-devel mailing list
>  Openembedded-devel@lists.openembedded.org
>  http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Rodrigo Vivi
INdT - Instituto Nokia de Tecnologia
Blog: http://blog.vivi.eng.br
GPG: 0x905BE242 @ wwwkeys.pgp.net


