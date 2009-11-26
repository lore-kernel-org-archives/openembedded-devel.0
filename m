Received: from mail-fx0-f216.google.com ([209.85.220.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1NDSH0-0006Mu-7p
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Nov 2009 01:31:53 +0100
Received: by fxm8 with SMTP id 8so261940fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Nov 2009 16:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=QOaz7nLxVsWkyZnYvbFEKD2i32njzSCMGfFTKVOUFFo=;
	b=eaJjKoX5H0TLBHt1hMlHz90mQGkC+xj8YgL8bQA8UZ9Pg55iGhbJhevGuv+aZIZDNQ
	OAqf6xziJtfSuM/WQN/k0OFVYMBX5IKed3YtxnhooLrpvBgBAOGtERU4ajLsPdYD+k1F
	t7ISBbiCtM4EpirtXoR4a6hUUsqOxl4DjRwz4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=votD4jPimeITxYrqeeM7PzsNuTJXvmhEi6KIsJHYMq4oytxV3JViczLvVpIMyKfl/t
	UtJszgrt3fSevYyoI8BSDhQsX3D7dsa7o9OlDZCgc6U3X1WrUn33bTU363xR9Hv/Pnbx
	qqs4IHrgoFHkhuZkeQRQsRmHZPEJzpF71mREI=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.139.199 with SMTP id u7mr820772hbu.96.1259195419928; Wed, 
	25 Nov 2009 16:30:19 -0800 (PST)
In-Reply-To: <ae9c9a1c0911251102x3e727255l94dcb5f75e36a158@mail.gmail.com>
References: <ae9c9a1c0911251102x3e727255l94dcb5f75e36a158@mail.gmail.com>
Date: Wed, 25 Nov 2009 22:30:19 -0200
X-Google-Sender-Auth: c86774765e90bdcc
Message-ID: <be7a9f3d0911251630o2c6d2cc8x3e43720dd562657c@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.216
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Commit access to rsalveti
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
X-List-Received-Date: Thu, 26 Nov 2009 00:31:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Ricardo,

On Wed, Nov 25, 2009 at 5:02 PM, Ricardo Salveti de Araujo
<ricardo.salveti@openbossa.org> wrote:
> Currently the plan is to merge Mamona commits into the repo and keep
> using the main OE repository for development, avoiding working as we
> did before.

This is not up to me however I'd be better post the branch with
initial changes for review in the mailing list. This is specially for
changes that could affect other distributions.

I do support your commit access but after few review cycles to avoid
possible mistakes.

My 2c.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


