Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SqpmT-0004xF-Fw
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jul 2012 20:12:25 +0200
Received: by eaal1 with SMTP id l1so1526617eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2012 11:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=OBx2kKKoSnoTsaS74Nk06O/hbN8Cym5OAzjec31Ll+Q=;
	b=RJhLXoFYxtGyFsk6Bs33HBlAFja24h/CVnWhudKJ7j0bCRmjRG8RURlRUs1PQnmtoz
	UBrku3FLXwbJC77xRx/N7MqlYJGALsBCpa3b1VgC3xeeYuzakuAEngNq1zZVNqBo7EUK
	nBqGbYQKRPzP3C7n1EOL8EcV+iP+84uBCgSspsRCUl9nrQ7Krrq4iSc6PUszDsNWKz+v
	QtnpGMIjGJoJ/xI4mKbTEvqVDdvEg0DE43hrayznDQs0E7fEF/7zXS+s4pZnuy5ysXXx
	jm3uxqLwkXts5Ci/xH6HcnpGPNBkrc80hOBthhdSmQfv95A4aUVYDvzPecGPJ5CawAaf
	S+gQ==
Received: by 10.14.211.132 with SMTP id w4mr10263665eeo.39.1342461667246; Mon,
	16 Jul 2012 11:01:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Mon, 16 Jul 2012 11:00:37 -0700 (PDT)
In-Reply-To: <20120716175819.GM3729@jama.jama.net>
References: <1342460316-5489-1-git-send-email-raj.khem@gmail.com>
	<1342460316-5489-3-git-send-email-raj.khem@gmail.com>
	<20120716174642.GK3729@jama.jama.net>
	<CAMKF1so4v-Sjm6sgHY4U_d7CwwwGp4DfQc0CSOq75n2kFwYvvA@mail.gmail.com>
	<20120716175819.GM3729@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Jul 2012 11:00:37 -0700
Message-ID: <CAMKF1sqmBCMU4WgjzVWfukUpxV4enTs_7=bSw+kFhUWUEQ+HeQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC][meta-oe][PATCH 3/3] blacklist.bbclass: Move to meta-angstrom
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
X-List-Received-Date: Mon, 16 Jul 2012 18:12:25 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 16, 2012 at 10:58 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Yes, but that would require distro config to be updated from
> ANGSTROM_BLACKLIST_PN to PNBLACKLIST[pn] at the same time this class is
> moved or duplicate all blacklist entries now and then remove
> ANGSTROM_BLACKLIST_PN after it's moved..

synchronisation can be worked out if you are willing.


