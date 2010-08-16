Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ol5vB-0002gn-70
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 22:04:37 +0200
Received: by gwb15 with SMTP id 15so2144193gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 13:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=KrCdTLb3zOy/LAVTrYSsFjLejcE7QIsDmcWYsgFtFT8=;
	b=cK0hmezTRB51ZxTVqG1VzWkiQ3EwiG6kyiaelkdVQjLM5lohGxXfQDz4VUKCJoDtY7
	pVU9so9vJ9c/fQSIfTg0OT591BhpRmoySHN6R/nepEIen/VZ6FPEHG/7ZyLdkn6Zi5/r
	Ftae3PX2f3D9a2UrnzqDMbwxfm7xoJFmoUg8A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=D291oUZVUX6nXw06LEC4tx+dEIw4ZRDve5uLXlAYZVTEShAUL2jslhkfFw7kRAIVIf
	AGT+RAk7sYLhoSoPYHUALDg7BujPUtej0IoO1sCyk0cJG+PkF017F5gLtub7bybgIpWS
	hR3YWjHR7nKJnVpN60OgRg6zNKxqnuMTXPQxs=
MIME-Version: 1.0
Received: by 10.101.176.2 with SMTP id d2mr6468603anp.101.1281989059486; Mon,
	16 Aug 2010 13:04:19 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Mon, 16 Aug 2010 13:04:19 -0700 (PDT)
In-Reply-To: <AANLkTik3NJf+OF=Eobbmq1iKPdwzj87zmeWF6h6e9GhD@mail.gmail.com>
References: <1281963140-29565-1-git-send-email-fahad_usman@mentor.com>
	<AANLkTik3NJf+OF=Eobbmq1iKPdwzj87zmeWF6h6e9GhD@mail.gmail.com>
Date: Mon, 16 Aug 2010 22:04:19 +0200
Message-ID: <AANLkTi=zaSuDL5LCGAxcmV3tLK7recDUzwW96mf=Ly-t@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] dcopidl-native_3.5.8.bb: Removed legacy style staging
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
X-List-Received-Date: Mon, 16 Aug 2010 20:04:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

Tested and pushed the patch.
Thanks for your contribution

Next time if you create a new version of a patch, can you please add
v2 to the subject line, and mark the old version as obsolete in
patchwork. (http://patchwork.openembedded.org/project/openembedded/list/)

Best regards, Frans


