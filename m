Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1PAA93-0001hD-B1
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 01:38:34 +0200
Received: by qyk33 with SMTP id 33so905707qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Oct 2010 16:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=hMlhY+04HeFAaAJhN7FB3n5pnO2wGs6bwnWnDA7hvFo=;
	b=iputi79jggaWlC5hStbJB39d00lepCWD/mtcrXuwwScIjRehOXFltcCZsGVnYMmkbQ
	RuOvePgCwfuqHtXQYV/oootjXx9KUXheU3bNZEBiBmMCZoRP81D3s2Qa8RjEeosv77sd
	2IgwBbu/AkcrTxZdA4+XkM4+jpR6A1nW1jP7s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=wHMUHabN3TypPHlJqpeTRgjMZqNRUi1qd/5NXEJ8AzJsaKgYAEvtKvtW1JEkP+fk/y
	nmMo93ZkaXO2M+CDk8wobOKEC8H6oHe3S69J1Ph0qR6S8rFZZVslpA9gWiAq3lVzE4It
	K9WjI4Q4FWHHaoJyBUvq0oaznMUOTXwISw5zc=
MIME-Version: 1.0
Received: by 10.229.75.77 with SMTP id x13mr5722254qcj.58.1287963471768; Sun,
	24 Oct 2010 16:37:51 -0700 (PDT)
Received: by 10.229.18.197 with HTTP; Sun, 24 Oct 2010 16:37:51 -0700 (PDT)
In-Reply-To: <E1P9vMq-0005nA-TN@melo.openembedded.org>
References: <E1P9vMq-0005nA-TN@melo.openembedded.org>
Date: Mon, 25 Oct 2010 01:37:51 +0200
Message-ID: <AANLkTinJarrVM+W14A+Mf_ZwF_OYMjJ7j5rX13O51iqv@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Frans Meulenbroeks : wvdial/wvdial_1.60.bb: removed unneeded EXTRA_OEMAKE
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
X-List-Received-Date: Sun, 24 Oct 2010 23:38:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

build breaks on do_compile after that commit

Needs investigation

Andrea


