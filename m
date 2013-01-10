Received: from mail-ob0-f182.google.com ([209.85.214.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TtMPM-0000kR-9f
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 18:59:16 +0100
Received: by mail-ob0-f182.google.com with SMTP id 16so836257obc.41
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2013 09:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=/5DMa8PuAysFY680YyeL51Qh7GbZCQFLxvqRWqjTlSc=;
	b=G4T6Ct7iGYAQ5Gra46ZLqbngNVB10ONWaXqZpMdyqrAqN8v+B1Yc95wEVJxwjnBOzF
	77f9vGf5KDnLO6vVrTaWI/dHdpmNDQqOmbef1UvPk4dADZRzj3sZb/hkSOdvNvP6jo5I
	pOKE7FPjg6TEDle3NVqwbGbfDHMTV4ZHjzqdg2BsEPpLKugeKDVnt3kmxmZagrYCFqQz
	RSYZzMblG61vZrDPYM1SfF8/a/twR1stqWiHP4NjlOmPpOB4F/2DtP/dqjoPgAnEgW5E
	TmNM8wHjbCiAz8ITFPEriJOoTivAdH/+JWbeGiCmuOpL0A3dRPQgCrmP50wn7Dbs3ovj
	bsDA==
MIME-Version: 1.0
Received: by 10.60.10.230 with SMTP id l6mr42821164oeb.94.1357839842070; Thu,
	10 Jan 2013 09:44:02 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Thu, 10 Jan 2013 09:44:01 -0800 (PST)
In-Reply-To: <20130110173023.7cafe23b@e6520eb>
References: <1357834959-9937-1-git-send-email-fahad_usman@mentor.com>
	<1357834959-9937-2-git-send-email-fahad_usman@mentor.com>
	<20130110173023.7cafe23b@e6520eb>
Date: Thu, 10 Jan 2013 15:44:01 -0200
X-Google-Sender-Auth: jOyTCRf7lnYQfX9jQRxe7ZmG68g
Message-ID: <CAP9ODKrdGa5EFy_KddpA3he5ar+sBhVWANWGXAqPgzUqfh3wEQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH 2/2] chromium: fix dependencies
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
X-List-Received-Date: Thu, 10 Jan 2013 17:59:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 10, 2013 at 2:30 PM, Eric B=E9nard <eric@eukrea.com> wrote:
> Hi Fahad,
>
> Le Thu, 10 Jan 2013 21:22:39 +0500,
> Fahad Usman <fahad_usman@mentor.com> a =E9crit :
>
>> * fix dependencies to build chromium package successfully with current s=
tate
>>   of OE
>>
> OK so we need to create a danny branch and apply this one only on
> master.
>
> May you please tell for which targets you tested chromium with these
> patches ?

I have created a branch to fix firefox build with danny.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


