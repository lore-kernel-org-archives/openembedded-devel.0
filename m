Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OxbIg-0004c5-Jb
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Sep 2010 10:00:35 +0200
Received: by mail-iw0-f175.google.com with SMTP id 2so4150389iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Sep 2010 00:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Go1u+6ibEWTgyrqUOVPkI125pHaJuJ3BzQGJuGAZ4N0=;
	b=DZT3mzU3lmm+JG1sM6wbtl4NbqFu+Lx0pnamOKmS8CBqUwK4IIBAg+eY/e3gK2Kvlr
	4TFSLF3XGcoO2dx/MevAcqhPIyQTUva38i55z1fRTA1SX+JILZ8nCPRVw1fmyjw60sik
	442Qls5oCD0UiLI6dF3zMmzqUoaFx/f6SmYRs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=DQrkYn5uH1ge4whb/dLLTQ3QReF/Ts/6ab1hk+P9B+jRKa80XLPuKR6BnzDaFH+qXs
	zpGJpXgklcthYDT6oG8BzHbS4K2wVBkG0s8rjcKek4mgCtWhxMMEtQ83yICtsYX4Qfk/
	DL6ENrBJNklf8v0Ii5NbbWLxixHHwi+Ic4cmc=
MIME-Version: 1.0
Received: by 10.231.152.146 with SMTP id g18mr9943666ibw.48.1284969582339;
	Mon, 20 Sep 2010 00:59:42 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 20 Sep 2010 00:59:42 -0700 (PDT)
In-Reply-To: <1284048433-20991-2-git-send-email-eric@eukrea.com>
References: <AANLkTi=KDR=mtuVUiQE-5_-FL4oR+meQssfeUgz6bBLq@mail.gmail.com>
	<1284048433-20991-1-git-send-email-eric@eukrea.com>
	<1284048433-20991-2-git-send-email-eric@eukrea.com>
Date: Mon, 20 Sep 2010 09:59:42 +0200
Message-ID: <AANLkTinC7Pk14gTaC8e-izZP_Khh1gu=vBV2n_=Vt0w-@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/3] python-2.6-manifest.inc: regenerate the file
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
X-List-Received-Date: Mon, 20 Sep 2010 08:00:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/9 Eric B=E9nard <eric@eukrea.com>:
> the patch is quite large because packages seems to have been reordered
> in the generator but excepting python-dev everything is still present.
>
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
>
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


