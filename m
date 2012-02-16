Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RxyF1-0004nM-TK
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 11:07:08 +0100
Received: by vbbff1 with SMTP id ff1so1543862vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2012 01:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=r5S4kvyHBxn1BEfZdBIYn0YMVMZavXB1eAyXiawUwQI=;
	b=BfNtHpQavYO0j9LYUFbivRi9yFP6Hp06nAI95nHnHODSyk9iDHFOdDeTsaugG9UngA
	3cEiXVY6QasoDqFZbNNeZJ5UDAgETXCFeGlm0CULXgo3WKPZ2lXkjtjaKYcPXipWnT3w
	nzODaNTwAH3yEAs9X3MyPF+DUu/GOJEuiKcFo=
MIME-Version: 1.0
Received: by 10.52.67.229 with SMTP id q5mr758699vdt.14.1329386334810; Thu, 16
	Feb 2012 01:58:54 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.3.84 with HTTP; Thu, 16 Feb 2012 01:58:54 -0800 (PST)
In-Reply-To: <1329357796-27398-3-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<1329357796-27398-3-git-send-email-schnitzeltony@googlemail.com>
Date: Thu, 16 Feb 2012 07:58:54 -0200
X-Google-Sender-Auth: LTROQCMJHLljgQdAO6YM71N11IY
Message-ID: <CAP9ODKo=b4rnmQb756h4NoSnVh3+D=SPak=-92rZ9W_5qN_VvA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][v2] 02/22] systemd.bbclass: enhance checks for SYSTEMD_PACKAGES and SYSTEMD_SERVICE
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
X-List-Received-Date: Thu, 16 Feb 2012 10:07:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2012 at 00:02, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

> The code in populate_packages_prepend to set SYSTEMD_PACKAGES to ${PN} as
> default was removed.
>
> V1 -> V2: Do not check configuration variables for cross and nativesdk
>

Those notes ought to be removed in last send, prior merging.


> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

