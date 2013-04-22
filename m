Received: from mail-ob0-f170.google.com ([209.85.214.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UUOeD-0006Fm-8D
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Apr 2013 23:51:44 +0200
Received: by mail-ob0-f170.google.com with SMTP id eh20so4849699obb.29
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Apr 2013 14:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=oJLcofCGCBs7S063n/NDYSokxtTFxCMj01YtsbWzbr8=;
	b=tbUfVGlzbn8tvgt61xyo2N18MCsOdrpBTzC5oGD+/LWpgA1+YzA/KqdoaQSuVDNn3Y
	kqviq/Jn9ftx07i4oubxV8geIrXR9b7ogbItIes1OCQjLqFkHzRa9z76i2Rqd1H/wMQ1
	MT2+wr5NJXuaO1IyN0wamfK5ENFANZeX5jT7tq7HFbrJulbiuLkA386uLiNQlmDfu1VN
	6f9HVv8INunt9hVUAnzEornqCEf0Kw/RUZTLoOkAVQ+TE/+3XVTE0WDLWb5jgpl6ewz+
	3mPPLmmXUKt198908xbtktmBmOj4WsQ+PBKP/JInRNzuFz2Th8ICUT2p7f0AIRUE2560
	8o2g==
MIME-Version: 1.0
X-Received: by 10.60.37.36 with SMTP id v4mr11319076oej.53.1366666441256; Mon,
	22 Apr 2013 14:34:01 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Mon, 22 Apr 2013 14:34:01 -0700 (PDT)
In-Reply-To: <20130422230506.3bcae5b2@e6520eb>
References: <CAP9ODKraNHQ1cwW8Q+aqqDJ1ChSg+5dqoPNe=dA=TZNALu-4kQ@mail.gmail.com>
	<20130422230506.3bcae5b2@e6520eb>
Date: Mon, 22 Apr 2013 18:34:01 -0300
X-Google-Sender-Auth: 7pqyNvNfkXO3LzzrSfW3qh7Fsd4
Message-ID: <CAP9ODKqa-T9S59uMHfeHg6oOAV1SQCGD0PoVEKaSf8fTK9hvMg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [for-danny] Changes for backporting
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
X-List-Received-Date: Mon, 22 Apr 2013 21:51:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2013 at 6:05 PM, Eric B=E9nard <eric@eukrea.com> wrote:
> Hi Otavio,
>
> Le Fri, 19 Apr 2013 10:54:25 -0300,
> Otavio Salvador <otavio@ossystems.com.br> a =E9crit :
>> * 1bceff8 libgsf: update to version 1.14.26
>> * b2aa32e goffice: update to version 0.10.1
>
> both these patches where hand edited because of tab/space mix following
> 45830a39bb47a9eab27980d52966226c9504ea4 please check that the result in
> danny-next is still OK on your target.

I started a full build with it.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


