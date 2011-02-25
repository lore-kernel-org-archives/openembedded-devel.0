Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PszQB-0003hd-2i
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 16:17:31 +0100
Received: by bwz10 with SMTP id 10so2096989bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Feb 2011 07:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=y6Kc3w3btnBJv3Kx9aQIlxXLSoTK/mwsb+gNzw0Vv0U=;
	b=hqZ1TWcuzRpMjlYKPenenP19HPr5CdXjkmmKt1AYTw/Nd769DnNNzKL5yzqsBbeCKC
	qER+WaC7jnoLbaw1Wk2zO6pIlRZCp1dUun5wnVb5G7+dpUmuBqpx3aiz43BCI+mLb+7Y
	RyZjhu10LOehLBE6RoqsZbWK/Q9ldQZ3+dqts=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=DXHWQLkMA6Ng8ZHEdWKggxyNASm5zKKp3VRyaZko7z6BFRAG6VFhKYFVnyqOas0utF
	2A2TSF8p/ERGM0j/wXRwa7XqnEngpT+zn7ZI0jh+04Zem60FqtN69mDs6gkwN/dVd2e+
	ckVdeongh+mX2QYXCkysBjRyAuNrdguzNvrUI=
MIME-Version: 1.0
Received: by 10.204.59.76 with SMTP id k12mr2211135bkh.70.1298646901673; Fri,
	25 Feb 2011 07:15:01 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Fri, 25 Feb 2011 07:15:01 -0800 (PST)
In-Reply-To: <AANLkTinzw2OKZ0RTGEOgNf_i=X7qZhTj0R2epjc+FqTU@mail.gmail.com>
References: <1298645128-32394-1-git-send-email-otavio@ossystems.com.br>
	<AANLkTinzw2OKZ0RTGEOgNf_i=X7qZhTj0R2epjc+FqTU@mail.gmail.com>
Date: Fri, 25 Feb 2011 15:15:01 +0000
X-Google-Sender-Auth: IlrSM-u5p-by6Dc_qDqu47qSKGE
Message-ID: <AANLkTinBVU7rYfS8GPK0v=-d1aWQM1nOXcd1rdrf7paa@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] linux: update 2.6.37 to 2.6.37.2
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
X-List-Received-Date: Fri, 25 Feb 2011 15:17:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 25, 2011 at 15:02, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Commit message should say update from 2.6.37.1, not 2.6.37
> otherwise ok.

I disagree. The recipe is 2.6.37, not 2.6.37.1.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


