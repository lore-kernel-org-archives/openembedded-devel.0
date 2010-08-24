Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Onwo4-00058P-MP
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 18:57:16 +0200
Received: by ywa8 with SMTP id 8so1724221ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Aug 2010 09:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=jedanWgp4RhKtVH/qHKh6D0PCnjbgu+h1NBRcAkQ0Pc=;
	b=rLGBoUioXJHcEiuhX4rx2PHS4scYxsJu7Rm3N6Cpbbk3Ex6olwpqbmlpa4BIzUgyRn
	tDPCl/t/4W3VnEOD4/PsdQPOOpxoomS36Rc7+vQetYWW9dZsOMiLs9WwIL/1Hh3IUAXU
	i3M5hJ7vPGhinLfAZ8bCpb10+7FgDQzjIgjek=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=a5wSjet4lyec7wTSZYldUAECs1yO7YNNP9SbEmSHQrvmBWLODPi7I76goTo0bagT9b
	drgwrXUxjh1le2SbCyYpjYfKXCbawnYnRfYRc6BR2NZqcPm6cgXGf0utsPdV5rF1lA8H
	jR1WBJXNFpIcHoHOkW4/dywsAmjwGZx5H3Ozs=
MIME-Version: 1.0
Received: by 10.150.132.5 with SMTP id f5mr7054186ybd.417.1282668983748; Tue,
	24 Aug 2010 09:56:23 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Tue, 24 Aug 2010 09:56:23 -0700 (PDT)
In-Reply-To: <1282654258-31963-1-git-send-email-noor_ahsan@mentor.com>
References: <1282654258-31963-1-git-send-email-noor_ahsan@mentor.com>
Date: Tue, 24 Aug 2010 18:56:23 +0200
Message-ID: <AANLkTi=5eqeBTy8p2unpbp4mrHNXE8Fx=g6fGF+acpr3@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sgml-common-native: Convert to new style staging, remove do_stage()
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
X-List-Received-Date: Tue, 24 Aug 2010 16:57:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

tested and pushed. Also the other sgml-common-native one.
Thanks.


