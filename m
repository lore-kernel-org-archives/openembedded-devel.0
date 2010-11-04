Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PDziC-0007Cd-Pz
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 14:18:41 +0100
Received: by ywo7 with SMTP id 7so841017ywo.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Nov 2010 06:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=enu0N8wfQYpq4vyrKrseL0+vqz+7D3RHMNYCTiOEKAg=;
	b=EUU4qrJ52hU2e4dJ1/95HntIJ9eOA49cp0X3idSRGuVvQ8DM7H70VQvGmSrzNOnJub
	OcDr/UZGnpJ0MtPyCjWLR54PB1qKvEKmk4UBApB+uDVwrlH56GZh/VZsfAO2P1Sf9w2h
	X/cuvvpDhUCqeFSLzQ40NIC76iS11O5IqCWvg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=LkPLD4OGSD7L477RABUERKJl60vP6RCFyk2RXsxYfriF5srf8sXXkwxSBggpvGndI7
	kViL2P2R5amCmi3csB5QwWpLnoJPfdTvCg9tjEMEiGvXPZum2h3WWj5szH87pe5ibXQ1
	9opxmF5UNMX+9WetweWf8ZuJxzO8BBhVopFAg=
MIME-Version: 1.0
Received: by 10.42.74.137 with SMTP id w9mr344453icj.201.1288876668481; Thu,
	04 Nov 2010 06:17:48 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Thu, 4 Nov 2010 06:17:48 -0700 (PDT)
In-Reply-To: <AANLkTinLp2jLhp1QCs8YdUXtSg7rXgq-TMK_8_vc8dSO@mail.gmail.com>
References: <20101104082759.GG19934@excalibur.local>
	<AANLkTinLp2jLhp1QCs8YdUXtSg7rXgq-TMK_8_vc8dSO@mail.gmail.com>
Date: Thu, 4 Nov 2010 14:17:48 +0100
Message-ID: <AANLkTinQPXEC9=nNu6=Ea0qd8Ly-Qpaa6Aboo8jF1HL3@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Patchwork cleanup weekend in two days
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
X-List-Received-Date: Thu, 04 Nov 2010 13:18:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

Oh, one more thing,

Of course it is not up to me how you guys spent your time, but if
there is time and interest left after going through patchwork it would
be nice if people could also have a peek at bugzilla and/or peek at
the recipes that do not even fetch any more (see email from Martin
from april or so).

Have fun (& thanks for the effort!)
Frans


