Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OvOei-0005GQ-Sf
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 08:06:19 +0200
Received: by gwb10 with SMTP id 10so1259814gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Sep 2010 23:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=aN3JsA86Usl9/6vDl3JGZ9yGBwBSJSpt4N/BWT/bmKk=;
	b=iTHetvGYW/pyFmYqKiLIXpmFobTQ7XPhZwxxLRauP4KDUu0kA6FqavHvyjRIsEZ3kO
	esRVfATNB7+TZHR0uNiFyFCu5O3PCCncK8o087x2mULO4Sp6WIxUWX0FmIb0Ukj91+L5
	oKY+HLykuwW3PZEtWRJlltXy8TCPnr/23o9qM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=KRATZllQQA7MQBL6G4/REICC33HX4G1WOm7VssXP+UEC8AaC+PyW0hJtLH1IGB1OgG
	Yls+Xil5Egc37yUUtd0zyKqvk6jM5TU8lu9Pfb07F2ooyug09gYXbpLuBi/0rgd+Sjtu
	fulXXv81GFQ3S5rT0kQYFG1W0cCSBxqoM/pEE=
MIME-Version: 1.0
Received: by 10.100.173.12 with SMTP id v12mr5523036ane.145.1284444322693;
	Mon, 13 Sep 2010 23:05:22 -0700 (PDT)
Received: by 10.231.205.204 with HTTP; Mon, 13 Sep 2010 23:05:22 -0700 (PDT)
In-Reply-To: <4C8EF6F1.8010804@gmail.com>
References: <4C8EF6F1.8010804@gmail.com>
Date: Tue, 14 Sep 2010 08:05:22 +0200
Message-ID: <AANLkTikrEGPM56nueYJvr-0qiSvh4LpHyH+HYXgA9yFK@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	=?ISO-8859-1?Q?=D8yvind_Repvik?= <repvik@foonas.org>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] foonas-init: remove broken and unused recipe.
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
X-List-Received-Date: Tue, 14 Sep 2010 06:06:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/14 Graham Gower <graham.gower@gmail.com>:
> This recipe has references to non existant files in its SRC_URI, I could =
not
> find them in the git logs either.
> A grep -r foonas-init shows no in tree users.
>
> Signed-off-by: Graham Gower <graham.gower@gmail.com>

I suggest to take this up with =D8yvind Repvik <repvik@foonas.org>
He is listed as foonas maintainer.
(although I must say that judging foonas.org it is quite likely this
project is having a break).

Frans


