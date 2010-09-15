Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ovz55-0007mm-Av
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 22:59:53 +0200
Received: by gxk10 with SMTP id 10so221944gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Sep 2010 13:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Wad8iMDJOWffc6FhwfR3hDf5FV3cugQmTSnk4x2qxoc=;
	b=jBsrHfeYB82+yZ7SZs6iHWTlduKjCMtmO1xeBsDOG/sCf1D0/DAqr4z9kMnUmJ0qZB
	475jJbKDJthhq/Ti64nQd9UnkHWWRBE6mFeM06tEqLtwb196uS1nGjA+1ONSc6Hq1Na4
	Umq9sN7aaaHv4Oyy/lkWDIl7NqJ5DX8B4b/ak=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=L3LQP8iveVPkUsIzb1YnAJ3ZzGNRMV9B84+PLKVc6yLiDerPX/JuXGd9GEa3a9ynjy
	v+EBB8lBZetepvS6TlUHaP0+XA4RdZf5iDatUXndROPCTLhBiTz8di8O9fsFeAb0vCDR
	SHs6FyQwfmAh17JwHdnNUmd5k3HNT0LiPBZcI=
MIME-Version: 1.0
Received: by 10.100.196.9 with SMTP id t9mr2436799anf.109.1284584333879; Wed,
	15 Sep 2010 13:58:53 -0700 (PDT)
Received: by 10.231.205.204 with HTTP; Wed, 15 Sep 2010 13:58:53 -0700 (PDT)
In-Reply-To: <AANLkTikYsro5b_6S9NKSyPWC0DMMr9A9zKyL0qXF53Zs@mail.gmail.com>
References: <AANLkTikYsro5b_6S9NKSyPWC0DMMr9A9zKyL0qXF53Zs@mail.gmail.com>
Date: Wed, 15 Sep 2010 22:58:53 +0200
Message-ID: <AANLkTi=-fU5zDiXu0P7Rj=nz0m985qd2hJDcdCJ3s+Bu@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: melo git outage
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
X-List-Received-Date: Wed, 15 Sep 2010 20:59:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/15 Tom King <ka6sox@gmail.com>:
> In approximately 1hr 21:30UTC I need to rsync the server to create a backup
> and perform an upgrade to the melo server so that we can add some additional
> functionality.
>
> I suspect that the rsync and upgrad will take approx 2-3hrs (to fix things
> that break)
>
> Thanks,
>
> ka6sox
> (for the oe infrastructure team)
>
Thanks for the notice and thanks for the good work!

Frans.


