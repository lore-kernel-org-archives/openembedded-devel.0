Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SHZHC-0000dO-CN
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Apr 2012 13:30:22 +0200
Received: by vbbfr13 with SMTP id fr13so3151854vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2012 04:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=uWkqi61chH8jl5AM8SGbKgkJE7NeBoI/xrkyZ/+yfOk=;
	b=c/PbKM/tvreHYfc36Hb68ZMdLKptnyQKU9j6MANKuAcWdd/JlqU6WF0YWtvH3PXi5z
	SYkHWIng5IHW/bcC4efUsmcjKJ3ayb4Ujsk9unQtZHTxdc9eIuBOlem1vod9LQF7WkfX
	0aTR5qqRFQT9c33q5ljTua2EOkpL8RKxTGjGERi9mvUCfjaqidqu4JKOsMYERjbGLZQn
	5Us6mpwOCJOOSz7QEmYZFj6aU5u2JeDZrYX6xEULgDYVwkjfsuYjieNrWxgSgvfOW3yv
	EdQEVB9SuDdbBjHLqvHGL6FGH2xrKoI4O+BKAb85J/YX87vMSsoGwQVE+/rmTLijA6Q/
	yd0Q==
MIME-Version: 1.0
Received: by 10.52.66.11 with SMTP id b11mr4484864vdt.67.1334056864504; Tue,
	10 Apr 2012 04:21:04 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.2.195 with HTTP; Tue, 10 Apr 2012 04:21:04 -0700 (PDT)
In-Reply-To: <c55ca91ae7203a1fe164a1a91230b970fc075759.1334037469.git.Martin.Jansa@gmail.com>
References: <cover.1334037469.git.Martin.Jansa@gmail.com>
	<447016b1ed3811830299ad0145a8e3216abd50c4.1334037469.git.Martin.Jansa@gmail.com>
	<c55ca91ae7203a1fe164a1a91230b970fc075759.1334037469.git.Martin.Jansa@gmail.com>
Date: Tue, 10 Apr 2012 08:21:04 -0300
X-Google-Sender-Auth: AouC76CRcmbNbXl2W7TVb6oQcHo
Message-ID: <CAP9ODKo2F1TReTMFrXgKKH7-g9n_DbNUJHLM6uZGUdYbxF_T8Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 2/2] xserver-nodm-init: add EnvironmentFile
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
X-List-Received-Date: Tue, 10 Apr 2012 11:30:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 10, 2012 at 02:59, Martin Jansa <martin.jansa@gmail.com> wrote:
> * used to set HOME variable before /etc/X11/Xsession is started
> * e.g. enlightenment is creating ${HOME}/.e and without this it ends in
> =A0/tmp/.e and during startup HOME gets defined and switched to
> =A0/home/root/.e
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Agreed :-)

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


