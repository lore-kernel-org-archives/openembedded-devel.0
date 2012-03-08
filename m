Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S5f36-0002LS-Pp
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Mar 2012 16:14:37 +0100
Received: by vbbfr13 with SMTP id fr13so429849vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Mar 2012 07:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ifdtqdWh5soLhb+kF7UbjBa1K2X8IfQh16kn/aKCp2I=;
	b=Efv8l39WSKyVW1LnsM/A1KoPcqeYXVS+Qk1KEve7ApQ0mswToAlA3z84JyW9MPpPHB
	z/FDyxbuIMjZgJLqskyZV5526FsqPybu5Oph6Onz6wP500m16eUaeIWHYq64vXw7Tahn
	ThYyEF2gGLpPbGlxXbteC6ZeIPvGmi1PyvJxkURPZ94XS9VP+Y/nYci8An1c0O6f+u/w
	VmcJTNhZQ8g0NsZH0YfRhZyGLcCnxKsBDaMdd2rwk8YflfU0hRqgyPBeqwIjf3uWvc5l
	StinBjZ4Dh+M1SlemGjXy5ip9t99sYFplOMaXycEj4Js/G7RAOdx0FY+BNIl3JRpzotY
	Y5vA==
MIME-Version: 1.0
Received: by 10.52.95.74 with SMTP id di10mr10322059vdb.46.1331219158076; Thu,
	08 Mar 2012 07:05:58 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Thu, 8 Mar 2012 07:05:58 -0800 (PST)
In-Reply-To: <48D3D52125C49B43AE880038E2E5314BB5BFAF@SRV101.gdsys.de>
References: <48D3D52125C49B43AE880038E2E5314BB5BFAB@SRV101.gdsys.de>
	<48D3D52125C49B43AE880038E2E5314BB5BFAF@SRV101.gdsys.de>
Date: Thu, 8 Mar 2012 12:05:58 -0300
X-Google-Sender-Auth: HGy9Uyo5VsoBRqyvon1EBvmSlJM
Message-ID: <CAP9ODKq4YxX2EqTRd=wNOD=pWuQSTe+5h-gzBrMEAg96qFEucQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java] Compiling log4j1.2-native fails
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
X-List-Received-Date: Thu, 08 Mar 2012 15:14:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 8, 2012 at 11:19, Eibach, Dirk <Eibach@gdsys.de> wrote:
> Rebuilding with a freshly checked out system without parallelization did
> not show this bug. So maybe one of this nasty parallelization issues...

I've seen some build failures and I also believe it is parallelism related.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


