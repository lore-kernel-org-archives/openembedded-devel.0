Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RaXYO-00005B-3M
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Dec 2011 19:58:16 +0100
Received: by eaal1 with SMTP id l1so1880755eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2011 10:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=j8Wa1DtPRPlzoKCnXrKeR0fwY1ZDHQqBAW1vhqoiDBQ=;
	b=LfZB9q7G0Taw9te+RrGwEn19YrsnJGFbJic1Lf9/Nlla5uLJi17ic14Tbhw271g6xT
	E/7B1bjx/sRPjsrFY8KDwvdx3ZBAHL9Ny0roFulhB82BorYd5eVCDtlXZJx1JZbGKSuQ
	80ZxTehoWwE4bAPVOGdjLvVisUA5sTWECe0C8=
MIME-Version: 1.0
Received: by 10.204.157.25 with SMTP id z25mr11881249bkw.37.1323802277977;
	Tue, 13 Dec 2011 10:51:17 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.42.137 with HTTP; Tue, 13 Dec 2011 10:51:17 -0800 (PST)
In-Reply-To: <jc86fu$pem$1@dough.gmane.org>
References: <cover.1323772986.git.otavio@ossystems.com.br>
	<dd9bd4910b7278f024c9602b8d0cc162efc485fa.1323772987.git.otavio@ossystems.com.br>
	<jc86fu$pem$1@dough.gmane.org>
Date: Tue, 13 Dec 2011 16:51:17 -0200
X-Google-Sender-Auth: 1rwN3aIzjkr38-b4jyF8JaCWwHg
Message-ID: <CAP9ODKpz+RsFfTPqztX6yXM25n+ng813hJ6xJMrMHmn9LN4Cdg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH 3/4] dropbear: bump epoch to ensure an upgrade path and cleanup packaging
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
X-List-Received-Date: Tue, 13 Dec 2011 18:58:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Dec 13, 2011 at 16:45, Koen Kooi <koen@dominion.thruhere.net> wrote:

> I'd really like to avoid PE in bbappends for obvious reasons. Can we get
> this into OE-core instead?
>

I can send a patch to them for this but in meanwhile this ought to be
merged as currently dropbear is at broken state.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

