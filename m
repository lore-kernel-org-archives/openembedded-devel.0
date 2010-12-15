Received: from mail-ew0-f44.google.com ([209.85.215.44])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1PSuOo-00022y-PU
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Dec 2010 17:40:19 +0100
Received: by ewy8 with SMTP id 8so1397626ewy.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 08:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=rlRTmgyhqDoa5CBnTFqvJZRFoqLRR8ifMeTHKJVSazc=;
	b=jj6D1d2dt53jsQfM/VWAhBfiqraM3cBlS1fSXHSYXWLvjHJIjv34sT91cfdNrEijjg
	ydlVxe/cky6F0z1M+zFSGMcdBvMoASU/mE0+ukFK3tzFJOu5q39IESVTr5FHRwgKzQI8
	NMQVimSG1lCDmfC0D7aFaMnae/+L2iOsryo3E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=IcuBT+50e+sxI5qA2mCb96b3M3AD3NR6vMdcE3Y1aDQzb+zA/BeuNnzAg6a7Cxb1fm
	eDV8h83IWp8UP+ciUEPa785nT5851JSprtWTseV39/O/jFPxnuMA0KjyT/M1LhFQnBth
	pltx9rgtiQt5zOv3J7Xk3JWr8HQuoxJb+cVO0=
MIME-Version: 1.0
Received: by 10.204.103.133 with SMTP id k5mr1888449bko.53.1292431122986; Wed,
	15 Dec 2010 08:38:42 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.71.8 with HTTP; Wed, 15 Dec 2010 08:38:42 -0800 (PST)
In-Reply-To: <AANLkTik+TNUXiWsBu5nY1wN3yR-qK4qAeSe3REbmysrD@mail.gmail.com>
References: <AANLkTik+TNUXiWsBu5nY1wN3yR-qK4qAeSe3REbmysrD@mail.gmail.com>
Date: Wed, 15 Dec 2010 14:38:42 -0200
X-Google-Sender-Auth: 3QRes1I-tt_FoHPgF3CjN3QepAQ
Message-ID: <AANLkTi=qrrG5WWTNrYHfBB9Sx==cpYAjctPOu47DaBZp@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.44
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Variable typing support
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
X-List-Received-Date: Wed, 15 Dec 2010 16:40:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2010 at 14:31, Chris Larson <clarson@kergoth.com> wrote:
...

I think it is a nice features specially because it makes harder to
have multiple meanings for same type.

+1 from me.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


