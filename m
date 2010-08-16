Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ol4up-0005v5-Tg
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 21:00:12 +0200
Received: by gxk2 with SMTP id 2so2115708gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 11:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=zV4QmWkBIpeNzlEk+BDOaWMemAR465b1YBb961gu/lM=;
	b=vFshLc9ZLCoT8oRWJSZFVFgLC5CYzbP6J0eK+HXm8zWn310pLUV8UsBlBm4MjCI3o7
	XxXlX2jKFO+aL4hFnos8u0Eo2RIjuxGb+l0lVOUFiGuKf3RXnUtn1qnjO15/uuwrZ3e1
	GcNpSpfMIK5u119fPNwDoFvgQO4JIPOwu0J2s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=H4BfDPdkLiVuoM5aE8QocuE+U5hqjV4iwsBD3iGOJcoRVt+enAQJoxK8vxVPkoYmvk
	oXomziBHDFggJ6nmeO1R+FTkgoSAeQ1SF4Nxt6p1UIKS71IAlOFXMjFk7dsZ7ZDBlh9a
	uZefHUKVk6d+oKKDaJ479jRT6lEq1mYhDWbjc=
MIME-Version: 1.0
Received: by 10.231.149.3 with SMTP id r3mr6301851ibv.109.1281985193660; Mon,
	16 Aug 2010 11:59:53 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Mon, 16 Aug 2010 11:59:53 -0700 (PDT)
In-Reply-To: <1281983778-21054-1-git-send-email-khimov@altell.ru>
References: <1281983778-21054-1-git-send-email-khimov@altell.ru>
Date: Mon, 16 Aug 2010 20:59:53 +0200
Message-ID: <AANLkTi=gLCkfgLPgJT9oVVxxsfP10uf7w7r02Z5mBkOW@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] openssl: update 1.0.0 to 1.0.0a
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
X-List-Received-Date: Mon, 16 Aug 2010 19:00:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

Rhoman, thanks for the patch.

One small question: Do we want to keep this recipe at
DEFAULT_PREFERENCE = "-1" ??

Frans


