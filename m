Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rxl5G-00042J-6a
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Feb 2012 21:04:10 +0100
Received: by vcbfl15 with SMTP id fl15so1164257vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2012 11:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=2N09P6zZFhWzWLHRyDgt8UPEJjmvW63N9I7R/kB293g=;
	b=xFgK9hogAUAx8SGowXLgpqO9xmZftReXnAK0HzyeeQhNUGj7Qeq47FlSvtPQsDEIi+
	e1V0HiHZTTEInUlrq/Q88VAQJkTkZAOcw4dj8k/5iXqbDjS7UOKuDfPwX6LOdJ4joFSl
	w5v/GuFCYJSG3+nYmxneBDSxuW+bZcd7/K9JI=
MIME-Version: 1.0
Received: by 10.52.72.107 with SMTP id c11mr11747566vdv.48.1329335756119; Wed,
	15 Feb 2012 11:55:56 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.3.84 with HTTP; Wed, 15 Feb 2012 11:55:56 -0800 (PST)
In-Reply-To: <CALbNGRQp1xFLUECjtg78gy1-8vYpUwB-G4xjCKn_80paA2Ymnw@mail.gmail.com>
References: <1328925603-2967-1-git-send-email-schnitzeltony@googlemail.com>
	<1328925603-2967-6-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKqeT+AZKUUiyYkbq4sKmo2espHinOfeBLQ0TfYEJZ3MfA@mail.gmail.com>
	<CALbNGRTiMWuLSuXsKfQV4ntHfVY5ovuBYrD0w41790Qa_u79Jg@mail.gmail.com>
	<CAP9ODKotC11Gh+bcOz9vgqNMacdwykydJ1G=e7rjr_HKVa6U4w@mail.gmail.com>
	<CALbNGRQDy7E4ND7amsgiBuzo12o=umbW1kokYBgqyPoTaXbTCg@mail.gmail.com>
	<CAP9ODKoXeBf_vctM7pcHTZd2-fMacN+kk8z9af18h9rkyDGVWQ@mail.gmail.com>
	<CALbNGRQ1uf__SnyW5nz1mfOh45DgKyVmjQ3oFS-VBLOyiHVZig@mail.gmail.com>
	<CAP9ODKq=i_jLUHcB+L1marL7Ymz261LZGC26Q49Bfvm+E4tm5g@mail.gmail.com>
	<CALbNGRS-g-kXkEYdxkcwbAum2kqbg5a79=QCoV8eYm2TpwWh9w@mail.gmail.com>
	<CAP9ODKqXfNBpQ7J6rEcFkFKXX5LspymGtQ0SNBh_jMX=pGyFHQ@mail.gmail.com>
	<CALbNGRQvP7A=oz6mtM8hZ6wO6+esQQ6KR4nmV4DXhY=eonAAtA@mail.gmail.com>
	<CAP9ODKo3A3AMqLR701E39V5MykwUS7f55phQmGSNq6WdXFfYtA@mail.gmail.com>
	<CALbNGRTDR1zLZCUPfpUnXN_ezEpX0ehqo8ubY3Dafr4rw8_jDg@mail.gmail.com>
	<CAP9ODKq2MjMnz7wEVA+ho5HWntxFw42e6rVuc-7VLob-9hzFfQ@mail.gmail.com>
	<CALbNGRQp1xFLUECjtg78gy1-8vYpUwB-G4xjCKn_80paA2Ymnw@mail.gmail.com>
Date: Wed, 15 Feb 2012 17:55:56 -0200
X-Google-Sender-Auth: jC1QdIv_brOTc46TWSfVqV0mPSE
Message-ID: <CAP9ODKr9O8Ff2PPDBfTmgOYwJT8sExKcGs00-PfvzS=3O31dGw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe 6/7] systemd.bbclass: automatically extend FILES_* for systemd packages
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
X-List-Received-Date: Wed, 15 Feb 2012 20:04:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 15, 2012 at 17:53, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

> For test I did with a bunch of recipes
>
> 1. build from scratch with unmodified sources
> 2. Applied sytemd-patches and the 'cleanup'-patches (removing obsolete
> systemd code in recipes)
> 3. build recipes again
> 4. compared the results with buildhistory
>
> Results are as expected except one issue I don't understand:
>
> The sizes of the *-dbg packages are reduced. Some reduce to less than
> half. Has anybody a good explanation for this?


No good guess about possible reasoning.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

