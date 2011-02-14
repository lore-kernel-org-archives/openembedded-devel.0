Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Pou0t-00014L-7T
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 09:42:31 +0100
Received: by qwi2 with SMTP id 2so2774059qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 00:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=i7DkY09FmGpnQiWk6Xfw0QowG+LNaxJvRTSk06Jbui8=;
	b=a6vm1tk4aZ5q9bc9DnaKiX3+i/eRywH4UQ98WgAGqwULSrAsWR5hM2UCy19JKMDeoU
	Zd/7t9H2gqazlFji/HQQpg6+ftyd3v0uGbiADbIJ+Hn8Hio8wJS5VwDaml/LC/xwB3+U
	QCULNuIz/mI0eFKXy/rVIUZpERxG1tLyyUSfo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=L5YHBjpm1KVEcbocYoUkYfWQIB1wC+YVPkvIYA8twoBZJKgNzPAsMwRyqB5mmZYQC+
	3k2va849WTv+CKjr+38DjMlWhSuL8CLcY4LEttCOb8Oh5siEv97QudO0dzHZ4NmWJgxT
	Bin2IxbptrWoc4HXAGsDSLDynUcBXH6zm0jwg=
MIME-Version: 1.0
Received: by 10.229.91.2 with SMTP id k2mr2484794qcm.260.1297672881963; Mon,
	14 Feb 2011 00:41:21 -0800 (PST)
Received: by 10.229.193.10 with HTTP; Mon, 14 Feb 2011 00:41:21 -0800 (PST)
In-Reply-To: <AANLkTin6yU9dhM1oE9C2jahVg-qkHcHtKEpauZv6Qs9w@mail.gmail.com>
References: <AANLkTikP8CNgvex==mnJY8McTouY0n-QzcUQjaFZRV8X@mail.gmail.com>
	<AANLkTimuHfSAgfYK5V6zPAEG=MBCi_Am1_9rMq=M9xur@mail.gmail.com>
	<AANLkTin6yU9dhM1oE9C2jahVg-qkHcHtKEpauZv6Qs9w@mail.gmail.com>
Date: Mon, 14 Feb 2011 09:41:21 +0100
Message-ID: <AANLkTino7hjrF51Jb6UWEL5A+teV963cDsgBhCqVZZwF@mail.gmail.com>
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Problem with dependencies in packages
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
X-List-Received-Date: Mon, 14 Feb 2011 08:42:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 2/14/11, Graham Gower <graham.gower@gmail.com> wrote:

> In fact the dependency shouldn't be satisfied here. Opkg should fail
> the same way as dpkg is failing.

What should be done then? Should the ncurses recipe be fixed or package.bbclass?

bye,
Filip Zyzniewski


