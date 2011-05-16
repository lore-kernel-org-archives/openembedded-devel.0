Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QLx1W-0005az-27
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 14:35:46 +0200
Received: by bwz5 with SMTP id 5so4098808bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 05:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=NfHut89I/18mVqxkHbcA2uWzb8PAei61i8V9kLne6z4=;
	b=GkeX8tYZSRHjNPN6gcxiLhKJCTE8mEb1JDn0mJmFMmvubPTP77f9Jv5Mcw+4IVqF2p
	gzrwJiFGt8J/ByWarpvX9eIkch8z8ijmscMoBv6+pM5AnuO6kKF1dgG5637jfRGIKK0K
	hpiZzhv2gw22J+R+l0oqooMKLWjBQ950uCOrs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=AuIs9DB70c7LLAnBCobPbizmWpO2QXj+oiiMReDSKiuK27R478tg4QYUXhNEAqahHh
	/fcRoTZ8yOQJWM/j1TArEgPKG22Uzwn+lqJaopuHikOC4Q3Sd+zSNi7EsIAmdtIfgkRZ
	6X88EvMItxvTvvQjbMV7SS4SUvEHu+iXfPkFA=
MIME-Version: 1.0
Received: by 10.204.7.209 with SMTP id e17mr409563bke.162.1305549173955; Mon,
	16 May 2011 05:32:53 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.79.70 with HTTP; Mon, 16 May 2011 05:32:53 -0700 (PDT)
In-Reply-To: <1305548385-10942-2-git-send-email-otavio@ossystems.com.br>
References: <1305548385-10942-1-git-send-email-otavio@ossystems.com.br>
	<1305548385-10942-2-git-send-email-otavio@ossystems.com.br>
Date: Mon, 16 May 2011 09:32:53 -0300
X-Google-Sender-Auth: dnAiVqyOSzGkNF1Oj5lJtz9MHpc
Message-ID: <BANLkTi=Hy6WBeNU2cW2cdKUNHMsFZAoPbw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v1 2/2] freerdp: update to 2011-05-14 snapshot
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
X-List-Received-Date: Mon, 16 May 2011 12:35:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, May 16, 2011 at 09:19, Otavio Salvador <otavio@ossystems.com.br> wr=
ote:
> This version includes major improvements since last version
> packages. It also had the plugins packages redone so they can be
> choosen depending on the environment needs.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

People, please review this one but don't merge it since we have a
color conversion bug on this revision being tracked down. Once it is
done I sent an updated one.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


